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



#### Implementation
- Structural Verilog (gate-level)
- Behavioral Verilog (case-based)
- Exhaustive simulation via testbench

#### FPGA Mapping
- `SW7` → Enable (`E`)
- `SW2, SW1, SW0` → `A, B, C`
- `LED0–LED7` → `d0–d7`

---

### Part 3: Computer Data Bus Controller (4×1 Multiplexer)

#### Description
Design and verify a 4×1 multiplexer controlling a single-wire data bus.

#### Inputs
- `i0, i1, i2, i3`: Data inputs
- `s1, s0`: Select lines

#### Output
- `d`: Selected data output

#### Requirements
- Structural and behavioral Verilog models
- Testbench with at least 8 test cases
- Simulation verification

---

## Laboratory 3: FPGA Implementation of AND Gate

### Objective
Implement a 2-input AND gate on the Basys3 FPGA board.

#### Mapping
- `SW1` → Input A
- `SW0` → Input B
- `LED0` → Output

#### Verification
- Behavioral simulation
- FPGA synthesis, implementation, and bitstream programming
- Physical verification using switches and LED

---

## Laboratory 4: Sequential Logic Design

### Overview
Design and implement sequential logic systems using behavioral Verilog.

### Topics Covered
- Finite State Machines (FSM)
- Rising edge detector
- Time-multiplexed 7-segment display control

### Learning Objectives
- Clock-synchronous design
- Clock division
- FSM modeling
- Multi-digit display multiplexing

---

## Tools and Hardware

- Xilinx Vivado Design Suite
- Digilent Basys3 FPGA Board
- Verilog HDL

---

## Deliverables Summary

- Verilog source files
- Structural and behavioral models
- Testbenches
- Simulation waveforms
- FPGA constraint files
- Demonstrations on Basys3 hardware

---

