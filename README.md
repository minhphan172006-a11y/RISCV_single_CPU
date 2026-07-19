# RISCV_single_CPU
# 📚 Module Index

| Module | File | Function |
|---------|------|----------|
| RISCV_TOP | `RISCV_TOP.v` | Top-level CPU module connecting all submodules |
| Program Counter | `Program_counter.v` | Stores the current Program Counter (PC) |
| PCplus4 | `PCplus4.v` | Calculates the next sequential PC (PC + 4) |
| Instruction Memory | `Instruction_Memory.v` | Fetches instructions from memory |
| Control Unit | `Control_Unit.v` | Generates control signals based on opcode |
| Register File | `Register_file.v` | Stores and reads general-purpose registers |
| Immediate Generator | `immediate_generator.v` | Generates sign-extended immediate values |
| ALU Control | `ALUControl.v` | Determines the ALU operation |
| ALU | `ALU.v` | Executes arithmetic and logical operations |
| Multiplexer | `Multiplexer.v` | Selects ALU input source |
| Testbench | `Test_bench.v` | Used for simulation and verification |

---

# 🔌 Module I/O Description

## 1. RISCV_TOP

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| clk | Input | 1 | System Clock |
| rst | Input | 1 | Reset Signal |

---

## 2. Program_counter

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| clk | Input | 1 | Clock |
| rst | Input | 1 | Reset |
| pc_in | Input | 32 | Next PC |
| pc_out | Output | 32 | Current PC |

---

## 3. PCplus4

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| pc_in | Input | 32 | Current PC |
| pc_out | Output | 32 | PC + 4 |

---

## 4. Instruction_Memory

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| addr | Input | 32 | Instruction Address |
| instruction | Output | 32 | Instruction Data |

---

## 5. Control_Unit

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| opcode | Input | 7 | Instruction Opcode |
| RegWrite | Output | 1 | Register Write Enable |
| ALUSrc | Output | 1 | ALU Source Select |
| ALUOp | Output | 2 | ALU Operation Code |

---

## 6. Register_file

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| clk | Input | 1 | Clock |
| rst | Input | 1 | Reset |
| RegWrite | Input | 1 | Register Write Enable |
| rs1 | Input | 5 | Source Register 1 |
| rs2 | Input | 5 | Source Register 2 |
| rd | Input | 5 | Destination Register |
| wd | Input | 32 | Write Data |
| rd1 | Output | 32 | Read Data 1 |
| rd2 | Output | 32 | Read Data 2 |

---

## 7. immediate_generator

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| instruction | Input | 32 | Instruction |
| immediate | Output | 32 | Sign-Extended Immediate |

---

## 8. ALUControl

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| ALUOp | Input | 2 | ALU Operation Type |
| funct3 | Input | 3 | Function Field |
| funct7 | Input | 7 | Function Field |
| ALUCtrl | Output | 4 | ALU Control Signal |

---

## 9. ALU

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| a | Input | 32 | Operand A |
| b | Input | 32 | Operand B |
| ALUCtrl | Input | 4 | ALU Control |
| result | Output | 32 | ALU Result |
| zero | Output | 1 | Zero Flag |

---

## 10. Multiplexer

| Signal | Direction | Width | Description |
|---------|-----------|-------|-------------|
| in0 | Input | 32 | Input 0 |
| in1 | Input | 32 | Input 1 |
| sel | Input | 1 | Select Signal |
| out | Output | 32 | Selected Output |

---

## 11. Testbench

Simulation environment used to verify the functionality of the RISC-V processor.

# 🔄 Overall Operation Flow

1. **Fetch** – The Program Counter (PC) sends the instruction address to the Instruction Memory.
2. **Decode** – The Control Unit decodes the instruction, while the Register File and Immediate Generator prepare the required operands.
3. **Execute** – The ALU performs arithmetic or logical operations based on the control signals.
4. **Write Back** – The ALU result is written back to the Register File if required.
5. **Update PC** – The PC is incremented by 4 (`PC + 4`) to fetch the next instruction.


