{{/*
helm-controller fullname
*/}}
{{- define "helm-controller-stack.helmControllerFullname" -}}
{{ include "helm-controller-stack.fullname" . }}-helm
{{- end }}

{{/*
helm-controller common labels
*/}}
{{- define "helm-controller-stack.helmControllerLabels" -}}
{{ include "helm-controller-stack.labels" . }}
app.kubernetes.io/component: helm-controller
{{- end }}

{{/*
helm-controller selector labels
*/}}
{{- define "helm-controller-stack.helmControllerSelectorLabels" -}}
{{ include "helm-controller-stack.selectorLabels" . }}
app.kubernetes.io/component: helm-controller
{{- end }}
