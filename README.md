# 🔷 1001 Sequence Detector | Moore FSM | Verilog HDL

<p align="center">
  <img src="https://img.shields.io/badge/HDL-Verilog-blue?style=for-the-badge&logo=verilog" />
  <img src="https://img.shields.io/badge/Design-Moore%20FSM-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Synopsys%20VCS-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Waveform-Synopsys%20Verdi-green?style=for-the-badge" />
</p>

---

## 📌 Project Overview

This project implements a **1001 Serial Sequence Detector** using a **Moore Finite State Machine (FSM)** in Verilog HDL.

The design detects the input pattern `1001` from a serial input stream and supports **overlapping sequence detection**. The project includes RTL design, testbench development, functional simulation using Synopsys VCS, and waveform analysis using Synopsys Verdi.

Since this is a **Moore FSM**, the output depends only on the **present state** and not directly on the input.

---

## ⚙️ Design Specifications

| Parameter | Description |
|-----------|-------------|
| **Design** | 1001 Sequence Detector |
| **FSM Model** | Moore Machine |
| **Number of States** | 5 |
| **Target Sequence** | `1001` |
| **Overlapping Detection** | Supported |
| **Reset** | Asynchronous Active-High |
| **HDL** | Verilog |
| **Simulation** | Synopsys VCS |
| **Waveform Analysis** | Synopsys Verdi |

---

## 🔄 FSM State Transition

| Present State | Input `0` | Input `1` | Output |
|---------------|-----------|-----------|--------|
| **S0** | S0 | S1 | 0 |
| **S1** | S2 | S1 | 0 |
| **S2** | S3 | S1 | 0 |
| **S3** | S0 | S4 | 0 |
| **S4** | S2 | S1 | 1 |

### State Description

- **S0** → No matching bits detected.
- **S1** → First `1` detected.
- **S2** → Sequence `10` detected.
- **S3** → Sequence `100` detected.
- **S4** → Complete sequence `1001` detected, so output becomes `1`.

Since this is a **Moore FSM**, the output is associated with state `S4`.

---

## 🧠 Sequence Detection

The target sequence is:

`1 → 0 → 0 → 1`

FSM progression:

`S0 --1--> S1 --0--> S2 --0--> S3 --1--> S4`

When the FSM enters `S4`, the complete sequence `1001` has been detected:

`Output = 1`

The design supports **overlapping detection** by transitioning from `S4` to an appropriate partial-match state instead of always returning to `S0`.

---

## 🔁 Overlapping Detection

The detector supports overlapping sequence detection.

For example:

    Input:  1 0 0 1 0 0 1

The sequence `1001` is detected twice:

    Input:  1 0 0 1 0 0 1
             └──────┘
                1001
               DETECT

                   1 0 0 1
                   └───────┘
                      1001
                     DETECT

The corresponding detection output is:

    Output: 0 0 0 1 0 0 1

This demonstrates successful **overlapping sequence detection**.

---

## 🧪 Simulation and Verification

### Tools Used

- **Verilog HDL** — RTL Design
- **Synopsys VCS** — Functional Simulation
- **Synopsys Verdi** — Waveform Analysis

### Compile

    vcs -full64 -kdb -debug_access+all sequence_detector_1001_moore.v tb_sequence_detector_1001_moore.v -o simv

### Run Simulation

    ./simv

### Open Waveform

    verdi -dbdir simv.daidir &

---

## 📊 Simulation Waveform

<p align="center">
  <img src="sequence_detector_1001_moore_verdi.png" alt="1001 Moore Sequence Detector Waveform in Synopsys Verdi" width="100%">
</p>

<p align="center">
  <b>Figure 1: Functional simulation waveform captured using Synopsys Verdi.</b>
</p>

---

## 📈 Expected Output

### Input Sequence

    1  0  0  1  0  0  1

### FSM States

    S1 S2 S3 S4 S2 S3 S4

### Detected Output

    0  0  0  1  0  0  1

The sequence `1001` is detected twice.

    Input:  1 0 0 1 0 0 1
             └──────┘
                1001
               DETECT

                   1 0 0 1
                   └───────┘
                      1001
                     DETECT

---

## 📁 Repository Structure

    1001-Moore-Sequence-Detector/
    │
    ├── sequence_detector_1001_moore.v
    ├── tb_sequence_detector_1001_moore.v
    ├── sequence_detector_1001_moore_verdi.png
    └── README.md

---

## 🎯 Learning Outcomes

- Understanding **Moore FSM architecture**
- Designing state transition logic in Verilog
- Implementing sequence detection
- Implementing overlapping sequence detection
- Understanding the difference between Moore and Mealy FSMs
- Writing Verilog RTL and testbenches
- Performing functional simulation using **Synopsys VCS**
- Debugging RTL using **Synopsys Verdi**
- Analyzing digital waveforms
- Understanding practical RTL verification flow

---

## 🚀 Future Improvements

- Parameterized sequence detector for arbitrary patterns
- Mealy FSM implementation for comparison
- Multiple sequence pattern detection
- SystemVerilog assertions
- Functional and code coverage
- RTL synthesis and PPA analysis
- Timing analysis
- RTL-to-GDSII implementation

---

<p align="center">
  <b>Designed and Simulated using Verilog HDL</b>
  <br>
  <i>Digital Design | Finite State Machines | RTL Verification</i>
</p>
