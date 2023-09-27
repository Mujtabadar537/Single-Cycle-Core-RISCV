`include "main_decoder.v"
`include "alu_decoder.v"

module control_unit(

input [6:0]op,
input [2:0]funct3,
input funct7,
input zero,

output PCSrc,ResultSrc,MemWrite,ALUSrc,RegWrite,
output [1:0]ImmSrc,
output [2:0]ALUControl

);


wire [1:0]ALUOp;


main_decoder MD(

.op(op),
.zero(zero),

.PCSrc(PCSrc),.ResultSrc(ResultSrc),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite),
.ImmSrc(ImmSrc),.ALUOp(ALUOp)


);





alu_decoder ALU_D(

.op5(op[5]),
.ALUOp(ALUOp),
.funct3(funct3),
.funct7(funct7),

.ALUControl(ALUControl)


);






endmodule
