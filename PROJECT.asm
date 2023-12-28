.MODEL LARGE

.386 

.DATA

;The Menus:-----------------------------------
CATEGORIES DB 10,10,'The categories:',10,10,'1.Pasta',10,'2.Grills',10,'3.Pizza',10,'4.Sandwiches',10,'5.Drinks',10,10,'please enter the category number: ','$'
PASTA DB 10,10,'Pasta:',10,10,'1.Pasta with souce',10,'2.Pasta with chicken',10,'3.Pasta with shrimp',10,10,'Please enter the number of the item whose you want to know its calories: ','$'
CPS1 DB '210 cals','$'
CPS2 DB '239 cals','$'
CPS3 DB '492 cals','$'
GRILLS DB 10,10,'Grills:',10,10,'1.Chicken kebab',10,'2.Chicken kofta',10,'3.Beef kebab',10,'4.Shish taouk',10,'5.Grilled Chicken',10,10,'Please enter the number of the item whose you want to know its calories: ','$'
CGR1 DB '206 cals','$'
CGR2 DB '210 cals','$'
CGR3 DB '223 cals','$'
CGR4 DB '296 cals','$'
CGR5 DB '1350 cals','$'
PIZZA DB 10,10,'Pizza:',10,10,'1.Pizza margherita',10,'2.Chicken Pizza',10,'3.Tuna Pizza',10,'4.Pizza with minced beef',10,10,'Please enter the number of the item whose you want to know its calories: ','$'
CPZ1 DB '285 cals','$'
CPZ2 DB '230 cals','$'
CPZ3 DB '893 cals','$'
CPZ4 DB '424 cals','$'
SANDWICHES DB 10,10,'Sandwiches:',10,10,'1.Liver sandwich',10,'2.Hawawshi sandwich',10,'3.Chicken shawarma sandwich',10,'4.chicken fajita sandwich',10,10,'Please enter the number of the item whose you want to know its calories: ','$'
CSN1 DB '290 cals','$'
CSN2 DB '640 cals','$'
CSN3 DB '475 cals','$'
CSN4 DB '210 cals','$'
DRINKS DB 10,10,'Drinks:',10,10,'1.Lemonade',10,'2.Water',10,'3.Cream Soda',10,10,'Please enter the number of the item whose you want to know its calories: ','$'
CDK1 DB '40 cals','$'
CDK2 DB '0 cals','$'
CDK3 DB '126 cals','$'

;The Messages:------------------------------
MORNING_MSG DB 10,32,002H,32,003H,32,002H,32,003H,32,002H,' Good Morning ',002H,32,003H,32,002H,32,003H,32,002H,10,10,'$'
EVENING_MSG DB 10,32,002H,32,003H,32,002H,32,003H,32,002H,' Good Evening ',002H,32,003H,32,002H,32,003H,32,002H,10,10,'$'
WELCOME_MSG DB '****** ^-^ Welcome in our resturant ^-^ ******','$'         
DIVIDING_LINE DB 10,'______________________________________________','$'
CALS_MSG DB 10,'______________________________________________',10,10,'The amount of calories is ','$'
ERROR_MSG DB 10,'______________________________________________',10,10,'Error: invalid number!','$'
RETURN_OR_EXIT_MSG DB 10,'______________________________________________',10,10,'Choose:',10,'1-Return to categories list.',10,'2-Exit.',10,'______________________________________________','$'
THANKS_MSG DB 10,10,'>>> Thanks for using our simple program ... Goodbye',32,003H,'$'

.CODE
    MAIN PROC FAR
    .STARTUP
    
    ;Welcome messages:---------------
    MOV AH , 2CH
    INT 21H
    
    CMP CH , 0CH
    JG EVENING
    
    LEA SI , MORNING_MSG 
    CALL PRINT_STRING
    JMP WELCOME
    
    EVENING:
    LEA SI , EVENING_MSG  
    CALL PRINT_STRING
    
    WELCOME:
    LEA SI , WELCOME_MSG
    CALL PRINT_STRING
    
    ;_____________________________________
    
    ;Categories list:-----------------
    START:
    LEA SI , CATEGORIES
    CALL PRINT_STRING
    
    CALL READ_CHAR
    
    LEA SI , DIVIDING_LINE
    CALL PRINT_STRING
    
    CMP AL , '1'
    JE PS
    CMP AL , '2'
    JE GR
    CMP AL , '3'
    JE PZ
    CMP AL , '4'
    JE SN
    CMP AL , '5'
    JE DK
    JNE ERROR
    
    ;_____________________________________
    
    ;Pasta list:----------------------
    PS:
    LEA SI , PASTA
    CALL PRINT_STRING
    CALL READ_CHAR
    CMP AL , '1'
    JE PS1
    CMP AL , '2'
    JE PS2
    CMP AL , '3'
    JE PS3
    JNE ERROR
    
    ;***************
    
    ;Calories of Pasta:
    PS1:
    CALL SPECIAL_PRINT
    LEA SI , CPS1
    CALL PRINT_STRING
    JMP STOP
    
    PS2:
    CALL SPECIAL_PRINT
    LEA SI , CPS2
    CALL PRINT_STRING
    JMP STOP
    
    PS3:
    CALL SPECIAL_PRINT
    LEA SI , CPS3
    CALL PRINT_STRING
    JMP STOP
    
    ;_____________________________________
    
    ;Grills list:--------------------
    GR:
    LEA SI , GRILLS
    CALL PRINT_STRING
    CALL READ_CHAR
    CMP AL , '1'
    JE GR1
    CMP AL , '2'
    JE GR2
    CMP AL , '3'
    JE GR3
    CMP AL , '4'
    JE GR4
    CMP AL , '5'
    JE GR5
    JNE ERROR
    
    ;***************
    
    ;Calories of Grills:
    GR1:
    CALL SPECIAL_PRINT
    LEA SI , CGR1
    CALL PRINT_STRING
    JMP STOP
    
    GR2:
    CALL SPECIAL_PRINT
    LEA SI , CGR2
    CALL PRINT_STRING
    JMP STOP

    GR3:
    CALL SPECIAL_PRINT
    LEA SI , CGR3
    CALL PRINT_STRING
    JMP STOP
    
    GR4:
    CALL SPECIAL_PRINT
    LEA SI , CGR4
    CALL PRINT_STRING
    JMP STOP
    
    GR5:
    CALL SPECIAL_PRINT
    LEA SI , CGR5
    CALL PRINT_STRING
    JMP STOP
    
    ;_____________________________________
    
    ;Pizza list:---------------------
    PZ:
    LEA SI , PIZZA
    CALL PRINT_STRING
    CALL READ_CHAR
    CMP AL , '1'
    JE PZ1
    CMP AL , '2'
    JE PZ2
    CMP AL , '3'
    JE PZ3
    CMP AL , '4'
    JE PZ4
    JNE ERROR
    
    ;***************
    
    ;Calories of Pizza:
    PZ1:
    CALL SPECIAL_PRINT
    LEA SI , CPZ1
    CALL PRINT_STRING
    JMP STOP
    
    PZ2:
    CALL SPECIAL_PRINT
    LEA SI , CPZ2
    CALL PRINT_STRING
    JMP STOP
    
    PZ3:
    CALL SPECIAL_PRINT
    LEA SI , CPZ3
    CALL PRINT_STRING
    JMP STOP
    
    PZ4:
    CALL SPECIAL_PRINT
    LEA SI , CPZ4
    CALL PRINT_STRING
    JMP STOP
    
    ;_____________________________________
    
    ;Sandwiches list:----------------
    SN:
    LEA SI , SANDWICHES
    CALL PRINT_STRING
    CALL READ_CHAR
    CMP AL , '1'
    JE SN1
    CMP AL , '2'
    JE SN2
    CMP AL , '3'
    JE SN3
    CMP AL , '4'
    JE SN4
    JNE ERROR
    
    ;***************
    
    ;Calories of Sandwiches:
    SN1:
    CALL SPECIAL_PRINT
    LEA SI , CSN1
    CALL PRINT_STRING
    JMP STOP
    
    SN2:
    CALL SPECIAL_PRINT
    LEA SI , CSN2
    CALL PRINT_STRING
    JMP STOP
    
    SN3:
    CALL SPECIAL_PRINT
    LEA SI , CSN3
    CALL PRINT_STRING
    JMP STOP
    
    SN4:
    CALL SPECIAL_PRINT
    LEA SI , CSN4
    CALL PRINT_STRING
    JMP STOP
    
    ;_____________________________________
   
    ;Drinks list:--------------------
    DK:
    LEA SI , DRINKS
    CALL PRINT_STRING
    CALL READ_CHAR
    CMP AL , '1'
    JE DK1
    CMP AL , '2'
    JE DK2
    CMP AL , '3'
    JE DK3   
    JNE ERROR
    
    ;***************
    
    ;Calories of Drinks:
    DK1:
    CALL SPECIAL_PRINT
    LEA SI , CDK1
    CALL PRINT_STRING
    JMP STOP
    
    DK2:
    CALL SPECIAL_PRINT
    LEA SI , CDK2
    CALL PRINT_STRING
    JMP STOP
    
    DK3:
    CALL SPECIAL_PRINT
    LEA SI , CDK3
    CALL PRINT_STRING
    JMP STOP
    
    ;_____________________________________
    
    ;Invalid number error:-----------
    ERROR:
    LEA SI , ERROR_MSG
    CALL PRINT_STRING
    
    ;_____________________________________
    
    ;choose message:-----------------
    STOP:
    LEA SI , RETURN_OR_EXIT_MSG
    CALL PRINT_STRING
    MOV AH , 10H
    INT 16H
    CMP AL , '1'
    JE START
    CMP AL , '2'
    JE GOODBYE
    JNE ERROR
    
    ;_____________________________________
    
    ;Goodbye message:----------------
    GOODBYE:
    LEA SI , THANKS_MSG
    CALL PRINT_STRING
    
    .EXIT
    MAIN ENDP
    
    PRINT_STRING PROC NEAR
    MOV AH, 09H       
    MOV DX, SI
    INT 21H
    RET
    PRINT_STRING ENDP
    
    READ_CHAR PROC NEAR
    MOV AH , 01H
    INT 21H
    RET
    READ_CHAR ENDP
    
    SPECIAL_PRINT PROC NEAR
    LEA DX,CALS_MSG
    MOV AH, 09H       
    INT 21H
    RET
    SPECIAL_PRINT ENDP
    
END MAIN