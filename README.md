# IEEE-13-Bus-Analysis-with-varying-loads-and-Solar-PV-placement
This work involves the analysis with 
1)Base case distribution system 
2)With load Alteration 
3)With Optimal PV placement

# Introduction:
In a existing IEEE 13 Bus unbalanced system introduction of varying loads with suitable capacitor compensation is done to understand whether the IEEE 13 bus is suitable and how it becomes stable after addition of loads which replicates the behaviour of the feeder connected in the rural areas which has unbalanced load distribution due to the presence of two phase induction motors and multiple single-phase pumps which consumes unequal power, Also during the seasons when more power is needed for the domestication and agricultrual purposes,their would be increased usage of such loads,this process is being   analyzed with openDSS with additional loads and capacitor in IEEE 13 bus distribution system.

# Key words used:
1. Open-Source Distribution System Simulator
2. Additional loads
3. IEEE 13 Bus system
4. Unbalanced
5. Capacitor Compensation

# 4-Stage Distribution System Methodology Framework

## Overview & System Evolution
This research framework evaluates distribution grid resilience, voltage profile enhancement, and loss mitigation across four progressive operational scenarios on the IEEE 13-node test feeder.

---


# 4-Stage Distribution System Methodology

Evaluates grid resilience, voltage profiles, and loss mitigation on the IEEE 13-node test feeder across four scenarios.

---

### 1. Workflow Summary

| Stage | Scenario | Core Objective |
| :--- | :--- | :--- |
| **Stage 01** | **Baseline Assessment** | Benchmark unmodified grid |
| **Stage 02** | **Load Perturbation** | Stress-test under demand variations |
| **Stage 03** | **PV Integration** | Active power injection ($P$) |
| **Stage 04** | **PV-BESS Optimization** | Dynamic storage & reactive support ($P/Q$) |

---

### 2. Methodology Matrix

| Phase | Scenario | Objective | Operating Condition | Primary Metrics |
| :--- | :--- | :--- | :--- | :--- |
| **I** | **Base Profiling** | Set baseline profiles | Nominal load, no DERs | $I^2R$ losses, voltage drop ($\Delta V$) |
| **II** | **Load Alteration** | Test resilience | Fluctuating load ($\pm \Delta P, \pm \Delta Q$) | Thermal limits, voltage sag |
| **III** | **PV Placement** | Reduce power deficit | Distributed active injection ($P_{\text{PV}}$) | Reverse power flow, $P \cdot R$ drop |
| **IV** | **PV-BESS Hybrid** | Peak shaving & voltage control | Coordinated active & reactive support | Loss reduction, ANSI C84.1 compliance |

---

### 3. Mathematical Power Flow Progression

$$\text{Load } (P_L + jQ_L) \xrightarrow{\text{Alter}} (P_L' + jQ_L') \xrightarrow{\text{+ PV}} (P_L' - P_{\text{PV}} + jQ_L') \xrightarrow{\text{+ BESS}} (\underbrace{P_L' - P_{\text{PV}} - P_{\text{BESS}}}_{\text{Net } P \rightarrow 0} + j\underbrace{(Q_L' - Q_{\text{BESS}})}_{\text{Net } Q \rightarrow 0})$$

---

### 4. Descriptions

#### Technical Abstract
> The study uses four phases: **Base Profiling** sets benchmark power flow; **Load Perturbation** tests grid resilience; **PV Integration** reduces losses via active injection ($P_{\text{PV}}$); and **PV-BESS Optimization** uses battery storage and reactive support to maintain voltages within ANSI C84.1 limits.

#### Presentation Highlights
* **Phase 1: Baseline** — Benchmarking $I^2R$ line losses and nodal voltage drops under standard conditions.
* **Phase 2: Stress Testing** — Analyzing system vulnerability during extreme demand variations.
* **Phase 3: Targeted PV** — Optimal solar allocation to offset active power flows ($P \cdot R$).
* **Phase 4: Coordinated PV-BESS** — Storage dispatch for power balancing and voltage stabilization.
* **Phase 2: Stress Testing & Load Perturbation** — Analyzing system vulnerability during extreme demand variations.
* **Phase 3: Targeted PV Generation** — Optimal allocation and sizing of solar units to offset active line power flows ($P \cdot R$).
* **Phase 4: Coordinated PV-BESS Dispatch** — Deploying energy storage for active power balancing and smart-inverter voltage stabilization.

```
