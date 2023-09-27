module instruction_memory(

input reset,
input [31:0]A,

output [31:0]RD


);

reg [31:0] memory [1023:0];

assign RD = (reset) ? 32'h00000000 : memory[A[31:2]];


initial begin

$readmemh("instructions.hex",memory);

end



endmodule
