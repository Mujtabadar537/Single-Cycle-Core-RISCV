module testbench_RISCV;
    
    reg clk=1'b1,reset;

    RISCV_Top processor(
                .clk(clk),
                .reset(reset)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #30;  
        
    end
    
   initial
    begin
        reset <= 1'b1;
        #100

        reset <=1'b0;
        #1500;
        $finish;
    end
endmodule
