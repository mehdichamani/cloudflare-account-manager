🌐 **Languages:** **English** | [فارسی](guide.fa.md)

# Cloudflare API Token Permissions Guide

### ⚡ Quick Setup (One-Click Token Creation)

You can instantly create a Cloudflare API Token with all required permissions and token name pre-configured using the link below:

👉 **[Create Pre-Configured Cloudflare API Token](https://dash.cloudflare.com/profile/api-tokens?accountId=%2A&name=cf-usage&permissionGroupKeys=%5B%7B%22key%22%3A%22user_details%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22account_analytics%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22workers_scripts%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22page%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22workers_kv_storage%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22d1%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22zone%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22dns%22%2C%22type%22%3A%22read%22%7D%5D&zoneId=all)**

#### What this pre-configured link does:
- **Token Name:** Automatically set to `cf-usage`.
- **Pre-selected Permissions (All Read-Only):**
  - `User` $\rightarrow$ `User Details` $\rightarrow$ **`Read`** (to fetch account holder email address)
  - `Account` $\rightarrow$ `Account Analytics` $\rightarrow$ **`Read`** (to fetch daily usage analytics and graphs)
  - `Account` $\rightarrow$ `Workers Scripts` $\rightarrow$ **`Read`** (to fetch Workers scripts list and usage)
  - `Account` $\rightarrow$ `Cloudflare Pages` $\rightarrow$ **`Read`** (to list Pages projects and deployments)
  - `Account` $\rightarrow$ `Workers KV Storage` $\rightarrow$ **`Read`** (to list Workers KV namespaces)
  - `Account` $\rightarrow$ `D1` $\rightarrow$ **`Read`** (to list D1 SQL databases)
  - `Zone` $\rightarrow$ `Zone` $\rightarrow$ **`Read`** (to list active domain zones)
  - `Zone` $\rightarrow$ `DNS` $\rightarrow$ **`Read`** (to view subdomains and DNS records)
- **Resource Scope:** Pre-set to **All user resources**, **All accounts**, and **All zones** (`accountId=*` & `zoneId=all`).

**How to use it:**
1. Click the **[Pre-Configured Token Link](https://dash.cloudflare.com/profile/api-tokens?accountId=%2A&name=cf-usage&permissionGroupKeys=%5B%7B%22key%22%3A%22user_details%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22account_analytics%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22workers_scripts%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22page%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22workers_kv_storage%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22d1%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22zone%22%2C%22type%22%3A%22read%22%7D%2C%7B%22key%22%3A%22dns%22%2C%22type%22%3A%22read%22%7D%5D&zoneId=all)** (log in to Cloudflare if needed).
2. Review the pre-selected permissions and click **Continue to summary** at the bottom of the page.
3. Click **Create Token** and copy the generated API Token key.

---

### Manual Setup & Permission Reference

If you prefer to create or verify your **Cloudflare API Token** manually (via **Cloudflare Dashboard** $\rightarrow$ **My Profile** $\rightarrow$ **API Tokens**), configure the following permissions:

**1. User Level Permissions**
* **Category:** `User` $\rightarrow$ **`User Details`** $\rightarrow$ **`Read`**

**2. Account Level Permissions**
* **Category:** `Account` $\rightarrow$ **`Account Analytics`** $\rightarrow$ **`Read`**
* **Category:** `Account` $\rightarrow$ **`Workers Scripts`** $\rightarrow$ **`Read`**
* **Category:** `Account` $\rightarrow$ **`Cloudflare Pages`** $\rightarrow$ **`Read`**
* **Category:** `Account` $\rightarrow$ **`Workers KV Storage`** $\rightarrow$ **`Read`**
* **Category:** `Account` $\rightarrow$ **`D1`** $\rightarrow$ **`Read`**

**3. Zone (Domain & DNS) Permissions**
* **Category:** `Zone` $\rightarrow$ **`Zone`** $\rightarrow$ **`Read`**
* **Category:** `Zone` $\rightarrow$ **`DNS`** $\rightarrow$ **`Read`**

---

### Resource Scope Settings

* **User Resources:** Set to **Include** $\rightarrow$ **All user resources** (or select your specific user account)
* **Account Resources:** Set to **Include** $\rightarrow$ **All accounts** (or select specific accounts)

---

### How to Retrieve User Email via API

Query the `GET /client/v4/user` REST endpoint using the API Token:

```bash
curl -X GET "https://api.cloudflare.com/client/v4/user" \
     -H "Authorization: Bearer YOUR_API_TOKEN" \
     -H "Content-Type: application/json"
```

Response payload:

```json
{
  "result": {
    "id": "1234567890abcdef1234567890abcdef",
    "email": "user@example.com",
    "first_name": "John",
    "last_name": "Doe"
  },
  "success": true
}
```