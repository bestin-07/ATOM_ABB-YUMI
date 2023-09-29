
# Copyright 2021 by Bestin Antu, SSET.
# All rights reserved.
# This file is part of the ATOM -> Advanced Tele-Operation Method,
# and is released under the "MIT License Agreement". Please see the LICENSE
# file that should have been included as part of this package.

#################################  Initializations  ##################################################
import cv2
import numpy as np
import requests  
from mss import mss
from PIL import Image    
import time                          
import math
import socket
cap = cv2.VideoCapture(0)                   # For webcam input
s = socket.socket()                         # Create a socket object 



######################################### CONFIGURATION ############################################

x,y,z=0,0,0                               # To start origin from left bottom
UserPrint = Print = 0                       # For Saving Calibration Angle
xoffset,yoffset,zoffset=0,0,0             # To start origin from left bottom   
zoffset=zoff=zmem = 0                        
Xmax=Ymax=Zmax=650                          # Adjust this value for limiting the coordinate workspace for the robot
calibrationflag = False
Orient = 0
Robot_Position_Flag = False
grip = False
Stabilizer = [[],[],[]]
xavg=yavg=zavg=0

####################################################################################################


def soc(): 
    IP = '192.168.0.251'
    port = 6511                                 # Define the port on which you want to connect 
    # connect to the server on local computer 
    #s.connect(('127.0.0.1', port))
    print("Setting UP TCP CONNECTION")
    try:
        s.connect((IP, port)) 
    except:
        while True:
            if (s.connect((IP, port)) != True ):
                break
                print("trying to connect")
    print("CONNECTED")


####################################### EGM CLASS ##################################################

import egm_pb2
import select
import numpy as np

# Defines an egm object and connect with the server of the robot studio.

class EGM(object):

    def __init__(self, port=6511):

        self.socket=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.socket.bind(('',port))
        self.send_sequence_number=0
        self.egm_addr=None
        self.count=0

    def receive_from_robot(self, timeout=0):

        s=self.socket
        s_list=[s]
        try:
            res=select.select(s_list, [], s_list, timeout)
        except select.error as err:
            if err.args[0] == errno.EINTR:
                return False, None
            else:
                raise

        if len(res[0]) == 0 and len(res[2])==0:
            return False, None
        try:
            (buf, addr)=s.recvfrom(65536)
        except:
            self.egm_addr=None
            return False, None

        self.egm_addr=addr

        robot_message=egm_pb2.EgmRobot()
        robot_message.ParseFromString(buf)

        rapid_running=False
        motors_on=False

        global Robot_Position_Flag,Robot_pos
        if robot_message.HasField('feedBack'):
            if Robot_Position_Flag == False:
                Robot_pos = robot_message.feedBack.cartesian.pos
                Robot_Position_Flag = True
        if robot_message.HasField('rapidExecState'):
            rapid_running = robot_message.rapidExecState.state == robot_message.rapidExecState.RAPID_RUNNING
        if robot_message.HasField('motorState'):
            motors_on = robot_message.motorState.state == robot_message.motorState.MOTORS_ON

        return True, Robot_pos

    def send_to_robot(self,pos,Rob_pos):

        if not self.egm_addr:
            return False

        self.send_sequence_number+=1

        sensorMessage=egm_pb2.EgmSensor()

        header=sensorMessage.header
        header.mtype=egm_pb2.EgmHeader.MessageType.Value('MSGTYPE_CORRECTION')
        header.seqno=self.send_sequence_number
        self.send_sequence_number+=1

        planned=sensorMessage.planned

# The values to write to the robot
        if Rob_pos is not None:
            planned.cartesian.pos.x = Rob_pos.x + pos[2]
            planned.cartesian.pos.y = Rob_pos.y + pos[0]
            planned.cartesian.pos.z = Rob_pos.z - pos[1]
            planned.cartesian.euler.x=-Orient-20
            planned.cartesian.euler.y=180
            planned.cartesian.euler.z=0
            print(planned.cartesian.pos)
        buf2=sensorMessage.SerializeToString()

        try:
            self.socket.sendto(buf2, self.egm_addr)
        except:
            return False

        return True

EGM1 = EGM()


######################################################################################################


def zcalculator(zoff,zoffset):

    if zoffset > 0:
        distance = int(((zoff-zoffset)*Zmax)/zoffset)
    else :
        distance = 0
    if distance < 0:
        distance = 0
    return distance

################################ Formatting the coordinates for robo saftey ##########################

def coordinateformatter(x_x,y_y,z_z):

    def Average(lst):
        return sum(lst) / len(lst)

    xavg=yavg=zavg=0
    x_ = (x_x-xoffset)*(Xmax/640)
    y_ = (y_y-yoffset)*(Ymax/480)
    z_ = z_z*(Zmax/1000)

# Stabilizing the detected coordinates to smoothen out robot movement. This improves life of our robot.

    Stabilizer[0].append(x_)
    Stabilizer[1].append(y_)
    Stabilizer[2].append(z_)
    if len(Stabilizer[0])>10:
        Stabilizer[0].pop(0)
        Stabilizer[1].pop(0)
        Stabilizer[2].pop(0)
        xavg = Average(Stabilizer[0])
        yavg = Average(Stabilizer[1])
        zavg = Average(Stabilizer[2])
        print('avg',zavg)


    if int(z_)<0:
        z_ = 0
    return(xavg,yavg,zavg)

bounding_box = {'top': 300, 'left': 500, 'width': 1140, 'height': 780}
sct = mss()
#####################################################################################################


def triarea(x,y,x1,y1,x2,y2):


    area = abs((x*(y1-y2))+(x1*(y2-y))+(x2*(y-y1)))/2
    base = math.sqrt(((x2-x1)**2)+((y2-y1)**2))
    

    m1 = (y2-y1)/(x2-x1)
    m2 = (y1-y)/(x1-x)
    define_angle = math.degrees(math.atan((m2-m1)/(1+(m1*m2))))
    return define_angle



def grab():                             # FUNCTION FOR INPUT AS SCREEN
    sct_img = sct.grab(bounding_box)
    image = np.array(sct_img) 
    #cv2.imshow('screen', np.array(sct_img))    # Debug Purpose - I dont have a verbose :-(
    return image

# Above function can be used for remote operations eg. Via teams or gmeet.

def cam():                              # FUNCTION FOR INPUT AS CAM
    success, image = cap.read()
    image = cv2.flip(image, 1)
    return image

######################################### PROCESSING #################################################

import mediapipe as mp
import keyboard
mp_hands = mp.solutions.hands
hands = mp_hands.Hands(min_detection_confidence=.5,min_tracking_confidence=.5)


soc()   # Calling SOCKET HANDSHAKE -> Comment this for debugging without LAN


while True:
 
    image = cam()       # for input source as webcam
    #image = grab()     # uncomment for input source as screen

    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image.flags.writeable = False # To improve performance, optionally mark the image as not writeable to pass by reference.
    results = hands.process(image)

    image.flags.writeable = True
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    height = image.shape[0]
    width = image.shape[1]
    GRIP_EN = 0
    if results.multi_hand_landmarks:
        for hand_landmarks in results.multi_hand_landmarks:
            x = (hand_landmarks.landmark[0].x )* width
            y = (hand_landmarks.landmark[0].y )* height

            x1 = hand_landmarks.landmark[5].x * width
            y1 = hand_landmarks.landmark[5].y * height

            x2 = hand_landmarks.landmark[17].x * width
            y2 = hand_landmarks.landmark[17].y * height

            zx = x2 - x1
            zy = y2 - y1

            Print = triarea(x,y,x1,y1,x2,y2)
            Orient = triarea(x,y,x1,y1,x1+10,y1+10)

            zoff = math.sqrt((zx*zx)+(zy*zy))

            GRIP_EN_X = (hand_landmarks.landmark[5].x - hand_landmarks.landmark[4].x)*width
            GRIP_EN_Y = (hand_landmarks.landmark[5].y - hand_landmarks.landmark[4].y)*height
            GRIP_EN = math.sqrt(GRIP_EN_X**2+GRIP_EN_Y**2)

    cv2.circle(image, (int(x),int(y)), 10, (0, 255, 0), 2)

    if GRIP_EN < 15 and grip == False and calibrationflag == True:
        grip = True
    else:
        grip = False

############################################# CALIBRATION AND RESET ########################################

    if keyboard.is_pressed("c"):

        cv2.imshow('MediaPipe Hands', image)
        print("CALLIBRATING")
        calibrationflag = True
        xoffset = Tst[0]
        yoffset = Tst[1]
        zoffset = zoff
        UserPrint = Print
        time.sleep(1)
        print("CALIBRATION SUCCESS")
        time.sleep(1)
        #soc()

    if keyboard.is_pressed("r"):
        print("RESETTING CALIBRATION DATA")
        calibrationflag = False
        x = y = z = 0
        xoffset = 0
        yoffset = 0
        zoffset= zoff = 0
        UserPrint = 0
        time.sleep(1)
        #soc()

####################################################################################################
    
    if Print > UserPrint*.92 and Print < UserPrint*1.08:
        zz = zcalculator(zoff,zoffset)
        zmem = zz
    else:
        print('Keep your palm facing the screen')
        zz = zmem

    Tst = coordinateformatter(x,y,zz)

    if calibrationflag == True:
        EGM1.send_to_robot(coordinateformatter(x,y,zz),EGM1.receive_from_robot()[1])

    cv2.imshow('MediaPipe Hands', image)
    if cv2.waitKey(5) & 0xFF == 27:
        break
######################################################################################################


################################ CLEANING UP #########################################################
hands.close()
s.close()