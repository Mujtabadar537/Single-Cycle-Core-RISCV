`include "instruction_memory.v"
`include "data_memory.v"
`include "adder.v"
`include "multiplexer.v"
`include "register_file.v"
`include "program_counter.v"
`include "arithmetic_logic_unit.v"
`include "control_unit.v"
`include "sign_extend.v"


module RISCV_Top(

input clk,reset

);

//connecting wires
wire PCSrc;
wire [31:0]PCTarget;
wire [31:0]pcnext;
wire [31:0]PCPlus4;
wire [31:0]pc;
wire [31:0]ImmExt;
wire RegWrite;
wire [31:0]instruction;
wire zero;
wire [1:0]ImmSrc;
wire [31:0]Result;
wire ResultSrc;
wire [31:0]SrcA,SrcB;
wire [31:0]ALUResult;
wire [31:0]RD2_mux2;
wire ALUSrc;
wire [2:0]ALUControl;
wire MemWrite;
wire [31:0]ReadData;


//components
multiplexer MUX1(

.in1(PCPlus4),
.in2(PCTarget),
.sel(PCSrc),

.out(pcnext)

);



program_counter PC(

.clk(clk),
.reset(reset),
.pcnext(pcnext),

.pc(pc)

);


instruction_memory IM(

.reset(reset),
.A(pc),

.RD(instruction)


);


register_file RF(

.clk(clk),
.reset(reset),
.WE3(RegWrite),
.A1(instruction[19:15]),.A2(instruction[24:20]),.A3(instruction[11:7]),
.WD3(Result),

.RD1(SrcA),.RD2(RD2_mux2)

);



adder ADD4(

.in1(pc),
.in2(32'd4),

.out(PCPlus4)

);


adder BRANCH_TARGET(

.in1(pc),
.in2(ImmExt),

.out(PCTarget)

);



multiplexer MUX2(

.in1(RD2_mux2),.in2(ImmExt),
.sel(ALUSrc),

.out(SrcB)

);



arithmetic_logic_unit ALU(


.in1(SrcA),
.in2(SrcB),
.ALUControl(ALUControl),

.ALUResult(ALUResult),
.zero(zero)


);






sign_extend SE(

.ImmSrc(ImmSrc),
.In(instruction),

.ImmExt(ImmExt)

);






control_unit CU(

.op(instruction[6:0]),
.funct3(instruction[14:12]),
.funct7(instruction[30]),
.zero(zero),

.PCSrc(PCSrc),.ResultSrc(ResultSrc),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.RegWrite(RegWrite),
.ImmSrc(ImmSrc),
.ALUControl(ALUControl)

);




data_memory DM(

.clk(clk),
.reset(reset),
.WE(MemWrite),
.A(ALUResult),.WD(RD2_mux2),

.RD(ReadData)


);



multiplexer MUX_WB(

.in1(ALUResult),.in2(ReadData),
.sel(ResultSrc),

.out(Result)

);






endmodule
