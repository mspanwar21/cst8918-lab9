
# CST8918 - Lab A09: Husky and GitHub Actions for Terraform

This project demonstrates the use of **Husky pre-commit hooks** and **GitHub Actions workflows** to enforce Terraform code quality in a CI/CD pipeline.  
It is part of the coursework for **CST8918 - DevOps: Infrastructure as Code**.

## 📁 Project Structure

```
.
├── infrastructure/
│   └── main.tf
├── .husky/
│   └── pre-commit
├── .github/
│   └── workflows/
│       └── action-terraform-verify.yml
├── package.json
├── README.md
```

## ⚙️ Husky Pre-commit Hook

Husky ensures that:
- `terraform fmt -check -recursive` verifies Terraform formatting
- `terraform validate` checks for syntax and configuration validity
- `tflint` lints Terraform code for best practices

### Setup Commands:
```bash
npm init -y
npm install husky --save-dev
npx husky-init
npx husky add .husky/pre-commit "terraform fmt -check -recursive"
echo "terraform validate" >> .husky/pre-commit
echo "tflint" >> .husky/pre-commit
```

## 🚀 GitHub Actions Workflow

The GitHub Actions workflow (`.github/workflows/action-terraform-verify.yml`):
- Runs on pull requests to `main` or `master`
- Checks `terraform fmt` on modified `.tf` files
- Runs `terraform validate` to verify configuration

## 🧪 How to Test

1️⃣ Make a formatting or syntax error in `main.tf`.  
2️⃣ Try to commit — Husky should block the commit.  
3️⃣ Bypass Husky (for testing GitHub Actions):
```bash
git commit -m "Test bad format" --no-verify
git push -u origin your-feature-branch
```
4️⃣ Open a PR → GitHub Actions will fail.  
5️⃣ Fix the error, commit, push → Actions should pass.

## 🌐 Example Terraform Resource

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-hybrid-a09"
  location = "East US"
}
```

## ✅ Notes
- Ensure you have `tflint` installed locally for Husky hooks.
- Terraform version in CI: `1.2.4`
- This is designed for learning purposes as part of CST8918.
