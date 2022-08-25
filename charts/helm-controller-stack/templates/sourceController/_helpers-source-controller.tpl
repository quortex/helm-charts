{{/*
source-controller fullname
*/}}
{{- define "helm-controller-stack.sourceControllerFullname" -}}
{{ include "helm-controller-stack.fullname" . }}-source
{{- end }}

{{/*
source-controller common labels
*/}}
{{- define "helm-controller-stack.sourceControllerLabels" -}}
{{ include "helm-controller-stack.labels" . }}
app.kubernetes.io/component: source-controller
{{- end }}

{{/*
source-controller selector labels
*/}}
{{- define "helm-controller-stack.sourceControllerSelectorLabels" -}}
{{ include "helm-controller-stack.selectorLabels" . }}
app.kubernetes.io/component: source-controller
{{- end }}
