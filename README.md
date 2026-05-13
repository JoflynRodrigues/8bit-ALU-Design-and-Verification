# 8-bit ALU Design and Verification (Verilog)

## 📌 Overview

This project implements and verifies an 8-bit Arithmetic Logic Unit
(ALU) in Verilog.\
The ALU supports arithmetic, logical, and shift operations with carry,
overflow, and zero flag generation.

The design is fully combinational and verified using a self-checking
testbench with an integrated golden reference model.

------------------------------------------------------------------------

## ⚙️ Supported Operations

  ALU_Sel   Operation
  --------- -------------------
  000       ADD
  001       SUB
  010       AND
  011       OR
  100       XOR
  101       NOT
  110       Shift Left (SHL)
  111       Shift Right (SHR)

------------------------------------------------------------------------

## 🧠 Design Features

-   8-bit combinational ALU\
-   Carry-out generation\
-   Signed overflow detection (ADD, SUB)\
-   Zero flag generation\
-   Clean RTL and testbench separation

------------------------------------------------------------------------

## 🧪 Verification Methodology

The ALU was verified using a structured self-checking Verilog testbench:

-   Golden reference model for automatic result comparison\
-   Directed test cases for each operation\
-   Edge case validation (overflow, underflow, zero result)\
-   Loop-based automated testing (500+ test cases)\
-   Pass/Fail tracking with mismatch reporting\
-   Waveform-based debugging using Cadence tools

------------------------------------------------------------------------

## 🛠 Tools Used

-   Verilog HDL\
-   Cadence Simulator\
-   GTKWave (optional waveform analysis)\
-   Git

------------------------------------------------------------------------

## 📂 Project Structure

    rtl/    → ALU RTL implementation  
    tb/     → Testbench and testcases  

------------------------------------------------------------------------

## 📊 Results

-   Complete functional validation across all supported operations\
-   Successful verification of Carry, Overflow, and Zero flags\
-   Automated execution of 500+ test cases

------------------------------------------------------------------------

## 🎯 Learning Outcomes

-   RTL design of arithmetic and logical datapath components\
-   Implementation of overflow detection logic\
-   Development of a self-checking verification environment\
-   Automated validation using a golden reference model\
-   Debugging with waveform analysis tools
