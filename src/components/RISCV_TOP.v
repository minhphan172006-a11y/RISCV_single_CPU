module RISCV_TOP(
    input clk,
    input rst
);
    wire [31:0] pc_current, pc_plus4;
    wire [31:0] instruction;
    wire RegWrite, ALUSrc;
    wire [1:0] ALUOp;
    wire [3:0] ALUCtrl;
    wire [31:0] reg_rd1, reg_rd2, imm, alu_b, alu_result;
    wire zero_unused;

    Program_counter PC (
        .clk(clk), .rst(rst),
        .pc_in(pc_plus4),   
        .pc_out(pc_current)
    );

    PCplus4 PC4 (
        .pc_in(pc_current),
        .pc_out(pc_plus4)
    );

    Instruction_Memory IMEM (
        .addr(pc_current),
        .instruction(instruction)
    );

    Control_Unit CU (
        .opcode(instruction[6:0]),
        .RegWrite(RegWrite), .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)
    );

    Register_file RF (
        .clk(clk), .rst(rst),
        .RegWrite(RegWrite),
        .rs1(instruction[19:15]), .rs2(instruction[24:20]), .rd(instruction[11:7]),
        .wd(alu_result),          
        .rd1(reg_rd1), .rd2(reg_rd2)
    );

    immediate_generator IMMGEN (
        .instr(instruction),
        .imm(imm)
    );

    Multiplexer ALU_MUX (
        .in0(reg_rd2), .in1(imm),
        .sel(ALUSrc),
        .out(alu_b)
    );

    ALUControl ALUCTRL (
        .ALUOp(ALUOp), .funct3(instruction[14:12]), .funct7_5(instruction[30]),
        .ALUCtrl(ALUCtrl)
    );

    ALU ALU_UNIT (
        .a(reg_rd1), .b(alu_b), .ALUCtrl(ALUCtrl),
        .result(alu_result), .Zero(zero_unused)
    );

endmodule
