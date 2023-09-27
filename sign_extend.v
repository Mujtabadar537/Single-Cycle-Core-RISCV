module sign_extend(

input [1:0]ImmSrc,
input [31:0]In,

output [31:0]ImmExt


);


assign ImmExt = (ImmSrc == 1'b1) ? ({{20{In[31]}},In[31:25],In[11:7]}) : {{20{In[31]}},In[31:20]};







endmodule
