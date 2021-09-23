MODULE mainmoduk1
   
    
     PERS string String_Commn;
    VAR socketdev SERVER;
    VAR SOCKETDEV CLIENT;
    VAR STRING MESSAGE;
    VAR rawbytes DATA;
    PERS string received_String:="HO";
    PERS bool SwitchPlaced;

    PROC maincheck()
        MATLAB_COMM;
    ENDPROC

    PROC MATLAB_COMM()
        continues:
        SocketCreate SERVER;
        SocketBind SERVER, "192.168.0.251",9004;
        SocketListen SERVER;
        SocketAccept SERVER,CLIENT\Time:=10000000;
        bg:
        SocketReceive CLIENT\RAWDATA:=DATA;
        SocketReceive CLIENT\RAWDATA:=DATA;
        UnpackRawBytes DATA,1,MESSAGE\ASCII:=15;
        received_string:=MESSAGE;
        TPWrite "Data received : "+received_string;
        String_Commn:=received_String;
        SocketSend CLIENT\Str:="Socket Received";
        !TPWrite "client wrote" + DATA;
        GOTO bg;
        SocketClose CLIENT;
        SocketClose SERVER;
        GOTO continues;
ERROR
IF ERRNO= ERR_SOCK_CLOSED THEN
    RETURN;
ENDIF
    ENDPROC
    
     PROC main()
        MATLAB_COMM;
    ENDPROC
ENDMODULE