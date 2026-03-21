# 🎮 Mr. Unemployed

## 🏢 Company Name
**UnfortunatelyEmail Studios**

## 👥 Team Name
**Team-Pla Kape**

---

## 👨‍💻 Team Members & Roles

- **Klyde Perante** – Lead Programmer / Godot Specialist  
- **Kurt Russel Carrillo** – Artist & Animator  
- **Kurt Russel Carrillo** – Game Designer / Level Designer  
- **Klyde Perante** – Audio & UI / Tester  

---

## 🚀 Elevator Pitch / Hook

A desperate job applicant enters a chaotic trial where he must survive absurd workplace-themed obstacle courses because only one person can get hired!!!

---

## 🎮 Game Overview & Concept

**Genre:**  
2D Platformer  

**Target Audience:**  
Students and casual gamers who enjoy fun but slightly challenging platformers, especially those who can relate to job hunting struggles  

**Unique Selling Point (USP):**  
A humorous and satirical take on job competition where players navigate corporate-themed obstacle courses instead of traditional combat, turning real-life stress into engaging gameplay  

**Core Theme / Mood / Art Style:**  
Lighthearted, comedic, slightly chaotic atmosphere with colorful pixel art inspired by supermarkets and workplaces  

**High-level Story / Setting:**  
A supermarket called **Atam Technologies** announces a job opening, attracting many applicants. However, upon arrival, they are told that only one position is available. To decide who gets hired, the applicants must compete in a series of absurd “trials” inside the supermarket. The player takes on the role of one applicant trying to survive these challenges and secure the job.

---

## ⚙️ Core Gameplay & Mechanics

### 🔁 Core Loop
The player navigates through a level by running and jumping across platforms → avoids hazards like falling boxes and slippery floors → reaches the exit → progresses to the next, more difficult trial.

---

### 🧩 Key Mechanics

- **Basic Movement:** Run and jump across platforms  
- **Dash Ability:** Short burst of speed to avoid hazards or reach distant platforms  
- **Environmental Hazards:** Falling items, moving shelves, slippery floors, other job applicants  
- **Stamina System:** Excessive dashing reduces stamina, forcing strategic movement  

---

### 🎮 Controls

- Move: **A/D** or **Left/Right Arrow**  
- Jump: **Space**  
- Dash: **Shift**  

---

### 🏁 Win/Lose Conditions

- **Win:** Reach the end of the level  
- **Lose:** Fall off platforms or get hit by hazards  

---

## 📊 Scope & Feasibility

### ✅ Core Features

- Player controller with:
  - Movement, jump, and dash  
- Hazard system (moving objects, traps)  
- 3–5 hand-crafted levels with progression  
- Basic enemies/AI behaviors  
- UI/HUD (score, health, pause menu)  
- Sound effects & background music  
- Particle effects & animations  
- Export to PC + Web  

---

### ⚠️ Risks & Mitigation

- **Complex mechanics may take too long**  
  → Focus on core movement and hazards first (MVP)  

- **Level design may become too time-consuming**  
  → Limit to 3–4 levels and reuse assets  

- **Bugs in physics or collisions**  
  → Use Godot’s built-in collision systems and test early  

---

### 🗓️ Phased Timeline

- **Weeks 1–2:** Player movement + basic prototype  
- **Weeks 3–5:** Level design + hazard implementation  
- **Weeks 6–8:** Art, audio, UI integration  
- **Weeks 9–10:** Playtesting, bug fixing, polishing  
- **Final Week:** Build export, documentation, presentation  

---

## 🛠️ Technical & Godot Plan

### 🔧 Key Godot Features

**Nodes/Scenes:**
- CharacterBody2D (player)  
- TileMap (levels)  
- Area2D (hazards)  

**Signals & Scripts:**
- Collision detection signals  
- GDScript for player movement and game logic  

**Other:**
- Particle2D for effects  
- Audio buses for sound management  

---

### 📌 Current Progress
Basic project setup in Godot with initial scene structure planned. Player movement prototype will be implemented in early development.

---

### 🧱 Object-Oriented Approach
The player will be structured as a reusable scene with its own script, while hazards and level elements will use modular scenes for easy reuse across levels.

---
