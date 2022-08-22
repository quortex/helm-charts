{{/*
sourceController fullname
*/}}
{{- define "helm-controller-operator.sourceControllerFullname" -}}
{{ include "helm-controller-operator.fullname" . }}-source
{{- end }}

{{/*
querier common labels
*/}}
{{- define "helm-controller-operator.sourceControllerLabels" -}}
{{ include "helm-controller-operator.labels" . }}
app.kubernetes.io/component: sourceController
{{- end }}

{{/*
querier selector labels
*/}}
{{- define "helm-controller-operator.sourceControllerSelectorLabels" -}}
{{ include "helm-controller-operator.selectorLabels" . }}
app.kubernetes.io/component: sourceController
{{- end }}
