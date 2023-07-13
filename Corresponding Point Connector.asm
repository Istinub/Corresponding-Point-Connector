.MODEL SMALL
 
.STACK 100H

.DATA 
   
  COUNT DB 1
  
  R DB ?
  C DB ?
  
  R2 DB ?
  C2 DB ?

.CODE 

    
DRAW_PIXEL2 MACRO X,Y
    MOV DL, Y
    MOV DH, X
    CALL SET_CURSOR
    
    MOV AH, 09H
    MOV BL, 70H
    MOV CX, 1D
    INT 10H
ENDM





MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
 ;enter your code here
    
   MOV AH, 09H 
   MOV AL, 32
   MOV BL, 10H
   MOV CX, 1000H
   INT 10h
    
    
    CALL DRAW_BLOCKS
    
    MOV DL, 0
    MOV DX, 0
    CALL SET_CURSOR
    
    OPERATING_SYSTEM:
          
          MOV AH, 00H
          INT 16H
          
          
          CMP AH, 80
          JE DOWN
          
          
          CMP AH, 72
          JE UP 
          
    
          CMP AH, 75
          JE LEFT
          
          
          CMP AH, 77
          JE RIGHT
    
          CMP AL, 32
          JE SPACEBAR
          
          
          JMP OPERATING_SYSTEM
          
          
          SPACEBAR:
               MOV AH, 09H
               MOV AL, 32
               MOV BL, 20H
               MOV CX, 1D
               INT 10H
               
               ;MAIN CODE
               
               CMP COUNT,2
               JGE LINE
                             
               MOV BH,2
               MOV COUNT, BH
               MOV R2, DH
               MOV C2, DL
               
               JMP NEXT2
               
               LINE:   
                  MOV R2, DH
                  MOV C2, DL
                  
                  LOOP01:
                     CMP DH,R
                     JG ROW_GOUP
                     
                     CMP DH,R
                     JL ROW_GODOWN
                     
                     CMP DH,R
                     JE ROW_SAME
                   
                   ROW_GOUP:
                     SUB DH,1
                     CALL SET_CURSOR02
                     
                     CMP DL,C
                     JG COL_GOLEFT
                     CMP DL,C
                     JL COL_GORIGHT
                     CMP DL,C
                     JE COL_SAME
                     
                     RET    
                   ROW_GODOWN:
                     ADD DH,1
                     CALL SET_CURSOR02
                     
                     CMP DL,C
                     JG COL_GOLEFT
                     CMP DL,C
                     JL COL_GORIGHT
                     CMP DL,C
                     JE COL_SAME
                     
                     RET
                     
                   ROW_SAME:
                     CMP DL,C
                     JG COL_GOLEFT
                     CMP DL,C
                     JL COL_GORIGHT
                     CMP DL,C
                     JE NEXT2:  
                     
                     RET
                     
                   COL_GOLEFT:
                     SUB DL,1
                     CALL SET_CURSOR02
                     CALL DRAW_LINE
                     JMP LOOP01
                     RET
                     
                   COL_GORIGHT:
                     ADD DL,1
                     CALL SET_CURSOR02
                     CALL DRAW_LINE
                     JMP LOOP01  
                    
                    
                   COL_SAME:
                     CALL SET_CURSOR02
                     CALL DRAW_LINE
                     JMP LOOP01 
               
               
               NEXT2:
                 MOV DH,R2
                 MOV DL,C2
                 MOV R,DH
                 MOV C,DL

               JMP OPERATING_SYSTEM
               
               
          RIGHT: 
              ADD DL,5
              CALL SET_CURSOR
              JMP OPERATING_SYSTEM
              RET
          
          
          LEFT:
              SUB DL,5
              CALL SET_CURSOR
              JMP OPERATING_SYSTEM
              RET
          
          
          UP:
              SUB DH,5
              CALL SET_CURSOR
              JMP OPERATING_SYSTEM
              RET
          
          
          DOWN:
              ADD DH,5
              CALL SET_CURSOR
              JMP OPERATING_SYSTEM
              RET
              
         SET_CURSOR:
           
           CMP DL, 75
           JG TOGGLE_LEFT
           
           CMP DL, 0
           JL TOGGLE_RIGHT
           
           CMP DH, 15
           JG TOGGLE_TOP
           
           CMP DH, 0
           JL TOGGLE_BOTTOM
           
           JMP NEXT
           
           TOGGLE_LEFT:
              MOV DL, 0
              JMP NEXT
           
           TOGGLE_RIGHT:
              MOV DL, 75
              JMP NEXT
           
           TOGGLE_TOP:
              MOV DH,0
              JMP NEXT
           
           TOGGLE_BOTTOM:
              MOV DH,15
              JMP NEXT
              
                               
           NEXT:
           MOV AH, 02H
           MOV BH, 00
           INT 10H
           RET      
        
        SET_CURSOR02:
           MOV AH, 02H
           MOV BH, 00
           INT 10H
           RET
           
           
        DRAW_LINE:
            MOV AH,09H
            MOV AL,32
            MOV BL,50H
            MOV CX,1D
            INT 10H
            RET  

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP 


DRAW_BLOCKS PROC
        
    CALL POSITION1
    DRAW_PIXEL2 DH, DL
    CALL POSITION2
    DRAW_PIXEL2 DH, DL
    CALL POSITION3
    DRAW_PIXEL2 DH, DL
    CALL POSITION4
    DRAW_PIXEL2 DH, DL
    CALL POSITION5
    DRAW_PIXEL2 DH, DL
    CALL POSITION6
    DRAW_PIXEL2 DH, DL
    CALL POSITION7
    DRAW_PIXEL2 DH, DL
    CALL POSITION8
    DRAW_PIXEL2 DH, DL
    CALL POSITION9
    DRAW_PIXEL2 DH, DL
    CALL POSITION10
    DRAW_PIXEL2 DH, DL
    CALL POSITION11
    DRAW_PIXEL2 DH, DL
    CALL POSITION12
    DRAW_PIXEL2 DH, DL
    CALL POSITION13
    DRAW_PIXEL2 DH, DL
    CALL POSITION14
    DRAW_PIXEL2 DH, DL
    CALL POSITION15
    DRAW_PIXEL2 DH, DL
    CALL POSITION16
    DRAW_PIXEL2 DH, DL
                      
                      
                      
                      ;ROW 2
                      
    
    CALL POSITION17
    DRAW_PIXEL2 DH, DL
    CALL POSITION18
    DRAW_PIXEL2 DH, DL
    CALL POSITION19
    DRAW_PIXEL2 DH, DL
    CALL POSITION20
    DRAW_PIXEL2 DH, DL
    CALL POSITION21
    DRAW_PIXEL2 DH, DL
    CALL POSITION22
    DRAW_PIXEL2 DH, DL
    CALL POSITION23
    DRAW_PIXEL2 DH, DL
    CALL POSITION24
    DRAW_PIXEL2 DH, DL
    CALL POSITION25
    DRAW_PIXEL2 DH, DL
    CALL POSITION26
    DRAW_PIXEL2 DH, DL
    CALL POSITION27
    DRAW_PIXEL2 DH, DL
    CALL POSITION28
    DRAW_PIXEL2 DH, DL
    CALL POSITION29
    DRAW_PIXEL2 DH, DL
    CALL POSITION30
    DRAW_PIXEL2 DH, DL
    CALL POSITION31
    DRAW_PIXEL2 DH, DL
    CALL POSITION32
    DRAW_PIXEL2 DH, DL
    
    
                      ;ROW 3
    
    
    CALL POSITION33
    DRAW_PIXEL2 DH, DL
    CALL POSITION34
    DRAW_PIXEL2 DH, DL
    CALL POSITION35
    DRAW_PIXEL2 DH, DL
    CALL POSITION36
    DRAW_PIXEL2 DH, DL
    CALL POSITION37
    DRAW_PIXEL2 DH, DL
    CALL POSITION38
    DRAW_PIXEL2 DH, DL
    CALL POSITION39
    DRAW_PIXEL2 DH, DL
    CALL POSITION40
    DRAW_PIXEL2 DH, DL
    CALL POSITION41
    DRAW_PIXEL2 DH, DL
    CALL POSITION42
    DRAW_PIXEL2 DH, DL
    CALL POSITION43
    DRAW_PIXEL2 DH, DL
    CALL POSITION44
    DRAW_PIXEL2 DH, DL
    CALL POSITION45
    DRAW_PIXEL2 DH, DL
    CALL POSITION46
    DRAW_PIXEL2 DH, DL
    CALL POSITION47
    DRAW_PIXEL2 DH, DL
    CALL POSITION48
    DRAW_PIXEL2 DH, DL
    
    
                    ;ROW 4
    
    
    CALL POSITION49
    DRAW_PIXEL2 DH, DL
    CALL POSITION50
    DRAW_PIXEL2 DH, DL
    CALL POSITION51
    DRAW_PIXEL2 DH, DL
    CALL POSITION52
    DRAW_PIXEL2 DH, DL
    CALL POSITION53
    DRAW_PIXEL2 DH, DL
    CALL POSITION54
    DRAW_PIXEL2 DH, DL
    CALL POSITION55
    DRAW_PIXEL2 DH, DL
    CALL POSITION56
    DRAW_PIXEL2 DH, DL
    CALL POSITION57
    DRAW_PIXEL2 DH, DL
    CALL POSITION58
    DRAW_PIXEL2 DH, DL
    CALL POSITION59
    DRAW_PIXEL2 DH, DL
    CALL POSITION60
    DRAW_PIXEL2 DH, DL
    CALL POSITION61
    DRAW_PIXEL2 DH, DL
    CALL POSITION62
    DRAW_PIXEL2 DH, DL
    CALL POSITION63
    DRAW_PIXEL2 DH, DL
    CALL POSITION64
    DRAW_PIXEL2 DH, DL
    
                      
      
    
    DRAW_BLOCKS ENDP





POSITION1 PROC
    
    MOV DH,0
    MOV DL,0
    RET
    POSITION1 ENDP

POSITION2 PROC
    
    MOV DH,0
    MOV DL,5
    RET
    POSITION2 ENDP

POSITION3 PROC
    MOV DH,0
    MOV DL,10
    RET
    POSITION3 ENDP

POSITION4 PROC
    MOV DH,0
    MOV DL,15
    RET
    POSITION4 ENDP

POSITION5 PROC
    MOV DH,0
    MOV DL,20
    RET
    POSITION5 ENDP

POSITION6 PROC
    MOV DH,0
    MOV DL,25
    RET
    POSITION6 ENDP
            
POSITION7 PROC
    MOV DH,0
    MOV DL,30
    RET
    POSITION7 ENDP

POSITION8 PROC
    MOV DH,0
    MOV DL,35
    RET
    POSITION8 ENDP

POSITION9 PROC
    MOV DH,0
    MOV DL,40
    RET
    POSITION9 ENDP

POSITION10 PROC
    MOV DH,0
    MOV DL,45
    RET
    POSITION10 ENDP

POSITION11 PROC
    MOV DH,0
    MOV DL,50
    RET
    POSITION11 ENDP

POSITION12 PROC
    MOV DH,0
    MOV DL,55
    RET
    POSITION12 ENDP

POSITION13 PROC
    MOV DH,0
    MOV DL,60
    RET
    POSITION13 ENDP

POSITION14 PROC
    MOV DH,0
    MOV DL,65
    RET
    POSITION14 ENDP

POSITION15 PROC
    MOV DH,0
    MOV DL,70
    RET
    POSITION15 ENDP

POSITION16 PROC
    MOV DH,0
    MOV DL,75
    RET
    POSITION16 ENDP




           ; ROW 2
       
       


POSITION17 PROC
    
    MOV DH,5
    MOV DL,0
    RET
    POSITION17 ENDP

POSITION18 PROC
    
    MOV DH,5
    MOV DL,5
    RET     
    POSITION18 ENDP

POSITION19 PROC
    MOV DH,5
    MOV DL,10
    RET
    POSITION19 ENDP

POSITION20 PROC
    MOV DH,5
    MOV DL,15
    RET
    POSITION20 ENDP

POSITION21 PROC
    MOV DH,5
    MOV DL,20
    RET
    POSITION21 ENDP

POSITION22 PROC
    MOV DH,5
    MOV DL,25
    RET
    POSITION22 ENDP
            
POSITION23 PROC
    MOV DH,5
    MOV DL,30
    RET
    POSITION23 ENDP

POSITION24 PROC
    MOV DH,5
    MOV DL,35
    RET
    POSITION24 ENDP

POSITION25 PROC
    MOV DH,5
    MOV DL,40
    RET
    POSITION25 ENDP

POSITION26 PROC
    MOV DH,5
    MOV DL,45
    RET
    POSITION26 ENDP

POSITION27 PROC
    MOV DH,5
    MOV DL,50
    RET
    POSITION27 ENDP

POSITION28 PROC
    MOV DH,5
    MOV DL,55
    RET
    POSITION28 ENDP

POSITION29 PROC
    MOV DH,5
    MOV DL,60
    RET
    POSITION29 ENDP

POSITION30 PROC
    MOV DH,5
    MOV DL,65
    RET
    POSITION30 ENDP

POSITION31 PROC
    MOV DH,5
    MOV DL,70
    RET
    POSITION31 ENDP

POSITION32 PROC
    MOV DH,5
    MOV DL,75
    RET
    POSITION32 ENDP



               ;3RD ROW



POSITION33 PROC
    
    MOV DH,10
    MOV DL,0
    RET
    POSITION33 ENDP

POSITION34 PROC
    
    MOV DH,10
    MOV DL,5
    RET     
    POSITION34 ENDP

POSITION35 PROC
    MOV DH,10
    MOV DL,10
    RET
    POSITION35 ENDP

POSITION36 PROC
    MOV DH,10
    MOV DL,15
    RET
    POSITION36 ENDP

POSITION37 PROC
    MOV DH,10
    MOV DL,20
    RET
    POSITION37 ENDP

POSITION38 PROC
    MOV DH,10
    MOV DL,25
    RET
    POSITION38 ENDP
            
POSITION39 PROC
    MOV DH,10
    MOV DL,30
    RET
    POSITION39 ENDP

POSITION40 PROC
    MOV DH,10
    MOV DL,35
    RET
    POSITION40 ENDP

POSITION41 PROC
    MOV DH,10
    MOV DL,40
    RET
    POSITION41 ENDP

POSITION42 PROC
    MOV DH,10
    MOV DL,45
    RET
    POSITION42 ENDP

POSITION43 PROC
    MOV DH,10
    MOV DL,50
    RET
    POSITION43 ENDP

POSITION44 PROC
    MOV DH,10
    MOV DL,55
    RET
    POSITION44 ENDP

POSITION45 PROC
    MOV DH,10
    MOV DL,60
    RET
    POSITION45 ENDP

POSITION46 PROC
    MOV DH,10
    MOV DL,65
    RET
    POSITION46 ENDP

POSITION47 PROC
    MOV DH,10
    MOV DL,70
    RET
    POSITION47 ENDP

POSITION48 PROC
    MOV DH,10
    MOV DL,75
    RET
    POSITION48 ENDP

         
         
               ;4TH ROW



POSITION49 PROC
    
    MOV DH,15
    MOV DL,0
    RET
    POSITION49 ENDP

POSITION50 PROC
    
    MOV DH,15
    MOV DL,5
    RET     
    POSITION50 ENDP

POSITION51 PROC
    MOV DH,15
    MOV DL,10
    RET
    POSITION51 ENDP

POSITION52 PROC
    MOV DH,15
    MOV DL,15
    RET
    POSITION52 ENDP

POSITION53 PROC
    MOV DH,15
    MOV DL,20
    RET
    POSITION53 ENDP

POSITION54 PROC
    MOV DH,15
    MOV DL,25
    RET
    POSITION54 ENDP
            
POSITION55 PROC
    MOV DH,15
    MOV DL,30
    RET
    POSITION55 ENDP

POSITION56 PROC
    MOV DH,15
    MOV DL,35
    RET
    POSITION56 ENDP

POSITION57 PROC
    MOV DH,15
    MOV DL,40
    RET
    POSITION57 ENDP

POSITION58 PROC
    MOV DH,15
    MOV DL,45
    RET
    POSITION58 ENDP

POSITION59 PROC
    MOV DH,15
    MOV DL,50
    RET
    POSITION59 ENDP

POSITION60 PROC
    MOV DH,15
    MOV DL,55
    RET
    POSITION60 ENDP

POSITION61 PROC
    MOV DH,15
    MOV DL,60
    RET
    POSITION61 ENDP

POSITION62 PROC
    MOV DH,15
    MOV DL,65
    RET
    POSITION62 ENDP

POSITION63 PROC
    MOV DH,15
    MOV DL,70
    RET
    POSITION63 ENDP

POSITION64 PROC
    MOV DH,15
    MOV DL,75
    RET
    POSITION64 ENDP






    END MAIN

  



