# Trivy Report

## Summary
{{- if . }}
  {{- range . }}
    {{- if (eq .Type "cargo") }}
## Rust Dependencies ({{.Type}})
    {{- else }}
## {{.Type}} 
      {{- if has . "Vulnerabilities" }}
<details><summary>Click to expand</summary>
| Package | Vulnerability ID | Severity | Title | Fixed Version |
|---------|-----------------|-----------|-------|---------------|
        {{- range .Vulnerabilities }}
| `{{ .PkgName }}` | [{{ .VulnerabilityID }}]({{ .PrimaryURL }}) | {{ .Severity }} | {{ .Title }} | {{ if .FixedVersion}}`{{ .FixedVersion }}`{{ else }}Not Fixed{{ end }} |
</details>
        {{- end }}
      {{- end }}
No vulnerabilities found.
    {{- end }}

    {{- if .Secrets }}
### Secrets
| Rule ID | Category | Severity | Title |
|---------|----------|----------|-------|
      {{- range .Secrets }}
| {{ .RuleID }} | {{ .Category }} | {{ .Severity }} | {{ .Title }} |
      {{- end }}
    {{- end }}
  {{- end }}
{{- else }}
No issues detected!
{{- end }}
