# Run Trivy Scan - Linux - With Summary

A GitHub Composite Action to run a Trivy scan for vulnerabilities and generate a consolidated summary report.  

## Features

- Installs and configures Trivy for scanning.
- Scans the specified directory for vulnerabilities.
- Supports various scanners (vulnerabilities, misconfigurations, secrets, licenses).
- Consolidates results into a Markdown report and adds a summary to the GitHub Action workflow.

## Inputs

| Name         | Description                                | Required | Default                      |
|--------------|--------------------------------------------|----------|------------------------------|
| `working_dir`| Working directory for the scan             | No       | `.`                          |
| `severity`   | Severity levels to flag on                | No       | `LOW,MEDIUM,HIGH,CRITICAL`   |
| `type`       | Type of scan to run (e.g., `fs`)          | No       | `fs`                         |

## Outputs

- Generates a Markdown report summarizing detected vulnerabilities.
- Adds the summary report to the GitHub Actions workflow log via `$GITHUB_STEP_SUMMARY`.

## Example Usage

```yaml
name: Trivy Scan Workflow
on:
  push:
    branches:
      - main

jobs:
  trivy-scan:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Run Trivy Scan
        uses: Xander-Rudolph/trivy-scan@main
        with:
          working_dir: "./path/to/scan"
          severity: "HIGH,CRITICAL"
          type: "fs"
```

## Installation & Setup

1. Add this composite action to your repository.
2. Include it in your GitHub Actions workflow file.

## How It Works

1. **Trivy Installation**: Downloads and installs Trivy using the official repository.
2. **Scan Execution**: Runs a Trivy scan based on specified inputs (`working_dir`, `severity`, `type`) and outputs results in JSON format.
3. **Report Generation**:
   - Converts the Trivy JSON results into a Markdown summary.
   - Appends the Markdown summary to `reportssummary.md`.
   - Logs the summary in `$GITHUB_STEP_SUMMARY` for easy viewing in the GitHub Actions interface.

## Outputs Example

### Vulnerabilities Detected

| Package   | Vulnerability ID       | Severity  | Description         |
|-----------|-------------------------|-----------|---------------------|
| example-pkg | CVE-2023-12345         | HIGH      | Example vulnerability description. |

## Additional Notes

- This action uses the Trivy CLI. Refer to the [Trivy documentation](https://trivy.dev) for more details.
- Ensure your runner has sufficient permissions to install dependencies and execute commands.
