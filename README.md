# ALU 8-Bit Implementation

## Description
This project implements an 8-bit Arithmetic Logic Unit (ALU) using VHDL. The ALU is capable of performing various arithmetic and logical operations such as addition, subtraction, bitwise AND, OR, XOR, XNOR, and shift operations. The design has been tested using ModelSim and analyzed with MATLAB.

## Project Structure
```
ALU_8_Bits/
│-- src/
│   │-- Alu_8_Bits.vhd      # ALU implementation in VHDL
│   │-- TB.vhd              # Testbench for ALU simulation
│-- Results/
│   │-- Sim_Modelsim.txt    # Simulation results from ModelSim
│   │-- Matlab_Analysis.txt # Analysis results from MATLAB
│-- scripts/
│   │-- Analyze_ALU.m       # MATLAB script for result analysis
│-- README.md               # Project documentation
```

## Features
- 8-bit ALU supporting multiple operations.
- Implemented in VHDL and tested using ModelSim.
- MATLAB script for analyzing and verifying simulation results.

## Requirements
- ModelSim for VHDL simulation.
- MATLAB for result analysis.
- Git for version control.

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/joanestvel/ALU_8_Bits.git
   cd ALU_8_Bits
   ```
2. Run the ModelSim simulation:
   - Open ModelSim and compile the VHDL files inside `src/`.
   - Run the testbench `TB.vhd` and save the simulation results.
3. Analyze results using MATLAB:
   - Run the `Analyze_ALU.m` script inside `scripts/`.

## Results
The ALU results are stored in the `Results/` directory. The MATLAB script compares the expected and actual outputs to verify correctness.

## Contribution
Contributions are welcome! If you want to improve the ALU, add new operations, or optimize the design, feel free to open a pull request.

## License
This project is open-source and available under the MIT License.

