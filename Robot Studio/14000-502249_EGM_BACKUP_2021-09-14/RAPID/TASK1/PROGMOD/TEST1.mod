MODULE TEST1




    VAR intnum int_no1;
    VAR corrdescr id;
    PERS NUM correctioncount;


    TRAP UpdateCorr
        Incr correctioncount;
        IF String_Commn="In" THEN
            g_GripIn\holdForce:=10;
        ELSEIF  String_Commn="Out" THEN
            G_JOGOUT;
        ELSE
            RETURN;
        ENDIF
        IDelete int_no1;
        CONNECT int_no1 WITH UpdateCorr;
        ITimer\Single,0.2,int_no1;
    ENDTRAP
    
    PROC INTI_TRAP()
        CONNECT int_no1 WITH UpdateCorr;
        ITimer\Single,0.01,int_no1;
        
       
    ENDPROC
ENDMODULE