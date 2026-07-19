module ALU(
    input  [31:0] a,
    input  [31:0] b,
    input  [3:0]  ALUCtrl,
    output reg [31:0] result,
    output Zero
);
    assign Zero = (result == 32'b0);

    always @(*) begin
        case (ALUCtrl)
            4'b0010: result = a + b;
            4'b0110: result = a - b;
            4'b0000: result = a & b;
            4'b0001: result = a | b;
            4'b0011: result = a ^ b;
            4'b0100: result = a << b[4:0];
            4'b0101: result = a >> b[4:0];
            4'b0111: result = $signed(a) >>> b[4:0];
            4'b1000: result = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
            4'b1001: result = (a < b) ? 32'b1 : 32'b0; // sltu / sltiu
            default: result = 32'b0;
        endcase
    end
endmodule
