## Overview of the Project

This is a lightweight **Flask-based** web application developed for the **NTI x iVolve DevOps Graduation Project**.

The app renders a single webpage that highlights the collaboration between NTI and iVolve. It uses custom **CSS** for styling and **Flask's Jinja2 templating** for rendering.

---

## Key Technologies

1. **Python 3.12** – Programming language used  
2. **Flask** – Web framework for routing and templating  
3. **HTML + CSS** – Front-end interface and styling  
4. **Jinja2** – Templating engine integrated with Flask  
5. **Docker** – Containerization for consistent deployment  

---

## Benefits of This Structure

- 🔹 **Simplicity** – Minimal codebase (1 page, 1 file)
- 🔹 **Portability** – Works anywhere Docker is supported
- 🔹 **Scalability** – Serves as a clean foundation for CI/CD and cloud integration

---

## Project Structure

```
.
├── app.py                    # Main Flask application
├── requirements.txt          # Python dependencies
├── Dockerfile                # Docker image build instructions
├── templates/
│   └── index.html            # HTML template
└── static/
    ├── style.css             # Custom CSS styling
    └── logos/                # NTI and iVolve logo images
```

---

## How the Application Works

1. The Flask app starts on **port 5000**, listening on **0.0.0.0**.
2. The root route `/` renders the HTML page using `render_template("index.html")`.
3. The HTML page includes:
   - A custom font from **Google Fonts**
   - External **CSS** from `/static/style.css`
   - Logos from the `/static/logos/` directory
4. Page layout:
   - Project title and subtitle
   - NTI & iVolve logos
   - Descriptive paragraph
   - Footer with copyright

---

## Dockerfile Overview

### **Base Image**
- `python:3.12-alpine` — chosen for its lightweight size

### **Build Steps**
- Copy `requirements.txt` first to optimize Docker layer caching  
- Install dependencies via `pip install`  
- Copy remaining app files  
- Expose **port 5000** inside the container  
- App still runs on **port 5000**, so proper mapping is needed

---

## How to Build and Run

### 🛠️ Build the Docker Image
```bash
docker build -t ivolve-app .
```

### 🔧 Docker Build Process
<img width="1533" height="727" alt="Image" src="https://github.com/user-attachments/assets/ecd234a8-d6a9-4774-ae35-e9225c2dfaf6" />

### 📦 Docker Images List
<img width="819" height="75" alt="Image" src="https://github.com/user-attachments/assets/da7a1a35-7ebd-4acf-89b5-16a9cff1011b" />

### 📤 Login & Push to Docker Hub
```bash
docker login -u <username>
docker push <username>/<image_name>
```

### ☁️ Docker Hub Image
<img width="1571" height="835" alt="Image" src="https://github.com/user-attachments/assets/5034bca1-60fc-4895-9b26-a506ad166e51" />

### 🚀 Run the Docker Container
```bash
docker run -p 8080:5000 ivolve-app
```   

### 🚀 Docker Run Command
<img width="1262" height="291" alt="Image" src="https://github.com/user-attachments/assets/adf8c0d7-345e-4fe2-844e-8a9b63cb0952" />

Then access the app at:

- ➡️ http://localhost:8080  
- Or, on EC2:  
  ➡️ http://your-ec2-ip:8080 *(Ensure port 8080 is open in the security group)*

### 🌐 Web Application Page
<img width="1920" height="1029" alt="Image" src="https://github.com/user-attachments/assets/9c274c48-cfe9-4be0-a9d2-80ab59bd92ad" />

---