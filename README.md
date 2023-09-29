# ATOM_ABB-EGM

Implementation of ATOM - Advanced Tele-Operation Machine on ABB Yumi.

[For more details - check here](https://github.com/bestin-07/ATOM)

Abstract :\
ATOM, Advanced Tele-Operation Method is a data capturing technique for teleoperation machines. This approach is cheaper, efficient and also reduces the requirement for wearable components compared to existing methods. It also provides feedback with a unique interface experience by exploiting the virtual reality technology. The VR eyewear gives us the 360 degree vision as seen through the eyes of the robot camera in a remote area. The proposed method uses image processing using the media pipe machine learning tool to detect and observe hand movement of the user, measures the spatial depth using object detection and  converts it into a useful format for controlling the arms of the robot. This gives us the dynamic experience along with an improved situational awareness while dealing with complex and risky operations. This method focuses on the ability of the proposed method to to retrace the users arm movements and gestures with minimum error using an open source 7 DOF -degree of freedom robotic arm (ABB Yumi).


You are required to add egm_pb2.py file to the ATOM_ABB-YUMI-main\Python folder. The egm_pb2 provides the python classes necessaryy for the communication.
I have already added egm_pb2.py in this but do check weather the [proto](https://github.com/ros-industrial/abb_libegm/blob/master/proto/egm.proto) file has been updated from ABB.
To compile the proto file, please check the following [repo](https://github.com/bestin-07/ABB_EGM_PYTHON) 


For more details on egm refer [manual](https://library.e.abb.com/public/dde02053899649ff82bcce4ca3b51556/3HAC073318%20AM%20Externally%20Guided%20Motion%20RW7-en.pdf?x-sign=OFPQqCJJ7M4nj9VsXg9/iV7kpkHykBp98eM089f3dMBEgSZyn9lDnMbOftwOEbyR)


Connect python server to the robot studio server using the local ip and port mentioned in the robot studio (should be same in python).

The class egm is know to both python and robot studio. Go through the egm_pb2.py file to get the value you want to change for the robot and overwrite this values in the python server.

Only TASK1 of robot backup is actually required for the EGM. The TASK1 contains the module1 and test1. Module1 is the brain behind EGM server for the robot and test1 is written by me for controlling the gripper wich uses a TRAP routine to check a different ip Port within local ip to recogonize clenching of hand to send a signal to close gripper and hold it closed as long as hand is clenched. Work your way, fork and develop this code as you wish. Do give a reference to [ATOM](https://github.com/bestin-07/ATOM) the master project behind this idea.