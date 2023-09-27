module arithmetic_logic_unit(

input [31:0]in1,in2,
input [2:0]ALUControl,

output reg[31:0]ALUResult,
output reg zero

);


//wire [31:0]adder_out;
//wire [31:0]mux2_out;




/**assign adder_out = (ALUControl[0] == 1'b0) ? in1 + in2 :
                                          (in1 + ((~in2)+1)) ;
assign mux2_out = (ALUControl == 3'b000) ? adder_out :
                           (ALUControl == 3'b001) ? adder_out :
                           (ALUControl == 3'b010) ? in1 & in2 :
                           (ALUControl == 3'b011) ? in1 | in2 :
                           (ALUControl == 3'b101) ? {{32{1'b0}},(adder_out[31])} :
                           {33{1'b0}};
assign zero = &(~mux2_out);
assign ALUResult = mux2_out;**/

always @(*) begin

if(ALUControl == 3'b000) begin
ALUResult = in1 + in2;
if(ALUResult == 0) zero = 1;
end

if(ALUControl == 3'b001) begin
ALUResult = in1 - in2;
if(ALUResult == 0) zero = 1;
end

if(ALUControl == 3'b010) begin
ALUResult = in1 & in2;
if(ALUResult == 0) zero = 1;
end

if(ALUControl == 3'b011) begin
ALUResult = in1 | in2;
if(ALUResult == 0) zero = 1;
end




end
    



















endmodule
