# Edge Detector Design and Verification

## **Overview**
This project involves the design of an **edge detector** module in Verilog, capable of detecting both rising edges and falling edges of an input signal (`sig_in`). The outputs of the module are:
- `pulse_out_p`: High for one clock cycle when a rising edge is detected.
- `pulse_out_n`: High for one clock cycle when a falling edge is detected.

The design is verified using a testbench and simulated with **Icarus Verilog** and **GTKWave**.

---

## **Logic Design**
The edge detector is based on comparing the current state (`sig_in`) and the previous state (`sig_in_prev`) of the input signal. The logic equations for the outputs are as follows:

- **Rising Edge Detection (`pulse_out_p`)**:
  - Equation: `pulse_out_p = sig_in & ~sig_in_prev`
  - Triggered when `sig_in` transitions from 0 to 1.

- **Falling Edge Detection (`pulse_out_n`)**:
  - Equation: `pulse_out_n = ~sig_in & sig_in_prev`
  - Triggered when `sig_in` transitions from 1 to 0.

### **Truth Table**
| `sig_in_prev` | `sig_in` | `pulse_out_p` | `pulse_out_n` |
|---------------|----------|---------------|---------------|
| 0             | 0        | 0             | 0             |
| 0             | 1        | 1             | 0             |
| 1             | 0        | 0             | 1             |
| 1             | 1        | 0             | 0             |

### **Bìa Karnaugh (K-Map)**
**For `pulse_out_p`**:
```
        sig_in
       0   1
   ------------
   0 |  0   1   <-- sig_in_prev = 0
   1 |  0   0   <-- sig_in_prev = 1
```
**For `pulse_out_n`**:
```
        sig_in
       0   1
   ------------
   0 |  0   0   <-- sig_in_prev = 0
   1 |  1   0   <-- sig_in_prev = 1
```
The equations derived from these K-Maps validate the logic used in the design.

---

### **Expected Results**
- When `sig_in` has a rising edge (`0 -> 1`), `pulse_out_p` should go high for one clock cycle.
- When `sig_in` has a falling edge (`1 -> 0`), `pulse_out_n` should go high for one clock cycle.

---

## **Verification Results**
The simulation results confirm that the module correctly detects both rising and falling edges:
- `pulse_out_p` is asserted for one clock cycle during a rising edge.
- `pulse_out_n` is asserted for one clock cycle during a falling edge.

---


## **Conclusion**
The edge detector module is successfully designed, implemented, and verified. It reliably detects both rising and falling edges of the input signal, as confirmed by simulation results.

---

## **Tools Used**
- **Icarus Verilog**: For RTL simulation.
- **GTKWave**: For waveform analysis.
- **Ubuntu**: Operating system environment.

