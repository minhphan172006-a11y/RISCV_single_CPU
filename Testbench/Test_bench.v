`timescale 1ns/1ps
module tb_top;
    reg clk;
    reg rst;

    RISCV_TOP DUT (
        .clk(clk),
        .rst(rst)
    );

    // Generate clock, 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #12;
        rst = 0;

     

        $display("---- Results after running the program ----");
        $display("x1  (addi, expected 12)  = %d", DUT.RF.regs[1]);
        $display("x2  (addi, expected 5)   = %d", DUT.RF.regs[2]);
        $display("x3  (add,  expected 17)  = %d", DUT.RF.regs[3]);
        $display("x4  (sub,  expected 7)   = %d", DUT.RF.regs[4]);
        $display("x5  (and,  expected 4)   = %d", DUT.RF.regs[5]);
        $display("x6  (or,   expected 13)  = %d", DUT.RF.regs[6]);
        $display("x7  (xor,  expected 9)   = %d", DUT.RF.regs[7]);
        $display("x8  (sll,  expected 384) = %d", DUT.RF.regs[8]);
        $display("x9  (srl,  expected 0)   = %d", DUT.RF.regs[9]);
        $display("x10 (sra,  expected 0)   = %d", DUT.RF.regs[10]);
        $display("x11 (slt,  expected 0)   = %d", DUT.RF.regs[11]);
        $display("x12 (addi, expected 17)  = %d", DUT.RF.regs[12]);
        $display("x13 (ori,  expected 14)  = %d", DUT.RF.regs[13]);
        $display("x14 (xori,  expected 6)  = %d", DUT.RF.regs[14]);
        $display("x15 (slti,  expected 1)  = %d", DUT.RF.regs[15]);
        $display("x16 (sltiu, expected 1)  = %d", DUT.RF.regs[16]);
        $display("x17 (slli,  expected 48) = %d", DUT.RF.regs[17]);
        $display("x18 (srli,  expected 6)  = %d", DUT.RF.regs[18]);
        $display("x19 (srai,  expected 6)  = %d", DUT.RF.regs[19]);
        $display("x20 (sltu,  expected 0)  = %d", DUT.RF.regs[20]);

        $finish;
    end
endmodule
