{{- define "golden-web.name" -}}
{{- default .Chart.Name .Values.app.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "golden-web.labels" -}}
app.kubernetes.io/name: {{ include "golden-web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: {{ .Values.app.component | quote }}
app.kubernetes.io/part-of: {{ .Values.app.name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}

{{- define "golden-web.image" -}}
{{- $repo := (.Values.image.repository | default "" | lower) -}}
{{- if .Values.image.digest -}}
{{- printf "%s@%s" $repo .Values.image.digest -}}
{{- else -}}
{{- printf "%s:%s" $repo (default "latest" .Values.image.tag) -}}
{{- end -}}
{{- end -}}