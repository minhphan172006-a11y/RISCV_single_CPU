module ALUControl(
    input  [1:0] ALUOp,
    input  [2:0] funct3,
    input funct7_5,
    output reg [3:0] ALUCtrl
);
    
    always @(*) begin
        case (ALUOp)
            2'b10: begin // R-type
                case (funct3)
                    3'b000: ALUCtrl = funct7_5 ? 4'b0110 : 4'b0010; // sub / add
                    3'b111: ALUCtrl = 4'b0000; // and
                    3'b110: ALUCtrl = 4'b0001; // or
                    3'b100: ALUCtrl = 4'b0011; // xor
                    3'b001: ALUCtrl = 4'b0100; // sll
                    3'b101: ALUCtrl = funct7_5 ? 4'b0111 : 4'b0101; // sra / srl
                    3'b010: ALUCtrl = 4'b1000; // slt
                    3'b011: ALUCtrl = 4'b1001; // sltu
                    default: ALUCtrl = 4'b0010;
                endcase
            end
            2'b11: begin // I-type ALU
                case (funct3)
                    3'b000: ALUCtrl = 4'b0010; // addi
                    3'b110: ALUCtrl = 4'b0001; // ori
                    3'b111: ALUCtrl = 4'b0000; // andi
                    3'b100: ALUCtrl = 4'b0011; // xori
                    3'b001: ALUCtrl = 4'b0100; // slli
                    3'b101: ALUCtrl = funct7_5 ? 4'b0111 : 4'b0101; // srai / srli
                    3'b010: ALUCtrl = 4'b1000; // slti
                    3'b011: ALUCtrl = 4'b1001; // sltiu
                    default: ALUCtrl = 4'b0010;
                endcase
            end
            default: ALUCtrl = 4'b0010;
        endcase
    end
endmodule
