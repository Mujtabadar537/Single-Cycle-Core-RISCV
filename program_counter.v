module program_counter(

input clk,reset,
input [31:0]pcnext,

output reg [31:0]pc

);

always @(posedge clk)
begin
if(reset) begin
pc <= 32'h00000000;
end

else begin
pc <= pcnext;
end


end



endmodule

