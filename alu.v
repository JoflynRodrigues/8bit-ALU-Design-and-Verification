module alu(
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] Result,
    output reg CarryOut,
    output reg ZeroFlag,
    output reg Overflow
);

  // internal temp signals
  reg [8:0] temp;
  reg [7:0] res;
  reg carry;
  reg ovf;

  always @(*) begin

    // defaults 
    temp    = 9'b0;
    res     = 8'b0;
    carry   = 1'b0;
    ovf     = 1'b0;

    case (ALU_Sel)

      // ADD
      3'b000: begin
        temp  = A + B;
        res   = temp[7:0];
        carry = temp[8];

        ovf = (A[7] & B[7] & ~res[7]) |
              (~A[7] & ~B[7] & res[7]);
      end

      //SUB
      3'b001: begin
        temp  = A - B;
        res   = temp[7:0];
        carry = temp[8];

        ovf = (A[7] & ~B[7] & ~res[7]) |
              (~A[7] & B[7] & res[7]);
      end

      //AND
      3'b010: res = A & B;

      // OR 
      3'b011: res = A | B;

      // XOR
      3'b100: res = A ^ B;

      // NOT
      3'b101: res = ~A;

      //SHL
      3'b110: begin
        res   = A << 1;
        carry = A[7];
      end

      // SHR
      3'b111: begin
        res   = A >> 1;
        carry = A[0];
      end

      default: res = 8'b0;

    endcase
   //final assignments
    Result   = res;
    CarryOut = carry;
    Overflow = ovf;
    ZeroFlag = (res == 8'b0);

  end

endmodule
