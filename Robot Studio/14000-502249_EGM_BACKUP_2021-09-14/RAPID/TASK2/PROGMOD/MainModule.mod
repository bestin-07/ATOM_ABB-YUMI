MODULE MainModule
    PERS robtarget placepallet_Square{5};
     PERS bool safer_R;
    PERS num tempcount;
    PERS robtarget placepallet_Hexa{5};
    PERS robtarget placepallet_Octa{5};
    CONST robtarget F_square:=[[243.42,87.66,54.68],[9.96264E-05,-0.99997,0.00776031,-2.28255E-06],[-1,2,-2,4],[128.515,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget F_hexa:=[[344.02,86.04,55.34],[7.47327E-06,-0.255959,0.966688,4.82753E-05],[-1,2,-2,4],[-121.497,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget F_Octa:=[[444.18,86.32,54.37],[1.19052E-05,0.707095,-0.707119,-4.33163E-05],[-1,1,-2,4],[-121.67,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS num raw_column_shift_place:=65;


    PERS num square_pickCount;
    PERS num Hexa_pickCount;
    PERS num Octa_pickCount;

    PERS bool Rob2_Square;
    PERS bool Rob2_Hexagon;
    PERS bool Rob2_Octagon;
    PERS num raw;
    PERS num column;
    CONST robtarget square_trans:=[[420.98,201.58,314.32],[0.500371,0.500364,-0.499642,0.499623],[0,0,0,4],[-120.229,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget square_trans10:=[[420.98,99.67,314.31],[0.500369,0.500364,-0.49964,0.499627],[0,-1,0,4],[-120.23,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget square_trans20:=[[420.98,39.45,314.32],[0.50037,0.500361,-0.499643,0.499626],[0,-1,0,4],[-120.229,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget square_trans30:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget square_trans40:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget square_trans50:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    
    
    CONST robtarget octa_trans:=[[420.98,201.58,314.32],[0.500374,0.500367,-0.499643,0.499615],[0,0,0,4],[-120.229,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget octa_trans10:=[[420.98,99.67,314.31],[0.50037,0.500367,-0.499642,0.49962],[0,-1,0,4],[-120.23,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget octa_trans20:=[[420.98,39.45,314.32],[0.500371,0.500363,-0.499646,0.499619],[0,-1,0,4],[-120.229,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget octa_trans30:=[[420.99,-8.94,314.99],[0.500372,0.500364,-0.499643,0.499621],[0,-1,0,4],[-120.23,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget octa_trans40:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget octa_trans50:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget octa_trans60:=[[445.78,198.12,168.06],[2.88617E-05,0.707104,-0.707109,-4.16265E-05],[0,1,-1,4],[-120.227,9E+09,9E+09,9E+09,9E+09,9E+09]];


    CONST robtarget hexa_trans:=[[420.98,201.58,314.32],[0.500374,0.500368,-0.499643,0.499614],[0,0,0,4],[-120.229,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget hexa_trans10:=[[420.98,99.67,314.31],[0.500371,0.500367,-0.499642,0.499619],[0,-1,0,4],[-120.23,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget hexa_trans20:=[[420.98,35.28,314.31],[0.609951,0.609948,-0.357735,0.357698],[0,-1,0,4],[-120.227,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget hexa_trans30:=[[420.99,-8.94,314.31],[0.609949,0.609951,-0.357733,0.3577],[0,-1,0,4],[-120.228,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget hexa_trans40:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget hexa_trans50:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget hexa_trans60:=[[364.63,217.84,234.78],[8.82034E-06,0.707107,-0.707106,-4.52081E-05],[0,1,-2,4],[-120.227,9E+09,9E+09,9E+09,9E+09,9E+09]];


    CONST robtarget lPsyn1:=[[419.31,-6.21,314.85],[0.508083,0.508089,-0.491793,0.491769],[-1,0,0,4],[-150.308,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn2:=[[419.31,-117.57,314.85],[0.508081,0.508087,-0.491793,0.491773],[-1,-1,0,4],[-150.307,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn3:=[[568.80,-117.57,314.85],[0.508081,0.508088,-0.491793,0.491773],[-1,0,-1,4],[-150.308,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn4:=[[450.65,110.99,314.85],[0.503605,0.504521,-0.496407,0.495399],[0,0,0,4],[-150.306,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn5:=[[450.64,110.99,247.99],[0.503606,0.504519,-0.496407,0.495401],[-1,0,0,4],[-150.306,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn6:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget lPsyn7:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];

    PERS tooldata Servo:=[TRUE,[[0,0,114.2],[1,0,0,0]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];
    PERS tooldata VaccumOne:=[TRUE,[[63.5,18.5,37.5],[0.707106781,0,0.707106781,0]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];
    PERS tooldata Camera:=[TRUE,[[-7.3,28.3,35.1],[0.5,-0.5,0.5,0.5]],[0.24,[8.2,12.5,48.1],[1,0,0,0],0.00022,0.00024,0.00009]];
    CONST robtarget SyncPoint:=[[419.31,-6.21,314.85],[0.508082,0.50809,-0.491792,0.491769],[-1,0,0,4],[-150.308,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tasks ALL_Task{2}:=[["T_ROB_L"],["T_ROB_R"]];
    VAR syncident syn1;
    VAR syncident syn2;
    VAR syncident syn3;
    VAR syncident syn4;
    VAR syncident syn5;
    VAR syncident syn6;
    VAR syncident syn7;
    VAR syncident syn8;
    VAR syncident syn9;
    VAR syncident syn10;
    VAR syncident syn11;
    VAR syncident syn12;
    VAR syncident syn13;
    VAR syncident syn14;
    VAR syncident syn15;
    VAR syncident syn16;


    CONST jointtarget Home_pos_L:=[[9.13375,-52.7016,41.6356,53.8664,34.8238,-91.5467],[37.7553,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p10:=[[419.31,-6.21,314.85],[0.508082,0.508088,-0.491788,0.491776],[-1,0,0,4],[-150.308,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p20:=[[419.31,95.00,314.85],[0.508085,0.508087,-0.491789,0.491773],[0,0,0,4],[-150.308,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget lPsyn15:=[[450.64,110.99,247.99],[0.503606,0.504521,-0.496405,0.4954],[-1,0,0,4],[-150.305,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Square_fine:=[[420.99,-8.94,314.31],[0.500369,0.500361,-0.499641,0.499628],[0,-1,0,4],[-120.23,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget square_trans60:=[[364.63,217.83,234.78],[1.00866E-05,0.707104,-0.70711,-3.87937E-05],[0,1,-2,4],[-120.227,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS num count_total:=1;
    PROC main()
        
         g_Jogin;
        g_Calibrate\Grip;
        begin:
        Octa_place_generator;
        Hexa_place_generator;
        Square_place_generator;

        g_JogOut;
        Home_Pos;
        
        WaitSyncTask syn1,ALL_Task;
begin1:

 IF count_total=15 THEN
            Home_Pos;
            ExitCycle;
 ENDIF
        IF Rob2_Square=true THEN
            Rob2_Square:=FALSE;
            place_Square(square_pickCount);
count_total:=+1;
        ELSEIF Rob2_Hexagon=true THEN
            Rob2_Hexagon:=FALSE;
            Place_Hexa(Hexa_pickCount);
            count_total:=+1;
        ELSEIF Rob2_Octagon=TRUE THEN

            
            Place_Octa(Octa_pickCount);
            count_total:=+1;
            
        
        else
            
            GOTO begin1;

        ENDIF
GOTO begin;


       


    ENDPROC

    PROC Place_Square(num count)
        count:=count;
        MoveL square_trans,vmax,fine,Servo\WObj:=wobj0;
        MoveL square_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL square_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL Square_fine,v50,fine,Servo\WObj:=wobj0;
        WaitTime\InPos,0.4;
        g_GripIn\holdForce:=30;
        WaitTime\InPos,0.4;
        WaitSyncTask syn2,ALL_Task;
        WaitSyncTask syn3,ALL_Task;
        WaitSyncTask syn4,ALL_Task;

        MoveL square_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL square_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL square_trans60,vmax,z10,Servo;
        Check_Nearby_square;

        MoveL offs(placepallet_square{count},0,0,30),vmax,z0,Servo\WObj:=wobj0;
        MoveL placepallet_square{count},v20,fine,Servo\WObj:=wobj0;
        WaitTime\InPos,0.4;
        g_JogOut;
        WaitTime 0.2;
        MoveL offs(placepallet_square{count},0,0,70),v100,z0,Servo\WObj:=wobj0;
    ENDPROC

PROC Check_Nearby_square()
retry1:
IF square_pickCount=1 THEN
   IF column=5 AND raw=1 and safer_R=FALSE THEN
       GOTO RETRY1;
   ENDIF 
   
ENDIF
skip:
ENDPROC

PROC Check_Nearby_octa()
retry1:
IF octa_pickCount=1 THEN
   IF column=5 AND raw=3 and safer_R=false THEN
       GOTO RETRY1;
   ENDIF 
   
ENDIF
skip:
ENDPROC

PROC Check_Nearby_hexa()
retry1:
IF hexa_pickCount=1 THEN
   IF column=5 AND raw=2 and safer_R=false THEN
       GOTO RETRY1;
       
   ENDIF 
ENDIF
skip:
ENDPROC
    PROC Place_Hexa(num count)

        count:=count;
        MoveL hexa_trans,vmax,fine,Servo\WObj:=wobj0;
        MoveL hexa_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL hexa_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL hexa_trans30,v50,fine,Servo\WObj:=wobj0;
        WaitTime\InPos,0.2;
        g_GripIn\holdForce:=30;
        WaitTime\InPos,0.2;
        WaitSyncTask syn2,ALL_Task;
        WaitSyncTask syn3,ALL_Task;
        WaitSyncTask syn4,ALL_Task;

        MoveL hexa_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL hexa_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL hexa_trans60,vmax,z10,Servo;
        Check_Nearby_hexa;
        ConfL\Off;
        MoveL offs(placepallet_Hexa{count},0,0,20),vmax,fine,Servo\WObj:=wobj0;
        MoveL placepallet_Hexa{count},v20,fine,Servo\WObj:=wobj0;
        ConfL\on;
        WaitTime\InPos,0.4;
        g_JogOut;
        WaitTime 0.2;
        MoveL offs(placepallet_Hexa{count},0,0,70),vmax,fine,Servo\WObj:=wobj0;
        






    ENDPROC



    PROC place_octa(num count)
        
          count:=count;
        MoveL octa_trans,vmax,fine,Servo\WObj:=wobj0;
        MoveL octa_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL octa_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL octa_trans30,v50,fine,Servo\WObj:=wobj0;
        WaitTime\InPos,0.4;
        g_GripIn\holdForce:=30;
        WaitTime\InPos,0.4;
        WaitSyncTask syn2,ALL_Task;
        WaitSyncTask syn3,ALL_Task;
        WaitSyncTask syn4,ALL_Task;

        MoveL octa_trans20,vmax,z10,Servo\WObj:=wobj0;
        MoveL octa_trans10,vmax,z10,Servo\WObj:=wobj0;
        MoveL octa_trans60,vmax,z10,Servo;
        Check_Nearby_octa;
        ConfL\Off;
        MoveL offs(placepallet_Octa{count},0,0,50),vmax,fine,Servo\WObj:=wobj0;
        MoveL placepallet_Octa{count},v50,fine,Servo\WObj:=wobj0;
        WaitTime\InPos,0.4;
        g_Jogout;
        WaitTime 0.2;
        MoveL offs(placepallet_Octa{count},0,0,70),vmax,fine,Servo\WObj:=wobj0;
        ConfL\on;
        
    ENDPROC



    PROC Home_Pos()
        MoveAbsJ Home_pos_L\NoEOffs,vmax,fine,Servo\WObj:=wobj0;
    ENDPROC



    PROC Square_place_generator()
        !MoveL F_Square, v1000, fine, Servo\WObj:=wobj0;
        FOR i FROM 1 TO 5 DO
            tempcount:=i-1;
            placepallet_Square{i}:=F_square;
            placepallet_Square{i}.trans.y:=placepallet_Square{i}.trans.y+tempcount*(raw_column_shift_place);
        ENDFOR
    ENDPROC

    PROC Hexa_place_generator()
        !MoveL F_Hexa,v10,fine,Servo\WObj:=wobj0;
        FOR i FROM 1 TO 5 DO
            tempcount:=i-1;
            placepallet_Hexa{i}:=F_Hexa;
            placepallet_hexa{i}.trans.y:=placepallet_hexa{i}.trans.y+tempcount*(raw_column_shift_place);
        ENDFOR
    ENDPROC

    PROC Octa_place_generator()
        !MoveL F_Octa,v10,fine,Servo\WObj:=wobj0;
        FOR i FROM 1 TO 5 DO
            tempcount:=i-1;
            placepallet_Octa{i}:=F_Octa;
            placepallet_Octa{i}.trans.y:=placepallet_Octa{i}.trans.y+tempcount*(raw_column_shift_place);
        endfor
    ENDPROC
    
    
    PROC init()
        Rob2_Octagon:=FALSE;
        Rob2_Hexagon:=FALSE;
        Rob2_Square:=FALSE;
        safer_R:=FALSE;
    ENDPROC
ENDMODULE