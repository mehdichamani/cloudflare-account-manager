🌐 **Languages:** **English** | [فارسی](README.fa.md)

# Cloudflare Account Manager

A clean, modern, and light/dark theme switchable dashboard & CLI to monitor daily usage, deployed Workers, Pages projects, connected domains, and deployment history across multiple Cloudflare accounts. Built entirely as a Cloudflare Worker using Cloudflare KV.

<p align="center">
  <img src="screenshot-pc.png" alt="Desktop Preview" width="68%" />
  <img src="screenshot-mob.png" alt="Mobile Preview" width="28%" />
</p>

---

## ✨ Features

- 📊 **Unified Quota & Invocation Tracker:** Real-time tracking of daily worker requests with UTC reset progress.
- ⚡ **Workers & Pages Directory:** Lists all deployed Workers and Pages projects per account.
- 🕒 **Deployment Timestamps & Domains:** Displays last deployment / modification dates and connected custom domains.
- 🔗 **Worker GitHub & Notes Metadata:** Attach GitHub repository links and custom notes to each Worker directly from the dashboard or API.
- 💻 **CLI & Automation API:** Query cached accounts, workers, or reverse lookup which worker/account runs a specific GitHub project using `cf-cli.sh` or `curl`.

---

## 💻 CLI & API Usage

A lightweight CLI helper script (`cf-cli.sh`) is included to query cached data from your terminal:

```bash
# Set your deployment URL (or uses localhost:8787 by default)
export CF_MANAGER_URL="https://your-manager.workers.dev"

# List all accounts and quota
./cf-cli.sh accounts

# List workers & pages for all accounts or a specific account
./cf-cli.sh resources [account_id]

# Search which worker/account has a specific project or GitHub repo deployed
./cf-cli.sh find anti-filter
```

### Direct JSON Endpoints:
- `GET /api/v1/accounts`: Get all monitored accounts and usage summary.
- `GET /api/v1/resources?account_id=...`: Get detailed workers and pages with metadata.
- `GET /api/v1/lookup?project=...`: Reverse search workers and pages matching a project name or GitHub URL.
- `POST /api/worker-meta`: Update worker repository link and notes (Bearer token protected).
- `POST /api/pages-meta`: Update Pages project repository link and notes (Bearer token protected).

---

## 📚 Documentation & Quick Links

- 📋 [TODO & Roadmap](docs/TODO.md) - View task list, completed features, and future plans.
- 🚀 [Deployment Guide](docs/DEPLOYMENT.md) - Step-by-step instructions for local development and Cloudflare Workers deployment.
- 🔑 [API Token Permissions Guide](docs/guide.md) - One-click pre-configured token creation link & required permissions guide.

---

## ⚡ Censorship Bypass & Panel Monitoring

You can use this dashboard with custom links to monitor and manage your panels. To bypass internet censorship and track active panels/configurations, check out these community projects:
- **Bia Pain Bache:** [https://github.com/bia-pain-bache](https://github.com/bia-pain-bache)
- **Nahan:** [https://github.com/itsyebekhe/nahan](https://github.com/itsyebekhe/nahan)
- **Nova Proxy:** [https://github.com/IRNova/Nova-Proxy](https://github.com/IRNova/Nova-Proxy)

These repositories provide up-to-date tools, configurations, and panels to facilitate free internet access.
