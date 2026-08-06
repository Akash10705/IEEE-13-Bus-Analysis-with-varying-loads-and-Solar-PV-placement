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

### 1. Architectural Workflow
Here is the complete methodology framed under a single unified heading and formatted inside a clean Markdown container ready to copy and paste directly into your GitHub repository (`README.md` or wiki page).

```markdown
# 4-Stage Distribution System Methodology Framework

## Overview & System Evolution
This research framework evaluates distribution grid resilience, voltage profile enhancement, and loss mitigation across four progressive operational scenarios on the IEEE 13-node test feeder.

---

### 1. Architectural Workflow

```

[ Stage 01 ] Baseline Assessment       ➜   Standard Unmodified IEEE 13-Node Grid
[ Stage 02 ] Dynamic Load Perturbation  ➜   Stress-Testing under Load Variations
[ Stage 03 ] Strategic PV Integration   ➜   Optimal Sizing & Placement (P-Injection)
[ Stage 04 ] Hybrid BESS Optimization   ➜   Dynamic Storage & Reactive Support

```

---

### 2. Comparative Methodology Matrix

| Phase | Methodology / Scenario | Primary Objective | Operating Characteristics | Key Grid Metrics Evaluated |
| :--- | :--- | :--- | :--- | :--- |
| **Phase I** | **Base System Profiling** | Establish benchmark power flow & voltage profiles | Nominal loading without DERs | Base $I^2R$ losses, voltage drop ($\Delta V$) |
| **Phase II** | **Load Alteration Analysis** | Evaluate system resilience under load variations | Peak/off-peak loading profiles ($\pm \Delta P, \pm \Delta Q$) | Thermal overload limits, voltage sag |
| **Phase III** | **Optimal PV Placement** | Mitigate active power deficit via solar injection | Decentralized active power injection ($P_{\text{gen}}$) | Reverse power flow, $P \cdot R$ drop reduction |
| **Phase IV** | **Hybrid PV-BESS Integration** | Provide peak-shaving & dynamic voltage control | Coordinated active ($P$) & reactive ($Q$) support | Line loss minimization, ANSI C84.1 compliance |

---

### 3. Mathematical Power Flow Progression

$$\text{Base Load } (P_L + jQ_L) \xrightarrow{\text{Alteration}} (P_L' + jQ_L') \xrightarrow{\text{+ PV}} (P_L' - P_{\text{PV}} + jQ_L') \xrightarrow{\text{+ BESS}} (\underbrace{P_L' - P_{\text{PV}} - P_{\text{BESS}}}_{\text{Net } P \rightarrow 0} + j\underbrace{(Q_L' - Q_{\text{BESS}})}_{\text{Net } Q \rightarrow 0})$$

---

### 4. Methodological Descriptions

#### Option A: Academic Abstract / Technical Report
> *"The investigation is structured across four progressive analytical phases: First, **Base System Profiling** establishes the benchmark steady-state power flow. Second, **Dynamic Load Perturbation** evaluates grid resilience under fluctuating demand. Third, **Optimal Solar PV Integration** mitigates distribution losses through targeted active power injection ($P_{\text{PV}}$). Finally, **Hybrid PV-BESS Optimization** deploys battery energy storage for dynamic peak-shaving and reactive power compensation, restoring terminal node voltages within ANSI C84.1 limits."*

#### Option B: Key Highlights (Slide / Presentation Summary)
* **Phase 1: Baseline Grid Profiling** — Benchmarking $I^2R$ line losses and nodal voltage drops under standard conditions.
* **Phase 2: Stress Testing & Load Perturbation** — Analyzing system vulnerability during extreme demand variations.
* **Phase 3: Targeted PV Generation** — Optimal allocation and sizing of solar units to offset active line power flows ($P \cdot R$).
* **Phase 4: Coordinated PV-BESS Dispatch** — Deploying energy storage for active power balancing and smart-inverter voltage stabilization.

```
