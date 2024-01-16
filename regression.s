// Shambaditya Tarafder

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

_start:
	.global _start

 /*
 	Immediate (i-type) ALU operations
 */
 	addi x2, x0, 2				// load 2 into register x2
 	nop
 	nop
 	nop
 	addi x2, x2, (-1 & 0xfff)	  // add -1 to x2
 	nop					          // x2 = 2
 	nop
 	nop
 	slti x3, x2, 2				// compare 1 to 2, less than so x3 = 1
 	nop					// x2 = 1
 	nop
 	nop
 	slti x3, x2, 1				// compare 1 to 1, not less than, so x3 = 0
 	nop					// x3 = 1
 	nop
 	nop
 	sltiu x3, x2, 2      //compare 1 to 2 , less than so x3 = 1
 	nop					// x3 = 0
 	nop
 	nop
 	sltiu x3, x2, -1       //compare negative number : 1 < -1(0xffffffff) so x3 = 1
 	nop                 //x3 = 1
    nop
    nop
    sltiu x3, x2, 1        // compare 1 to 1, not less than, so x3 = 0
    nop                 //x3 = 1 
    nop
    nop
    addi x2, x0, 0xaaa     //load 0xaaa into register x2 ..... whicg gets sign extension to 0xfffffaaa  
    nop                 // x3 = 0
    nop
    nop
    xori x3, x2 , 0x555    // xor 0xfffffaaa and 0x555 will get 0xfffffffff stored in x3
    nop                  // x2 = 0xfffffaaa
    nop
    nop
    xori x3, x2 , 0xfff    //xor 0xfffffaaa and 0xffffffff will get 0x555 stored in x3
    nop                  // x3 = 0xffffffff 
    nop
    nop
    xori x3, x2, 0x666     //xor 0xfffffaaa and 0x666 [overlapping bits]will get 0xfffffccc stored in x3
    nop                  // x3 = 0x555
    nop
    nop
    addi x2, x0, 0     //load 0 into the register x2
    nop                 //x3 = 0x555
    nop
    nop
    addi x3, x0, 0xfff   //load 0xfff into the register x3
    nop                // x2 =0
    nop
    nop
    addi x4, x0, 0x555    // oring the same value 0x555 should get 0x555 stored in x4
    nop                //x3=0xffffffff
    nop
    nop
    ori x5, x4, 0x555     // oring the same value 0x555 should get 0x555 stored in x4
    nop                 //x3=0xffffffff and x4 = 0x555  
    nop
    nop
    ori x3, x3, 0       // oring with 0xffffffff and 0 will get 0xffffffff stored in x3
    nop               // x3 = 0xffffffff
    nop
    nop
    ori x3, x2, 0xfff   //oring with 0 and 0xffffffff will get 0xffffffff stored in x3
    nop                // x3 = 0xffffffff
    nop
    nop
    addi x2, x0, 0       //load 0 into the register x2
    nop                //x3 = 0xffffffff
    nop
    nop
    andi x5, x4, 0x555    // oring the same value 0x555 should get 0x555 stored in x5
    nop                //x2 = 0 and x3 = 0xffffffff
    nop
    nop
    andi x5, x3, 0      // anding 0xffffffff and 0 will get 0 stored in x4 (got wrong result x4=0xffffffff)
    nop               //x5 = 0xffffffff , x2 = 0
    nop
    nop
    andi x5, x2, 0xfff  // anding 0 and 0xffffffff will get again 0 stored in x4  (got wrong result x4=0xffffffff)
    nop               //x5 = 0
    nop
    nop
    andi x5, x3, 0xfff  //anding 0xffffffff and 0xffffffff will get 0xffffffff stored in x4  
    nop               //x5 = 0 
    nop
    nop
    nop               // x5 = 0xffffffff
  	halt                 
 	nop
 	nop
 	nop
 	nop
 /*
 	Immediate (r-type) ALU operations
 */
	addi x2, x0, 0x555     //loads the value 0x555 onto the register x2
	nop
	nop
	nop
    add x3, x2, x2       // adding 0x555+0x555 will get 0xaaa stored in x3
    nop                //x2 = 0x555
    nop
    nop
    addi x4, x0, 0    //load the value 0 to the x4 register
    nop             //x3 = 0xaaa
    nop
    nop
    add x3, x4, x2     // adding 0+0x555 should get 0x555 stored in x3
    nop              //x4 = 0
    nop
    nop
    addi x5, x0, 0xfff    //load the 0xffffffff [sign extension] to the x5 register
    nop                 //x3 = 0x555
    nop
    nop
    addi x6, x0, 0x1    //load the the value 1 into the x6 register 
    nop               //x5 = 0xffffffff
    nop
    nop
    add x3, x5, x6      // adding 0xffffffff+1 should be 0 stored in x3
    nop               //x6 = 1 
    nop
    nop
    sub x3, x2, x2     // subtracting  0x555-0x555 will get 0 stored in x3
    nop              //x3 = 0x0
    nop
    nop
    sub x3, x2, x4     //subtracting 0x555-0 should get 0x555 stored in x3
    nop             //x3 = 0x0
    nop
    nop
    sub x3, x6, x5   // subtracting 1-(-1) should be 2 stored in x3
    nop            //x3 = 0x555
    nop
    nop
    addi x2, x0 , 0xfff     //load xffffffff(immediate sign extension) into the register x2
	nop                   //x3 = 0x2 
	nop
	nop
    addi x3, x0, 12       //load the value 16 into the register x3 
    nop                //x2 = 0xffffffff x3 = 0x2
    nop
    nop
    sll x2, x2, x3       //shifting x2 << 8 will get 0xfffff000 stored in register x2
    nop                //x3= 0xc
    nop
    nop
    addi x4, x0, 20     //load the value 16 into the register x4 
    nop               //x2 = 0xfffff000
    nop
    nop
    sll  x2, x2, x4     //shifting x2 << 12 will get 0x0 stored in register x2
    nop              //x4 = 0x14(20)
    nop
    nop
    addi  x2, x0 , 2      //loads the value 0x2 into the register x2
    nop                //x2 = 0x0
    nop
    nop
    addi x3, x0, 1      //loads the value 0x1 into the register x3
    nop               //x2 = 0x2
    nop
    nop
    slt x4, x3, x2    //compare 1 to 2 less than it so x4=1   
    nop             //x3 = 0x1
    nop
    nop
    addi x5, x0, -1    //load the value of -1 (0xffffffff) into the register x5
    nop              //x4 = 0x1
    nop
    nop
    slt x4, x3, x5      //compare 1 to -1 not less than so x4 =0 [producing incorrect result x4=1 it should be x4=0]
    nop               //x5 = 0xffffffff
    nop
    nop
    slt x4, x3, x3      //compare 1 to 1 not less than so x4 = 0
    nop               // x4 = 0 
    nop
    nop
    sltu x4, x3, x3      // compare 1 to 1 not less than so x4 = 0
    nop               //x4 = 0
    nop
    nop
    sltu x4, x3, x2       //compare 1 to 2 so then x4 = 1
    nop                //x4 = 0
    nop
    nop
    sltu x4, x3, x5       // compare 1 to -1  so x4 = 1 
    nop                 //x4 = 1
    nop
    nop
    addi x2, x0, 0xfff      //loading the value 0xfff into the register x2
    nop                   //x4 =1 
    nop
    nop
    addi x3, x0, 0x555     //loading the value 0x555 into the register x3
    nop                  //x2 = 0xffffffff
    nop
    nop
    addi x4, x0, 0xaaa     //loading the value 0xaaa into the register x4
    nop                  //x3 = 0x555
    nop
    nop
    xor x5, x4, x2     //xoring the 0xaaa(remember its sign extended) with 0xffffffff will get 0x555 stored in register x5
    nop              //x4 = 0xfffffaaa
    nop
    nop
    xor x5, x4, x3     //xoring the 0xaaa(remember its sign extended) with 0x5555 will get 0xffffffff stored in register x5
    nop              //x5 = 0x555
    nop
    nop
    addi x6, x0, 0x666    //loading the value 0x666 into the register x6 
    nop                 //x5 = 0xffffffff
    nop
    nop
    xor x5, x4, x6      //xoring the 0xaaa and 0x666 together woll get 0xfffffccc stored in x5
    nop              //x6 = 0x666 x5 = 0xffffffff
    nop
    nop
    addi x2, x0, 0xfff      //loading the value 0xfff into the register x2
    nop                  //x5 = 0xfffffccc
    nop
    nop
    addi x3, x0, 12       //loading the value 12(0xc) into the register x3
    nop                 //x2 = 0xffffffff
    nop
    nop
    srl x2, x2, x3        //logical shift of inserting 0s in upper bits 0xffffffff >> 12 will get 0x000fffff stored in x2  register
    nop                 //x3 = 0xc
    nop
    nop
    addi x4, x0, 20     //loading the value 20(0x14) into the register x4
    nop               //x2 = 0x000fffff 
    nop
    nop
    srl x2, x2, x4    //logical shift of inserting 0s in upper bits 0xffffffff >> 20 will get 0x00000000 stored in x2  register x2
    nop               // x4 = 0x14(20)
    nop
    nop
    addi x2, x0, 0xfff     //loading the value 0xffffffff into the register x2
    nop                  //x2 = 0x0      
    nop
    nop
    addi x3, x0, 16       //loading the value 16(0x10) into the register x3
    nop                 //x2 = 0xffffffff
    nop
    nop
    sra x4, x2, x3       //arithmetic shift inserting sign bit in the upper bits 0xffffffff >> 16 will get 0xffffffff stored in register x4
    nop                //x3 = 0x10(16)
    nop
    nop
    addi x5, x0, 10      //loading the value 10 into the register x5
    nop                //x4 = 0xffffffff
    nop
    nop
    addi x6, x0, 0x7ff    //loading the value 0x7ff(highest 12 bits max) into the register x6 (max pos. number to test with)
    nop                 //x5 = 10
    nop
    nop
    sra x4, x6, x5     //arithmetic shift inserting sign bit in the upper bits 0x7ff >> 10 will get 0x1 stored in register x4
    nop              //x6 = 0x7ff
    nop
    nop
    addi x7, x0, 0x555     // loading the value 0x555 into the register x7
    nop                  //x4= 0x1 
    nop
    nop
    or x4, x7, x7     // oring with 0 and 0x555 will get us 0x555 stored in x4 
    nop             //x7 = 0x555
    nop
    nop
    or x4, x0, x2     // oring with 0 and 0xffffffff will get us 0xffffffff stored in x4 
    nop            //x4 = 0x555
    nop
    nop
    or x4, x2, x0    // oring with 0xffffffff and 0 will get us 0xffffffff stored in x4 
    nop            //x4 = 0xffffffff
    nop
    nop
    and x5, x7, x7     //anding with 0x555 and 0x555 will get us 0x555 stored in x5
    nop             //x4= 0xffffffff
    nop
    nop
    and x5, x0, x2    //anding with 0 and 0xffffffff will get 0 stored in the register x5
    nop             //x5= 0x555
    nop
    nop
    and x5, x2, x0     //anding with 0 and 0xffffffff will get 0 stored in the register x5
    nop             //x5 = 0
    nop
    nop   
    and x5, x2, x2   // anding with 0xffffffff and 0xffffffff will get 0 stored in the register x5
    nop            //x5 = 0 
    nop
    nop                //x5= 0xffffffff
    nop
 	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Immediate (r-type immediate) ALU operations
 */
	addi x2, x0, 0xfff    //loading the value 0xfff into the register x2
	nop
	nop
	nop
    slli x3, x2, 0xc     //shifting left with the value 0xc(12) 0xffffffff << 0xc(12) will get 0xfffff000 stored in x3
    nop                // x2 =  0xffffffff
    nop
    nop
    slli x3, x3, 0x14      //shifting left with the value 0xc(12) 0xfffff000 << 0x14(20) will get 0x0 stored in x3
    nop                  //x3 = 0xfffff000
    nop
    nop
    srli x3, x2, 0xc    //logical shifting  with 0xffffffff >> 0xc(12) will get 0xfffff stored in x3
    nop               //x3 = 0x0
    nop
    nop
    srli x3, x3, 0x14    //logical shifting  with 0xfffff >> 0x14(20) will get 0x0 stored in x3
    nop               //x3 = 0xfffff
    nop
    nop
    srai x3, x2, 0xc   //arithmatic shifting with 0xffffffff >> 0xc(12) should get 0xffffffff stored in x3(produced incorrect 0xfffff)
    nop              //x3 = 0
    nop
    nop
    addi x4, x0, 0x7ff   //loading the value 0x7ff(to test with max pos. value) stored in register x4
    nop                //x3 = 0xffffffff   
    nop
    nop
    srai x3, x4, 0xb     //arithmatic shifting with 0x7ff >> 0xb(11) should get 0x0stored in x3
    nop                //x4 = 0x7ff
    nop
    nop                 
    srai x3, x4, 0xa    //arithmatic shifting with 0x7ff >> 0xa(10) should get 0x1 stored in x3
    nop               //x3 - 0x0
    nop
    nop               //x3=0x1
    nop
 	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Data hazard detection and forwarding test sequences
 */
 	addi x2, x0, 1				// load x2 register with 1
 	addi x3, x0, 2				// load x3 register with 2
 	addi x4, x0, 3				// load x4 register with 3
 	addi x5, x0, -1				// load x5 register with -1
	nop
	nop
	nop
    add x6, x3, x2              
    sub x7, x6, x0               //Working with the MEM->EX forwarding
    add x8, x6, x0               //working with WB->EX forwarding
    sub x9, x6, x0               //working with WB->ID forwarding 
    or x10, x6, x0                  //working without data forwarding 
    nop
	nop
    nop                                     //x6=3 x7=3 x8=3 x9=3 x10=3
    nop                            
    add x6, x3, x2              
    sub x6, x4, x0               //Now working with WAW
    add x6, x0, x3              
    add x6, x2, x5             
    or  x6, x4, x0
    nop
	nop
    nop                                     //x6= 0X3
    nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Branch (b-type) operations
 */
	addi x2, x0, 1    //loading the value 1 into the register x2
	nop
	nop
	nop
    addi x3, x0, 0xfff   //loading the value 0xffffffff into the register x3
    nop                 //x2 = 0x1
    nop
    nop                // x3 = -1
    bne x0, x0, BRANCH_FAIL                         //this case 0 equals to 0 so will not branch
    nop
    nop
    nop
    beq x2, x0, BRANCH_FAIL                         //beq : this case 1 doesn't equals 0 will not branch
    nop
    nop
    nop
    blt x0, x2 , PASS1                              //blt : 1 is greater than zert it will branch to next set of instructions
    nop
    nop
    nop
	bne x0, x2, BRANCH_FAIL                      //should not reach this case
PASS1:
    nop
    nop
    nop
    blt x3, x2, PASS2                            //blt : 1 is greater than -1 so it should branch to the next instruction
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL                   //should not reach this case
PASS2:
    nop
    nop
    nop
    blt x2, x3, BRANCH_FAIL                     //blt :  -1 is not greater than 1 so will not branch
    nop
    nop
    nop
    blt x2, x0, BRANCH_FAIL                   //blt : 0 is not greater than 1 so will not branch
    nop
    nop
    nop
    blt x2, x2, BRANCH_FAIL                    // blt : 1 is not greater than 1 so will not branch
    nop
    nop
    nop
    bne x2, x0, PASS3                        //bne : 0 is not equal to 1 so will branch to the next instruction
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL                 //should not reach this case
PASS3:
    nop
    nop
    nop
    bne x3, x2, PASS3A                      //bne : -1 is not equal to 1 so it will branch   
    nop
    nop
    nop        
    bne x0, x2, BRANCH_FAIL                 //should not reach this case
PASS3A:
    nop
    nop
    nop
    beq x3, x0, BRANCH_FAIL                //beq : 0 is not equal to -1 so it will not branch 
    nop
    nop
    nop
    beq x2, x3, BRANCH_FAIL               //beq : 1 is not equal to -1 so it will not branch 
    nop
    nop
    nop
    beq x0, x2, BRANCH_FAIL               //bne : 0 is not equal to 1 so it will branch 
    nop
    nop
    nop
    bne x3, x0, PASS4                     //bne : -1 is not equal to 0 so it will branch to the next instruction
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL              //should not reach this case
PASS4:
    nop
    nop
    nop
    bge x3, x2, BRANCH_FAIL              //bge : -1 is not greater than or equal to 1 so it will branch 
    nop
    nop
    nop
    bge x0, x2, BRANCH_FAIL             //bge : 0 is not greater than or equal to 1 so it will branch 
    nop
    nop
    nop
    bge x2, x0, PASS5                    //bge : 1 is greater than 0 so it will branch 
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL             //should not reach this case
PASS5:
    nop
    nop
    nop
    bge x2, x3, PASS6                  //bge : 1 is greather than -1 so it will branch 
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL              //should not reach this case
PASS6:
    nop
    nop
    nop
    bge x0,x0,PASS7                   //bge : 0 is equal to 0 so it will branch 
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL             //should not reach this case
PASS7:
    nop
    nop
    nop
    bltu x2, x0, BRANCH_FAIL          //bltu : 0 is not greater than 1 will not branch
    nop
    nop
    nop
    bltu x2, x2, BRANCH_FAIL          //bltu :  1 is not greater than 1 will not branch 
    nop
    nop
    nop
    bltu x3, x2, BRANCH_FAIL          //bltu : 0xffffffff is greater than 1 will not branch
    nop
    nop
    nop
    bltu x0, x2, PASS8                //bltu : 1 is greater than 0 it will branch
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL            //should not reach this case
PASS8:
    nop
    nop
    nop
    bltu x2, x3, PASS9            // bltu : 1 is less than 0xffffffff should branch 
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL        //should not reach this case
PASS9:
    nop
    nop
    nop
    bgeu x0, x2, BRANCH_FAIL         //bgeu : 0 is not greater or equal to than 1 will not branch
    nop
    nop
    nop
    bgeu x2, x3, BRANCH_FAIL          //bgeu : 1 is not greater than or equal to  -1 will not branch
    nop
    nop
    nop
    bgeu x2, x0, PASS10              //bgeu : 1 is  greater than 0 will  branch
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL         //should not reach this case
PASS10:
    nop
    nop
    nop
    bgeu x3, x2, PASS11            //bgeu(unsigned) : 0xffffffff is  greater than 1 will  branch
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL       //should not reach this case
PASS11:
    nop
    nop
    nop
    bgeu x0, x0, PASS12          //bgeu 0 is equal to 0 will branch 
    nop
    nop
    nop
    bne x0, x2, BRANCH_FAIL      //should not reach this case
PASS12:
    addi x4, x0, 4              // load the value 0x4 into the register x4
    nop
    nop
    nop
    addi x5, x0, 2                 //load the value 0x2 into the register x5
    nop                          //x4 = 0x4
    nop
    nop                         //x5 = 0x2
NEGATIVE_TEST:
    addi x5, x5, 1             // Will keep incrementing by x5 register by 1 x5=x5+1
    nop
    nop
    nop
    blt x5, x4, NEGATIVE_TEST    // 1) loop blt : 4 greater than 3 will branch then it will become 2) 4 equal to 4 and will not branch
    nop
    nop
    nop
    beq x0, x0, PASS
BRANCH_FAIL:
	nop
	nop
	nop
	nop
	halt		// Branch test has failed, time to debug
	nop
	nop
	nop
	nop
PASS:
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	jump instruction operations
 */
    addi x2, x0, 1   //load the value 1 to the register x2
    nop
    nop
    nop
    addi x3, x0, 2     //load the value 2 to the register x3
    nop              //x2=1  
    nop
    nop            //x3 = 2
    bne x2, x3, BEGIN  //Beginning of the testing phase with a branch statement 1 is not equal to 2 will branch to begin
BRANCH_JUMP:
    nop
    nop
    nop
    blt x2, x3, JUMP1  //Next step,again a simple blt comparison tests 2 is greater than 1 so itll jump to JUMP1
BEGIN:
    jal x1, BRANCH_JUMP     //First statement to be executed which jumps to the BRANCH_JUMP
    jal x1, JUMP2          //Next, this jump statement will wxwcute to go to the JUMP2
    bge x3, x2, JUMP3     //Finally it will do anther bge comparison, 2 greater than 1 it will branch to finish
JUMP1:
    nop
    nop
    nop
    jalr x0, 0(x1)          //it will now execute jump and link stored in x0(we do not care in this case) to the return address
JUMP2:
    nop
    nop
    nop
    add x4, x3, x2        //it will add values in registers x3 and x2 to get 0x3 stored in x4
    nop
    nop
    nop
    jalr x0, 0(x1)        // it will now execute jump and link stored in x0(we do not care in this case) to the return address
JUMP3:
    nop
    nop
    nop
    jal x5, 8              //jumps forward a few lines
    nop
    nop                         //stuck over here forever,somethings not right
    j FINISH                //Comment out for testing ...also testing psedo-instruction
    jal x4, -8                 //jumps backwards by few lines
    nop
    nop
    nop
FINISH:
	nop
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 /*
 	Store (s-type)  operations
 */
 	// Loading test data into registers for Store / Load tests
 	addi x20, x0, 0x765
 	slli x20, x20, 12
 	ori	x20, x20, 0x432
 	slli x20, x20, 8
 	ori x20, x20, 0x10				// x20 = 0x76543210
 	xori x21, x20, 0xfff			// x21 = 0x89abcdef
 	// Load register x10 with base DATA memory location
 	addi x10, x0, (DATA >> 12)		// Assume DATA memory address less than 24-bits
 	slli x10, x10, 12				// Move the upper 12-bits to locations 12..23
 	ori x10, x10, (DATA & 0xfff)	// OR in the lower 12-bits to create all 24-bits
 	// Load register x11 with base DATA_MINU location
 	addi x11, x0, (DATA_MINUS >> 12)	// Assume DATA memory address less than 24-bits
 	slli x11, x11, 12					// Move the upper 12-bits to locations 12..23
 	ori x11, x11, (DATA_MINUS & 0xfff)	// OR in the lower 12-bits to create all 24-bits
 	// start of Store Instruction test
    // two test values to be used for the test sequence : x20 and x21
    // base address x10
    sw x21, 0(x10)             //Memory 0x10 val will store 0x89abcdef
    //half words bytes aligned (0, 2, 4, 6, 8, 10, 12, ...) 
    sh x21, 8(x10)            //Memory 0x10 val will store 0x0000cdef
    sh x20, 10(x10)           //Memory 0x10 val will store 0x3210cdef
    srli x22, x21, 0xc         //shifting 0x89abcdef by 12 bits to get 0x89abc and storing in register x22
    srli x23, x20, 0xc          //shifting 0x76543210 by 12 bits to get 0x76543 and storing in register x23
    srli x24, x21, 0x14         //shifting 0x89abcdef by 20 bits to get 0x89a and storing in register x24
    srli x25, x20, 0x14        //shifting 0x76543210 by 20 bits to get 0x765 and storing in register x25
    sb x22, 12(x10)           //It will store 0x000000bc
    sb x23, 13(x10)           //It will store 0x000043bc
    sb x24, 14(x10)           //It will store 0x009a43bc
    sb x25, 15(x10)            //It will store 0x659a43bc
    sw x21, -4(x11)               //It didnt work ? should have given back 0x0x89abcdef
	nop 
	nop
	nop
	nop
  	halt
  	nop
  	beq x0, x0, LOAD_TEST
  	nop
  	nop
 /*
 	Data Memory Space for regression test
 	- There are 8 NOP locations which are available
 		to be overwritten for test
 	- Accessing the first data location by 0 offset of x10 => 0(x10)
 	- Accessing the 1st byte in data space is 1 offset of x10 => 1(x10)
 	- Accessing the 2nd half-word in data space is 2 offset of x10 => 2(x10)
 	- Accessing the 2nd word in data space is 4 offset of x10 => 4(x10)
 */
DATA:
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 	nop
 DATA_MINUS:

 /*
 	Load (l-type)  operations
 */
LOAD_TEST:
    sw x20, 0(x10)         //store the value 0x76543210 to the val x20 location
    lw x3, 0(x10)         //loading the value in x3 just for checking purposes
    beq x3, x20, L_PASS1   //if loaded correctly and matches with x20 it will branch
    bne x3, x20, LOAD_FAIL  //if not equal to there is something wrong and needs debugging
L_PASS1:
    lh x3, 2(x10)            //laoding half word should give us 0x7654
    slli x3, x3, 16             //shifting logically by 16 bits will give us 0x76540000
    lh x4, 0(x10)           //loading half with 0 bytes aligned should give 0x3210 
    or x3, x3, x4             //oring that will give us the value 0x76543210
    beq x3, x20, L_PASS1A       //if loaded correctly and matches with x20 it will branch
    bne x3, x20, LOAD_FAIL         //if not equal to there is something wrong and needs debugging
L_PASS1A:
    lhu x3, 2(x10)            //laoding half word(unsigned) should give us 0x7654
    slli x3, x3, 16            //shifting logically by 16 bits will give us 0x76540000
    lhu x4, 0(x10)               //loading half word(unsigned) with 0 bytes aligned should give 0x3210 
    or x3, x3, x4              //oring that will give us the value 0x76543210
    beq x3, x20, L_PASS2        //if loaded correctly and matches with x20 it will branch
    bne x3, x20, LOAD_FAIL        //if not equal to there is something wrong and needs debugging
L_PASS2:
    lb x3, 3(x10)           //loading byte should give us the value 0x76
    slli x3, x3, 8           //logical shiting should give us 0x7600 stored in x3 register
    lb x4, 2(x10)           //loading byte should give us the value 0x54
    or x3, x3, x4             //oring the value 0x7600 and 0x54 should give is 0x7654
    slli x3, x3, 8           //logical shiting should give us 0x765400 stored in x3 register
    lb x4, 1(x10)           //loading byte value 0x32
    or x3, x3, x4          //oring the values 0x765400 and 0x32 should give 0x765432
    slli x3, x3, 8           //shifting logically by 8 bits should give us the vlue 0x76543200
    lb x4, 0(x10)           //loading the byte value 0x10
    or x3, x3, x4           // oring the values 0x76543200 and 0x10 should give us 0x76543210
    beq x3, x20, L_PASS2A    //if loaded correctly and matches with x20 it will branch
    bne x3, x20, LOAD_FAIL    ////if not equal to there is something wrong and needs debugging
L_PASS2A:
    lbu x3, 3(x10)            //loading byte (unsigned) should give us the value 0x76
    slli x3, x3, 8             //logical shiting should give us 0x7600 stored in x3 register
    lbu x4, 2(x10)                 //loading byte should give us the value 0x54
    or x3, x3, x4                //oring the value 0x7600 and 0x54 should give is 0x7654
    slli x3, x3, 8               //logical shiting should give us 0x765400 stored in x3 register
    lbu x4, 1(x10)              //loading byte value(unsigned) 0x32
    or x3, x3, x4                 //oring the values 0x765400 and 0x32 should give 0x765432
    slli x3, x3, 8              //shifting logically by 8 bits should give us the vlue 0x76543200
    lbu x4, 0(x10)            //loading the byte value 0x10
    or x3, x3, x4                // oring the values 0x76543200 and 0x10 should give us 0x76543210
    beq x3, x20, L_PASS3        //if loaded correctly and matches with x20 it will branch
    bne x3, x20, LOAD_FAIL       //if not equal to there is something wrong and needs debugging
L_PASS3:
    sw x20, 0(x10)            //storing a word 0x76543210
    lw x3, -4(x11)             //lodaing the word with negative offset should get us the same value
    beq x3, x20, L_PASS4      
    bne x3, x20, LOAD_FAIL
L_PASS4:
    addi x4, x0, 0xfff           //loading the expected value in the register x4 which is 0xffff89ab
 	slli x4, x4, 12
 	ori	x4, x4, 0xf89
 	slli x4, x4, 8
 	ori x4, x4, 0xab
    sw x21, 0(x10)             //now strong a different test value to the memory x21 = 0x89abcdef
    lw x21, 0(x10)               //loading to see if its working properlu should get x21 = 0x89abcdef
    lh x3, 2(x10)                 //loading half word gets sign extended to 0xffff89ab
    beq x3, x4, L_PASS5
    bne x3, x4, LOAD_FAIL
L_PASS5:
    addi x4, x0, 0xfff             //loading the expected value in the register x4 which is 0xffffff89 to match later for branching
 	slli x4, x4, 12
 	ori	x4, x4, 0xfff
 	slli x4, x4, 8
 	ori x4, x4, 0x89
    lb x3, 3(x10)                  //loading the byte should get the result sign extended to 0xffffff89
    beq x3, x4, L_PASS6
    bne x3, x4, LOAD_FAIL
L_PASS6:
    lhu x3, 2(x10)               //loading half word(unsigned) should just yield us 0x89ab
    srli x4, x21, 16               //shifting the value 0x89abcdef with 16 bits should get us 0x89ab
    beq x3, x4, L_PASS7
    bne x3, x4, LOAD_FAIL
L_PASS7:
    lbu x3, 3(x10)               //loading half word(unsigned) should just yield us 0x89
    srli x4, x21, 24           //shifting the value 0x89abcdef with 24 bits should get us 0x89
    bne x3, x4, LOAD_FAIL
	nop
	nop
	nop
	nop
  	halt
 	nop
 	nop
 	nop
 	nop
 LOAD_FAIL:							// Using branch statements, if load does not
 	nop								// return result expected, branch to LOAD_FAIL label
 	nop
 	nop
 	halt
 	nop
 	nop
 	nop
 	nop


