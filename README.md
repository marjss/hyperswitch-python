# Hyperswitch Python – Custom Routing Assignment

![Python](https://img.shields.io/badge/Python-3.13-blue)
![Rust](https://img.shields.io/badge/Rust-Stable-orange)
![Docker](https://img.shields.io/badge/Docker-Compose-blue)
![License](https://img.shields.io/badge/Assignment-Techdome-success)

A fork of **Juspay Hyperswitch** implementing a **custom payment routing strategy** as part of the Techdome Venture Studio Senior/Staff Engineer take-home assignment.

## Assignment Overview

This project extends Hyperswitch with a custom routing strategy that demonstrates how routing decisions can be customized while keeping the implementation modular, testable, and production-friendly.

### Objective

Implement one non-trivial routing rule with:

- deterministic routing decisions
- extensible architecture
- automated tests
- observable routing decisions
- Docker-based setup

---

# Tech Stack

- Python 3.13
- Rust (PyO3 + Maturin)
- Docker & Docker Compose
- Pytest
- Hyperswitch

---

# Project Structure

```
.
├── src/
│   ├── routing/
│   ├── models/
│   ├── services/
│   └── ...
├── tests/
├── Dockerfile
├── docker-compose.yml
├── pyproject.toml
├── Cargo.toml
├── DECISIONS.md
└── README.md
```

---

# Features

- ✅ Custom payment routing
- ✅ Modular routing engine
- ✅ Dockerized development environment
- ✅ Unit tests
- ✅ Decision logging
- ✅ Extensible architecture

---

# Prerequisites

- Docker Desktop
- Docker Compose
- Git
- Python 3.13 (optional for local development)

---

# Getting Started

Clone the repository

```bash
git clone https://github.com/marjss/hyperswitch-python.git
cd hyperswitch-python
```

Build Docker image

```bash
docker compose build
```

Start development container

```bash
docker compose run --rm app sh
```

or

```bash
docker compose up
```

---

# Running Tests

```bash
pytest
```

or

```bash
docker compose run --rm app pytest
```

---

# Custom Routing Logic

## Strategy

**(Replace this section with your chosen implementation.)**

Example:

### BIN Based Routing

Rules:

- RuPay BINs → Domestic Connector
- Visa / Mastercard → Global Connector
- Unknown BIN → Default connector

Decision example

```
Input

BIN: 607442
Currency: INR
Amount: 500

↓

Domestic Connector
```

Routing decisions are logged for observability.

---

# Example Request

```bash
curl ...
```

Example response

```json
{
    "connector":"stripe",
    "routing_reason":"BIN matched domestic routing policy"
}
```

---

# Running Inside Docker

Open shell

```bash
docker compose run --rm app sh
```

Run tests

```bash
pytest
```

Install package

```bash
pip install -e .
```

---

# Development

Useful commands

```bash
docker compose build

docker compose run --rm app sh

pytest

pip install -e .

cargo fmt

cargo test
```

---

# Design Principles

The routing implementation focuses on

- Single Responsibility Principle
- Extensibility
- Testability
- Deterministic decisions
- Production readability

---

# Testing

Current test coverage includes

- Happy path
- Edge case
- Failure path

Tests can be executed using

```bash
pytest
```

---

# Future Improvements

Given additional time I would add

- Metrics (Prometheus)
- Routing trace endpoint
- Configurable routing rules
- Connector health scoring
- Dynamic routing configuration
- OpenTelemetry instrumentation

---

# Decisions

See

```
DECISIONS.md
```

for architecture decisions, trade-offs, limitations, and future work.

---

# Demo

A short walkthrough is available in the submitted Loom video demonstrating

- setup
- routing flow
- custom routing
- tests
- project structure

---

# Author

Sudhanshu

GitHub

https://github.com/marjss

---