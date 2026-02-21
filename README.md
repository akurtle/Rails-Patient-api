# Rails Health Records API

A Rails 7 **API-only** backend built to demonstrate **PostgreSQL relational modeling**, **JWT authentication**, **RBAC authorization**, **Docker containerization**, and **REST API design**.

## Tech Stack
- **Ruby**: 3.4.x (Docker image)
- **Rails**: 7.1.6 (API-only)
- **Database**: PostgreSQL
- **Auth**: Devise + Devise-JWT
- **Authorization (RBAC)**: Pundit
- **Containerization**: Docker + docker compose

---

## Features
- JWT-based authentication (no server sessions)
- Role-based access control (RBAC) using Pundit policies
- REST endpoints for patient records
- Dockerized local development with PostgreSQL

### Roles
- `patient`
- `clinician`
- `admin`

---

## API Endpoints

### Health Check
- `GET /health` → `{ "status": "ok" }`

### Auth
- `POST /auth/signup`
- `POST /auth/login`
- `DELETE /auth/logout`

### Users (protected)
- `GET /api/v1/users` *(admin only)*
- `GET /api/v1/users/:id` *(admin or self)*

### Patient Records (protected)
- `GET /api/v1/patient_records` *(patient: own only, clinician/admin: all)*
- `GET /api/v1/patient_records/:id` *(patient: own only, clinician/admin: allowed)*
- `POST /api/v1/patient_records` *(clinician/admin only)*
- `PATCH /api/v1/patient_records/:id` *(clinician/admin only)*
- `DELETE /api/v1/patient_records/:id` *(admin only)*

---

## Run Locally (Docker - Recommended)

### 1) Create `.env`
Copy example env:
```bash
cp .env.example .env
``` 

Make sure it includes
DATABASE_URL=postgres://postgres:postgres@db:5432/rails_health_api_development
DATABASE_URL_TEST=postgres://postgres:postgres@db:5432/rails_health_api_test
DEVISE_JWT_SECRET_KEY=replace_me_with_a_long_random_string


Build and start containers

docker compose up -d --build