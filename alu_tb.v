`timescale 1ns/1ps

module alu_tb;

  // DUT inputs
  reg [7:0] A, B;
  reg [2:0] ALU_Sel;

  // DUT outputs
  wire [7:0] Result;
  wire CarryOut;
  wire ZeroFlag;
  wire Overflow;

  // Instantiate DUT
  alu dut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .CarryOut(CarryOut),
    .ZeroFlag(ZeroFlag),
    .Overflow(Overflow)
  );


  // GOLDEN MODEL (REFERENCE)

  reg [8:0] temp;
  reg [7:0] expected_result;
  reg expected_carry;
  reg expected_overflow;
  reg expected_zero;

  always @(*) begin
    expected_result = 0;
    expected_carry = 0;
    expected_overflow = 0;

    case (ALU_Sel)

      3'b000: begin // ADD
        temp = A + B;
        expected_result = temp[7:0];
        expected_carry  = temp[8];
        expected_overflow =
          (A[7] & B[7] & ~expected_result[7]) |
          (~A[7] & ~B[7] & expected_result[7]);
      end

      3'b001: begin // SUB
        temp = A - B;
        expected_result = temp[7:0];
        expected_carry  = temp[8];
        expected_overflow =
          (A[7] & ~B[7] & ~expected_result[7]) |
          (~A[7] & B[7] & expected_result[7]);
      end

      3'b010: expected_result = A & B;
      3'b011: expected_result = A | B;
      3'b100: expected_result = A ^ B;
      3'b101: expected_result = ~A;
      3'b110: expected_result = A << 1;
      3'b111: expected_result = A >> 1;

    endcase

    expected_zero = (expected_result == 8'b0);
  end


  // SELF CHECK TASK
  integer pass = 0;
  integer fail = 0;

  task check;
  begin
    #1;

    if ((Result !== expected_result) ||
        (ZeroFlag !== expected_zero) ||
        (CarryOut !== expected_carry) ||
        (Overflow !== expected_overflow)) begin

      $display("FAIL | A=%0d B=%0d SEL=%b | R=%0d Z=%b C=%b O=%b",
                A, B, ALU_Sel, Result, ZeroFlag, CarryOut, Overflow);

      $display("EXPECTED: R=%0d Z=%b C=%b O=%b",
                expected_result, expected_zero, expected_carry, expected_overflow);

      fail = fail + 1;
    end
    else begin
      $display("PASS | A=%0d B=%0d SEL=%b | R=%0d",
                A, B, ALU_Sel, Result);

      pass = pass + 1;
    end
  end
  endtask

 
  // INCLUDE TEST CASES
  `include "testcases.v"


  // SUMMARY
  initial begin
    #5000;
    $display("TEST COMPLETE");
    $display("PASS = %0d", pass);
    $display("FAIL = %0d", fail);
    $finish;
  end

endmodule
