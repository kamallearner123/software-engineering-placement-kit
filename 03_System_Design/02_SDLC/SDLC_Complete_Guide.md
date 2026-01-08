# SDLC: Complete Guide

> **Module:** System Design & DevOps
> **Topic:** Software Development Life Cycle (Waterfall, Agile, DevOps)
> **Duration:** 30 mins

## 📚 Table of Contents

1. [What is SDLC?](#what-is-sdlc)
2. [Phases of SDLC](#phases)
3. [SDLC Models](#models)
    - [Waterfall](#waterfall)
    - [Agile](#agile)
    - [DevOps](#devops)
4. [Comparison: Waterfall vs Agile](#comparison)
5. [Interview Questions](#interview-questions)
6. [Multiple Choice Questions](#mcqs)
7. [Practice Challenges](#challenges)
8. [References](#references)

---

## <a name="what-is-sdlc"></a>1. What is SDLC?

**SDLC (Software Development Life Cycle)** is a process used by the software industry to design, develop, and test high-quality software. It aims to produce high-quality software that meets or exceeds customer expectations, reaches completion within times and cost estimates.

---

## <a name="phases"></a>2. Phases of SDLC

1.  **Requirement Gathering & Analysis:**
    -   Defining *what* to build.
    -   Input: Customer feedback, sales input, industry experts.
    -   Output: SRS (Software Requirement Specification).

2.  **Design:**
    -   Defining *how* to build.
    -   HLD (High-Level Design): Architecture, DB design.
    -   LLD (Low-Level Design): Class diagrams, logic.

3.  **Implementation (Coding):**
    -   Writing the actual code.
    -   Output: Source code.

4.  **Testing:**
    -   Verifying the software works as expected.
    -   Unit testing, Integration testing, System testing, UAT (User Acceptance Testing).

5.  **Deployment:**
    -   Releasing the software to production (or staging).

6.  **Maintenance:**
    -   Bug fixes, upgrades, and enhancements after release.

---

## <a name="models"></a>3. SDLC Models

### <a name="waterfall"></a>3.1 Waterfall Model (Traditional)

Linear sequential flow. Phase N must complete before Phase N+1 begins.

-   **Pros:** Simple, easy to manage, clear milestones.
-   **Cons:** Inflexible, high risk (testing happens at the end), late feedback.
-   **Use Case:** Small projects with fixed requirements (e.g., Construction, Embedded systems).

### <a name="agile"></a>3.2 Agile Methodology (Modern)

Iterative and incremental approach. Breaks product into small "Sprints" (usually 2 weeks).

-   **Manifesto focus:**
    -   Individuals and interactions > Processes and tools
    -   Working software > Comprehensive documentation
    -   Customer collaboration > Contract negotiation
    -   Responding to change > Following a plan

-   **Pros:** Fast feedback, flexible, customer satisfaction.
-   **Cons:** documentation can be neglected, scope creep.
-   **Scrum:** A popular framework for Agile.
    -   Roles: Scrum Master, Product Owner, Dev Team.
    -   Rituals: Daily Standup, Sprint Planning, Review, Retrospective.

### <a name="devops"></a>3.3 DevOps (Culture)

DevOps is a set of practices that combines **Software Development (Dev)** and **IT Operations (Ops)**.
It aims to shorten the systems development life cycle and provide continuous delivery with high software quality.

-   **CI/CD:** Continuous Integration / Continuous Deployment.
-   **Infrastructure as Code (IaC):** Managing infrastructure through code (Terraform, Ansible).
-   **Monitoring:** Grafana, Prometheus.

---

## <a name="comparison"></a>4. Comparison: Waterfall vs Agile

| Feature | Waterfall | Agile |
| :--- | :--- | :--- |
| **Process** | Sequential | Iterative |
| **Flexibility** | Rigid | Flexible |
| **Requirements** | Fixed upfront | Can change anytime |
| **Testing** | After coding phase | Continuous (every sprint) |
| **Delivery** | Single release at end | Frequent increments |
| **Customer** | Involved at start/end | Continuously involved |

---

## <a name="interview-questions"></a>5. Interview Questions

### Q1: What are the phases of SDLC?
**Answer:**
1.  Requirement Analysis
2.  Design
3.  Implementation (Coding)
4.  Testing
5.  Deployment
6.  Maintenance

### Q2: Why is Agile preferred over Waterfall?
**Answer:**
Agile allows for earlier delivery of working software (MVP), faster feedback loops, and the flexibility to adapt to changing requirements. Waterfall carries higher risk because testing and feedback happen only at the very end.

### Q3: What is "Scrum"?
**Answer:**
Scrum is an Agile framework for managing complex knowledge work. It uses short cycles called Sprints to deliver increments of software. It involves roles like Scrum Master and Product Owner, and ceremonies like Daily Standups.

### Q4: What is the V-Model?
**Answer:**
The V-Model (Verification and Validation) is an extension of the Waterfall model. For every development phase, there is a corresponding testing phase. (e.g., Requirements -> Acceptance Testing, Code -> Unit Testing).

### Q5: Define "MVP".
**Answer:**
MVP (Minimum Viable Product is a version of a product with just enough features to be usable by early customers who can then provide feedback for future product development.

---

## <a name="mcqs"></a>6. Multiple Choice Questions

### MCQ 1
**Which model is linear and sequential?**
A) Agile
B) Spiral
C) Waterfall
D) DevOps

<details>
<summary>Answer</summary>
**C) Waterfall**
</details>

### MCQ 2
**What does SRS stand for?**
A) System Requirement Syntax
B) Software Requirement Specification
C) Synchronous Retrieval System
D) Software Regression Standard

<details>
<summary>Answer</summary>
**B) Software Requirement Specification**
</details>

### MCQ 3
**In Agile, what is a "Sprint"?**
A) A fast coding session.
B) A fixed time period (e.g., 2 weeks) to deliver a working increment.
C) Running away from bugs.
D) The final deployment phase.

<details>
<summary>Answer</summary>
**B) A fixed time period to deliver a working increment.**
</details>

### MCQ 4
**Who prioritizes the backlog in Scrum?**
A) Scrum Master
B) Developer
C) Product Owner
D) Tester

<details>
<summary>Answer</summary>
**C) Product Owner**
</details>

### MCQ 5
**Which is NOT a Scrum ceremony?**
A) Daily Standup
B) Sprint Review
C) Requirement Freeze
D) Sprint Retrospective

<details>
<summary>Answer</summary>
**C) Requirement Freeze** (Agile welcomes changing requirements).
</details>

---

## <a name="challenges"></a>7. Practice Challenges

### Challenge 1: Choose the Model
**Scenario:** You are building a software to control a nuclear reactor. The requirements are strictly fixed by government capability, safety is paramount, and updates are rare.
**Question:** Which SDLC model would you choose?

<details>
<summary>Solution</summary>
**Waterfall or V-Model.**
Since requirements are fixed and safety is critical, a highly structured, document-heavy approach with rigorous testing phases (like V-model) is safer than Agile.
</details>

### Challenge 2: Choose the Model
**Scenario:** You are building a new social media app for a startup. You have a vague idea, but expect features to change based on user feedback every week.
**Question:** Which SDLC model would you choose?

<details>
<summary>Solution</summary>
**Agile (Scrum or Kanban).**
You need flexibility to pivot based on user feedback and deliver features incrementally in a competitive market.
</details>

---

## <a name="references"></a>8. References

-   **"The Scrum Guide"** by Ken Schwaber and Jeff Sutherland.
-   **"The Phoenix Project"** (Book on DevOps).
-   Atlassian Agile Guide.

---

## 🎯 Key Takeaways

1.  **Understand the Problem:** Don't start coding until you know *what* to build (Requirements).
2.  **Iterate:** Agile wins in most modern web/app development scenarios.
3.  **Process Matters:** Good process (DevOps/CI/CD) reduces bugs and improves deployment speed.
