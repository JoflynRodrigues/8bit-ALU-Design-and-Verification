integer i, j;

// initial block
initial begin

  $display("Starting ALU Testbench..\n");

  // -------------------------
  // DIRECTED TESTS
  // -------------------------
  A = 8'd10; B = 8'd5;  ALU_Sel = 3'b000; check(); #5; // ADD
  A = 8'd10; B = 8'd5;  ALU_Sel = 3'b001; check(); #5; // SUB
  A = 8'd12; B = 8'd3;  ALU_Sel = 3'b010; check(); #5; // AND
  A = 8'd12; B = 8'd3;  ALU_Sel = 3'b011; check(); #5; // OR
  A = 8'd12; B = 8'd3;  ALU_Sel = 3'b100; check(); #5; // XOR
  A = 8'd12; B = 8'd0;  ALU_Sel = 3'b101; check(); #5; // NOT
  A = 8'd1;  B = 8'd0;  ALU_Sel = 3'b110; check(); #5; // SHL
  A = 8'd128; B = 8'd0; ALU_Sel = 3'b111; check(); #5; // SHR


  //edge cases

  A = 8'd255; B = 8'd1;  ALU_Sel = 3'b000; check(); #5; // overflow add
  A = 8'd0;   B = 8'd1;  ALU_Sel = 3'b001; check(); #5; // underflow sub
  A = 8'd0;   B = 8'd0;  ALU_Sel = 3'b000; check(); #5; // zero result


  //exhaustive for loop

  for (i = 0; i < 10; i = i + 1) begin
    for (j = 0; j < 10; j = j + 1) begin

      A = i;
      B = j;

      ALU_Sel = 3'b000; check(); #2;
      ALU_Sel = 3'b001; check(); #2;
      ALU_Sel = 3'b010; check(); #2;
      ALU_Sel = 3'b011; check(); #2;
      ALU_Sel = 3'b100; check(); #2;

    end
  end

  $display("\nAll tests executed.\n");

end
