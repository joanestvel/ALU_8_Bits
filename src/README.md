# **ALU 8-Bit - Source Code Overview**  

## **📌 Introduction**  
This folder contains the source code for the 8-bit Arithmetic Logic Unit (ALU), including its VHDL implementation and testbench files. The ALU performs basic arithmetic and logic operations based on control signals.

## **📂 File Structure**  
```
src/
│── Alu_8_Bits.vhd       # VHDL implementation of the ALU
│── TB.vhd               # Testbench for simulation
```

### **🔹 `Alu_8_Bits.vhd` - ALU Implementation**  
- **Inputs:**  
  - `i_A [7:0]` → First operand (8-bit).  
  - `i_B [7:0]` → Second operand (8-bit).  
  - `i_Select [2:0]` → Operation selector (3-bit).  

- **Outputs:**  
  - `Result [7:0]` → ALU output.

- **Supported Operations:**  
  | Op Code | Operation    | Description |
  |---------|------------|-------------|
  | 000    | ADD        | A + B (Signed) |
  | 001    | AND        | Bitwise AND (A & B) |
  | 010    | XOR        | Bitwise XOR (A ⊕ B) |
  | 011    | SLL/SRL0         | Shift Logical with '0' (B <</>> A[2:0])* |
  | 100    | SUB        | A - B (Signed) |
  | 101    | OR        | Bitwise OR (A | B) |
  | 110    | XNOR        | Bitwise XNOR ~(A ⊕ B) |
  | 111    | SLL/SRL1        | Shift Logical with '1' (B <</>> A[2:0])* |

  *The shift direction (left or right) is determined by A[3], and the shift fill value is 0 or 1 based on the operation code.

### **🔹 `TB.vhd` - Testbench**  
- Implements test cases to validate ALU operations.  
- Uses predefined input vectors and compares outputs with expected results.  
- Simulated in **ModelSim**, and results are stored in `Results/Sim_Modelsim.txt`.  

## **🛠️ Simulation & Verification**  
- The ALU was tested using **ModelSim** to ensure correct functionality.  
- **MATLAB** was used to analyze the simulation results (`Matlab_Analysis.txt`).  

## **📖 Additional Notes**  
- The ALU can be extended to support more operations if needed.

