module register_file(

input clk,reset,WE3,
input [4:0]A1,A2,A3,
input [31:0]WD3,

output [31:0]RD1,RD2


);


reg [31:0] register [31:0];


always @(posedge clk) begin

if(WE3) begin
register[A3] <= WD3;
end


end


assign RD1 = (reset) ? 32'h00000000 : register[A1];
assign RD2 = (reset) ? 32'h00000000 : register[A2];




endmodule
