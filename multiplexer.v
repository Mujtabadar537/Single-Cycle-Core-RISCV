module multiplexer(

input [31:0]in1,in2,
input sel,

output [31:0]out

);

assign out = (sel == 0) ? in1 : in2;



endmodule
