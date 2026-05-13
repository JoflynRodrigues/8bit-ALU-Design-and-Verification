📌 Overview

This project implements and verifies an 8-bit Arithmetic Logic Unit (ALU) in Verilog. The design supports arithmetic, logical, and shift operations along with carry, overflow, and zero flag generation.

The verification environment is self-checking and includes an integrated golden reference model for automatic result comparison.

⚙️ Supported Operations
ALU_Sel	Operation
000	ADD
001	SUB
010	AND
011	OR
100	XOR
101	NOT
110	Shift Left (SHL)
111	Shift Right (SHR)
🧠 Design Features
8-bit combinational ALU
Carry-out generation for arithmetic and shift operations
Signed overflow detection for ADD and SUB
Zero flag generation
Clean separation between RTL and testbench
🧪 Verification Methodology

The ALU was verified using a structured, self-checking Verilog testbench:

Integrated golden reference model for expected result calculation
Directed test cases for each operation
Edge case validation (overflow, underflow, zero result conditions)
Loop-based automated testing (500+ test cases)
Pass/Fail tracking with detailed mismatch reporting
Waveform-based debugging using Cadence simulation tools
🛠 Tools Used
Verilog HDL
Cadence simulator
GTKWave (optional waveform analysis)
Git
📂 Project Structure
rtl/        → ALU RTL implementation  
tb/         → Testbench and testcases  
docs/       → Documentation (optional diagrams/screenshots)
📊 Results
Complete functional validation across all supported operations
Successful verification of arithmetic flags (Carry, Overflow, Zero)
Automated execution of 500+ test cases
🎯 Learning Outcomes
RTL design of arithmetic and logical datapath components
Implementation of overflow detection logic
Development of a self-checking verification environment
Automated functional validation using golden reference comparison
Debugging using waveform analysis tools
