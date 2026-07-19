module immediate_generator(
    input  [31:0] instr,
    output reg [31:0] imm
);
    wire [6:0] opcode = instr[6:0];

    always @(*) begin
        case (opcode)
            7'b0010011: 
                imm = {{20{instr[31]}}, instr[31:20]};
            default:
                imm = 32'b0;
        endcase
    end
endmodule
