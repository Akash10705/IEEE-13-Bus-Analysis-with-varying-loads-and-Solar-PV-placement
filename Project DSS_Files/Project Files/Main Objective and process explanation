# OpenDSS Simulation & Analysis Workflow (2,160-Hour Evaluation)

Evaluates the impact of PV integration (`PVSystem.PV675`) on an IEEE 13-node grid over a 90-day (2,160-hour) operational period by comparing **Case 1 (Baseline)** and **Case 2 (With PV)**.

---

### 1. Execution Pipeline

| Step | Module | Key Action |
| :--- | :--- | :--- |
| **01** | **Initialization** | Connects to OpenDSS via COM interface and compiles `IEEE13Master1.dss`. |
| **02** | **Quasi-Static Loops** | Runs 2,160 sequential hourly power flow solves for Case 1 and Case 2. |
| **03** | **Data Extraction** | Logs hourly active/reactive losses ($kW, kVAR$) and nodal voltages ($V, \text{p.u.}$). |
| **04** | **Analytics & Display** | Aggregates total losses ($kWh, kVARh$) and displays the `LossComparison` table. |

---

### 2. Output Visualization & Data Archiving

#### Graphical Plots Generated
* **Active Loss Profile:** 2,160-hour timeline of active power losses ($kW$).
* **Reactive Loss Profile:** 2,160-hour timeline of reactive power losses ($kVAR$).
* **Final-Hour Voltage Profile:** Phase-by-phase nodal voltage snapshot at Hour 2,160.
* **Minimum Voltage Horizon:** Hourly timeline tracking lowest feeder voltages to verify ANSI compliance.

#### Generated Data Artifacts
* `Yearly_Losses_Comparison.xlsx` — Hourly active and reactive loss logs.
* `Total_Yearly_Loss_Comparison.xlsx` — Summary of cumulative energy losses.
* `FinalHourVoltageProfile.xlsx` — Nodal voltage magnitudes at Hour 2,160.
* `IEEE13_YearlyResults.mat` — Complete MATLAB workspace archive.
