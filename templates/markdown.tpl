# Trivy Report

## Vulnerability Summary

{{- if . }}
  {{- range . }}
    {{- if eq .Type "cargo" }}
### Rust Dependencies ({{ .Type }})

    {{- else }}
### {{ .Target }} - {{ .Type }} 

      {{- if .Vulnerabilities }}
<details><summary>Click to expand</summary>
| Package | Vulnerability ID | Severity | Title | Fixed Version |
|---------|------------------|----------|-------|--------------|
        {{- range .Vulnerabilities }}
| `{{ .PkgName }}` | [{{ .VulnerabilityID }}]({{ .PrimaryURL }}) | {{ .Severity }} | {{ .Title }} | {{ if .FixedVersion }}`{{ .FixedVersion }}`{{ else }}Not Fixed{{ end }} |
        {{- end }}
</details>

      {{- else }}
No vulnerabilities found.

      {{- end }}
    {{- end }}
    {{- if .Secrets }}
## Secrets Summary

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
