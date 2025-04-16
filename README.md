# 🧬 Infectious Disease Simulation using SIR Model Variants

This repository contains MATLAB implementations of various compartmental models used to simulate the spread of four major infectious diseases—**Measles**, **Influenza**, **Ebola**, and **COVID-19**—using the SIR model and its variants (SIR, SEIR, SIRD, SEIRD).

🧪 Research Project Title:  
**Modeling the Spread of Infectious Diseases Using SIR Model Variants: A Comparative Simulation Study of Measles, Influenza, Ebola, and COVID-19.**

---

## 📁 Folder Structure

sir-model-simulations/ │ ├── Figures/ # All MATLAB figure outputs (.fig) │ ├── SIR Model.fig │ ├── SEIR Model.fig │ ├── SIRD Model.fig │ ├── SEIRD Model.fig │ ├── Normalized_Comparative_Graph.fig │ ├── main/ # Disease-specific simulation entry points │ ├── main_seir_influenza.m │ ├── main_seird_covid.m │ ├── main_sir_measles.m │ ├── main_sird_ebola.m │ ├── models/ # ODE model definitions for each variant │ ├── sir_model.m │ ├── seir_model.m │ ├── sird_model.m │ ├── seird_model.m │ ├── other/ # Analysis & visualization scripts │ ├── analyze_model_results.m │ ├── Normalized_Comparative_Graph.png │ ├── README.md # This file


---

## 🚀 Getting Started

### 📦 Requirements
- **MATLAB R2021b** or newer
- No toolboxes required beyond MATLAB’s built-in `ode45`

### ▶️ To Run a Simulation
1. **Clone the repository**
   ```bash
   git clone https://github.com/Mutshidzi02/sir-model-simulations.git
   cd sir-model-simulations


