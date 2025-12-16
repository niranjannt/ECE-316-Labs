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

# Lab 3 - Part 2 & Part 3

## Part 2: Implementation of Sprinkler Controller

**Specification**

In this part, the Sprinkler Controller system designed in Lab 2 is implemented on the Digilent Basys Board.

1. Use the specifications from Lab 2 regarding the system function. The code from Lab 2 can be re-used.
2. Assume that the on-board LEDs act as sprinkler valves - map each output (`d0`, `d1`, ..., `d7`) to exactly one LED.
3. Control the sprinkler valves using the switches on the board:
   - `SW2 = A`
   - `SW1 = B`
   - `SW0 = C`
   - `SW7 = E`

---

## Part 3: BCD-to-7-Segment LED Display

**Specification**

### Part A
Using a truth table, design a gate-level implementation for a BCD-to-7-segment decoder, which converts a 4-bit BCD number to its corresponding 7-segment display output. Each segment (`a` to `g`) is a different output controlled independently. 

### Part B
Implement the BCD-to-7-segment decoder using structural (gate-level) Verilog and deploy it on the Basys3 board. Use switches `SW[3:0]` to control the decimal number displayed on the right-most LED display (`AN1`).

**Hints and Notes**

1. A BCD number ranges from 0 → 9, mapped to 4-bit binary:
2. The 7-segment display segments are active low: assign `0` to turn on a segment.
3. Minimize the equations for each output before implementation.
4. For input > 9, turn off the 7-segment display.
5. Only the second-rightmost 7-segment display (`AN1`) will be used; other displays (`AN0`, `AN2`, `AN3`) must be deactivated (assigned `1`).

**Deliverables and Demonstration**

- Truth table mapping inputs to outputs, minimized equations, and gate-level design.
- Structural Verilog code, testbench, and constraints file.
- Demonstration of the BCD-to-7-segment decoder functioning on the Basys3 board.

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

# Lab 5: Calculator Using RCA and CLA  
## Basys3 FPGA

---

## Overview

This lab implements a calculator that adds two 4-bit numbers entered using the Basys3 board switches. The result is stored in a 5-bit register controlled by a button and displayed on the LEDs.

Two different adder architectures are implemented:
- Ripple Carry Adder (RCA)
- Carry Lookahead Adder (CLA)

A comparison is performed to analyze speed and hardware complexity.

---

## Part 1: Calculator Using Ripple Carry Adder (RCA)

- Implements a 4-bit ripple carry adder
- Carry propagates sequentially through all stages
- Simple design with higher propagation delay

---

## Part 2: Calculator Using Carry Lookahead Adder (CLA)

- Implements a 4-bit carry lookahead adder
- Uses generate and propagate logic
- Reduces carry propagation delay

---

## Part 3: Speed and Area Comparison

The two designs are compared based on:
- Propagation delay
- Logic complexity
- FPGA area utilization

---

## Objectives

- Design a 4-bit adder-based calculator
- Store results in a register controlled by a button
- Display output using LEDs
- Compare RCA and CLA architectures

---

## Hardware Architecture

- Two 4-bit operands from switches
- Adder (RCA or CLA)
- 5-bit output register
- Store button
- LED display output

---

## Equipment

- PC or compatible system
- Digilent Basys3 FPGA Evaluation Board

---

## Deliverables

- Verilog source files
- Constraint file
- FPGA bitstream
- Analysis of RCA vs. CLA

# Lab 6: Programmable Stopwatch / Timer  
## Basys3 FPGA

---

## Overview

This lab implements a programmable stopwatch and timer using the Basys3 FPGA board. The design uses the four 7-segment displays to show time with a resolution of 10 milliseconds.

- Two MSB digits: seconds
- Two LSB digits: hundredths of a second
- Range: 00.00 to 99.99

---

## Operating Modes

The system supports four programmable modes.

### Mode 0: Count Up from 00.00
- Initializes to 00.00
- Start/Stop toggles counting
- Stops at 99.99
- Reset returns to 00.00

---

### Mode 1: Count Down from 99.99
- Initializes to 99.99
- Counts down to 00.00
- Start/Stop toggles pause/resume
- Reset returns to 99.99

---

### Mode 2: Count Up from Externally Loaded Value
- Same behavior as Mode 0
- Initial seconds value loaded from switches
- Only seconds digits are loaded

---

### Mode 3: Count Down from Externally Loaded Value
- Same behavior as Mode 1
- Initial seconds value loaded from switches
- Only seconds digits are loaded

---

## Design Notes

- Behavioral Verilog is recommended
- FSM-based controller
- Clock division used for 10 ms timing
- Mode 1 recommended as initial implementation

---

## Mapping Specifications

### Buttons
- Button 1: Start / Stop
- Button 2: Reset  
  - In Modes 2 and 3, reset reloads preset value

### Switches
- 2 switches for mode selection
- 8 switches for preset seconds value
  - Tens digit (4 switches)
  - Ones digit (4 switches)

### Outputs
- Four 7-segment displays
- Onboard clock

---

## Deliverables

- High-Level State Machine (HLSM)
- Datapath and controller FSM
- Verilog source files
- Constraint file
- FPGA bitstream

