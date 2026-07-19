module Control_Unit(
    input  [6:0] opcode,
    output reg RegWrite,
    output reg ALUSrc,
    output reg [1:0] ALUOp
);
    always @(*) begin
        RegWrite = 0; ALUSrc = 0; ALUOp = 2'b00;

        case (opcode)
            7'b0110011: begin // R-type: add, sub, and, or, xor, sll, srl, sra, slt
                RegWrite = 1; ALUSrc = 0; ALUOp = 2'b10;
            end
            7'b0010011: begin // I-type ALU: addi, ori, ...
                RegWrite = 1; ALUSrc = 1; ALUOp = 2'b11;
            end
            default: ; 
        endcase
    end
endmodule
