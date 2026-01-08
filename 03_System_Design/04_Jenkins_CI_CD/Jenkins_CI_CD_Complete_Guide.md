# Jenkins CI/CD: Complete Guide

> **Module:** System Design & DevOps
> **Topic:** Continuous Integration, Continuous Deployment, and Automation
> **Duration:** 1 hour

## 📚 Table of Contents

1. [What is CI/CD?](#ci-cd)
2. [Introduction to Jenkins](#jenkins)
3. [Jenkins Pipelines](#pipelines)
4. [Jenkinsfile Example](#example)
5. [Interview Questions](#interview-questions)
6. [Multiple Choice Questions](#mcqs)
7. [Practice Challenges](#challenges)
8. [References](#references)

---

## <a name="ci-cd"></a>1. What is CI/CD?

### CI (Continuous Integration)
The practice of automating the integration of code changes from multiple contributors into a single software project.
-   **Goal:** Find and fix bugs quicker, improve software quality.
-   **Actions:** Build, Test.
-   **Trigger:** Git Commit/Push.

### CD (Continuous Delivery / Deployment)
-   **Continuous Delivery:** Automatically preparing the code for release to production. Requires manual approval to deploy.
-   **Continuous Deployment:** Automatically deploying changes to production without manual intervention.

---

## <a name="jenkins"></a>2. Introduction to Jenkins

Jenkins is an open-source automation server helps to automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery.

### Key Concepts
-   **Job:** A task that Jenkins performs (e.g., build code).
-   **Build:** A single execution of a Job.
-   **Plugin:** Extensions that add functionality (e.g., Git plugin, Docker plugin).
-   **Node:** A machine where Jenkins runs jobs (Master/Agent architecture).

---

## <a name="pipelines"></a>3. Jenkins Pipelines

A pipeline is a suite of plugins which supports implementing and integrating *continuous delivery pipelines* into Jenkins.

### Declarative Pipeline
A structured, easy-to-read syntax for defining pipelines.

**Structure:**
1.  **Pipeline:** Top-level container.
2.  **Agent:** Where to run (e.g., `any` agent, or specific docker container).
3.  **Stages:** Wrapper for all stage definitions.
4.  **Stage:** A specific phase (e.g., "Build", "Test").
5.  **Steps:** Actual commands to run.

---

## <a name="example"></a>4. Jenkinsfile Example

A `Jenkinsfile` is a text file that contains the definition of a Jenkins Pipeline and is checked into source control.

```groovy
pipeline {
    agent any

    environment {
        // Environment variables
        APP_VERSION = "1.0.0"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building application...'
                // sh 'mvn clean install' (for Java)
                // sh 'npm install' (for Node)
                echo "Build Version: ${APP_VERSION}"
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // sh 'npm test'
            }
        }
        
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying to Production...'
                // sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
    
    post {
        always {
            echo 'This runs after pipeline completion.'
        }
        failure {
            echo 'Pipeline failed! Sending notification...'
        }
    }
}
```

---

## <a name="interview-questions"></a>5. Interview Questions

### Q1: What is the difference between Continuous Deployment and Continuous Delivery?
**Answer:**
Both automate the build and test stages.
-   **Continuous Delivery:** Deploys changes to a staging area. Deployment to production is a **manual** step.
-   **Continuous Deployment:** Automatically deploys **every** change that passes tests to production without human intervention.

### Q2: Why use a Pipeline as Code (Jenkinsfile)?
**Answer:**
-   **Version Controlled:** The pipeline logic is stored in Git alongside the code.
-   **Audit Trail:** You can see who changed the pipeline and why.
-   **Review:** Pipeline changes can go through Code Review (PRs).

### Q3: What is a Jenkins Agent?
**Answer:**
An agent (or slave) is a machine/container that connects to the Jenkins master and executes the build instructions. This distributes the load and allows building on different environments (Linux, Windows).

### Q4: How do you handle secrets (passwords/keys) in Jenkins?
**Answer:**
Never hardcode them in `Jenkinsfile`. Use **Jenkins Credentials Plugin**.
1.  Store secret in Jenkins Dashboard -> Manage Credentials.
2.  Access it in pipeline using `credentials('my-secret-id')`.

### Q5: What is "Blue Ocean"?
**Answer:**
Blue Ocean is a modern, visual UI for Jenkins. It makes it easier to visualize pipelines and diagnose failures.

---

## <a name="mcqs"></a>6. Multiple Choice Questions

### MCQ 1
**What file defines a Jenkins Pipeline?**
A) `pipeline.yml`
B) `Jenkinsfile`
C) `build.xml`
D) `.jenkins`

<details>
<summary>Answer</summary>
**B) `Jenkinsfile`**
</details>

### MCQ 2
**Which section defines a specific phase in a pipeline?**
A) `phase`
B) `step`
C) `stage`
D) `part`

<details>
<summary>Answer</summary>
**C) `stage`**
</details>

### MCQ 3
**Which Jenkins feature allows execution on multiple machines?**
A) Master/Agent
B) Peer-to-Peer
C) Server/Client
D) Grid

<details>
<summary>Answer</summary>
**A) Master/Agent**
</details>

### MCQ 4
**In CI/CD, what typically happens *after* a successful Build stage?**
A) Design
B) Test
C) Requirement Gathering
D) Documentation

<details>
<summary>Answer</summary>
**B) Test**
</details>

### MCQ 5
**Which syntax is modern Jenkins Pipeline written in?**
A) XML
B) Groovy (Declarative/Scripted)
C) Python
D) Bash

<details>
<summary>Answer</summary>
**B) Groovy**
</details>

---

## <a name="challenges"></a>7. Practice Challenges

### Challenge 1: Create a Pipeline
**Task:** Create a simple `Jenkinsfile` that:
1.  Prints "Hello World".
2.  Wait 5 seconds.
3.  Prints "Build Complete".

### Challenge 2: Conditional Stage
**Task:** Modify the `Jenkinsfile` to run a "Deploy" stage **only** if the branch is `main`.

### Challenge 3: Post Actions
**Task:** Add a `post` block to print "Success!" if build passes, and "Failure!" if it crashes.

---

## <a name="references"></a>8. References

-   [Jenkins Official Documentation](https://www.jenkins.io/doc/)
-   "Continuous Delivery" by Jez Humble and David Farley

---

## 🎯 Key Takeaways

1.  **Automation:** CI/CD removes manual error-prone tasks.
2.  **Jenkinsfile:** Define your build process as code.
3.  **Fail Fast:** Pipelines help detect bugs immediately after code is committed.
