{{- if . }}
{{- range . }}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trivy Scan Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1, h2, h3 {
            color: #333;
        }
        .section {
            margin-bottom: 40px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        table th {
            background-color: #f2f2f2;
        }
        .critical {
            background-color: #f8d7da;
            color: #721c24;
        }
        .high {
            background-color: #fff3cd;
            color: #856404;
        }
        .medium {
            background-color: #d1ecf1;
            color: #0c5460;
        }
        .low {
            background-color: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>
    <h1>Trivy Scan Report</h1>

    {{ if .Vulnerabilities }}
    <div class="section">
        <h2>Vulnerabilities</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Package</th>
                    <th>Severity</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                {{ range .Vulnerabilities }}
                <tr class="{{ .Severity | lower }}">
                    <td>{{ .VulnerabilityID }}</td>
                    <td>{{ .PkgName }}</td>
                    <td>{{ .Severity }}</td>
                    <td><details><summary>Click to expand</summary>{{ .Description }}</details></td>
                </tr>
                {{ end }}
            </tbody>
        </table>
    </div>
    {{ end }}

    {{ if .Misconfigurations }}
    <div class="section">
        <h2>Misconfigurations</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Severity</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                {{ range .Misconfigurations }}
                <tr class="{{ .Severity | lower }}">
                    <td>{{ .ID }}</td>
                    <td>{{ .Title }}</td>
                    <td>{{ .Severity }}</td>
                    <td>{{ .Message }}</td>
                </tr>
                {{ end }}
            </tbody>
        </table>
    </div>
    {{ end }}

    {{ if .Secrets }}
    <div class="section">
        <h2>Secrets</h2>
        <table>
            <thead>
                <tr>
                    <th>File</th>
                    <th>Line</th>
                    <th>Secret Type</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                {{ range .Secrets }}
                <tr>
                    <td>{{ .File }}</td>
                    <td>{{ .Line }}</td>
                    <td>{{ .Category }}</td>
                    <td>{{ .Description }}</td>
                </tr>
                {{ end }}
            </tbody>
        </table>
    </div>
    {{ end }}

    {{ if .Licenses }}
    <div class="section">
        <h2>Licenses</h2>
        <table>
            <thead>
                <tr>
                    <th>Package</th>
                    <th>License</th>
                </tr>
            </thead>
            <tbody>
                {{ range .Licenses }}
                <tr>
                    <td>{{ .PkgName }}</td>
                    <td>{{ .License }}</td>
                </tr>
                {{ end }}
            </tbody>
        </table>
    </div>
    {{ end }}
</body>
</html>
{{- end }}
{{- end }}
