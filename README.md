# EE316 Digital Logic Design  
## Combinational and Sequential Logic Laboratories

Department of Electrical and Computer Engineering  
The University of Texas at Austin

---

## Overview

This repository contains designs, simulations, and Verilog implementations developed for the EE316 Digital Logic Design laboratory sequence. The labs cover combinational logic design, HDL-based modeling, FPGA implementation, and sequential logic systems using the Digilent Basys3 board and Xilinx Vivado.

---

## Laboratory 2: Combinational Logic Design with Verilog

### Part 1: Combinational Logic Simulation and Design

#### Objective
Analyze a given logic circuit, determine its Boolean function, minimize the logic, and reimplement the circuit using standard logic gates.

#### Tasks
1. Determine the Boolean function implemented by the circuit using a logic simulator.
2. Construct the truth table.
3. Write the Sum-of-Products (SOP) expression.
4. Reduce the function using Boolean algebra.
5. Reimplement the reduced function using only:
   - 2-input AND, OR
   - NAND, NOR
   - Inverters (INV)
6. Verify equivalence using simulation.

#### Deliverables
- Truth table
- SOP and reduced expressions
- Original and redesigned circuit schematics
- Simulation evidence proving equivalence

---

### Part 2: Sprinkler Valve Controller (3×8 Decoder)

#### Description
A combinational sprinkler controller supporting up to 8 zones using a 3×8 decoder with an enable input.

#### Inputs
- `E`: Enable
- `A, B, C`: Binary zone select

#### Outputs
- `d0` through `d7`: Sprinkler valve control signals

Only one output may be active at a time when enabled.

#### Logic Expressions
- $d_0$: $E \cdot A' \cdot B' \cdot C'$
- $d_1$: $E \cdot A' \cdot B' \cdot C$
- $d_2$: $E \cdot A' \cdot B \cdot C'$
- $d_3$: $E \cdot A' \cdot B \cdot C$
- $d_4$: $E \cdot A \cdot B' \cdot C'$
- $d_5$: $E \cdot A \cdot B' \cdot C$
- $d_6$: $E \cdot A \cdot B \cdot C'$
- $d_7$: $E \cdot A \cdot B \cdot C$
