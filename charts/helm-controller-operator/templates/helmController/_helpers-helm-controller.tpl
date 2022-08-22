{{/*
helmController fullname
*/}}
{{- define "helm-controller-operator.helmControllerFullname" -}}
{{ include "helm-controller-operator.fullname" . }}-helm
{{- end }}

{{/*
querier common labels
*/}}
{{- define "helm-controller-operator.helmControllerLabels" -}}
{{ include "helm-controller-operator.labels" . }}
app.kubernetes.io/component: helmController
{{- end }}

{{/*
querier selector labels
*/}}
{{- define "helm-controller-operator.helmControllerSelectorLabels" -}}
{{ include "helm-controller-operator.selectorLabels" . }}
app.kubernetes.io/component: helmController
{{- end }}
