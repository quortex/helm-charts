# helm-controller-stack

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm controller chart for Kubernetes allowing one to declaratively manage Helm chart releases

Have a look on official documentation [Using Helm Operator in Kubernetes clusters](https://github.com/fluxcd/helm-controller)

## Installation

1. Add github-public helm repository

```sh
helm repo add quortex-public https://quortex.github.io/helm-charts
```

2. Deploy the appropriate release in desired namespace.

```sh
helm install helm-controller-stack quortex-public/helm-controller-stack -n helm-system
```

:warning: Take care to pass config.dns server as mentioned in the values documentation.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| helmController.manager.replicaCount | int | `1` | Number of desired pods. |
| helmController.manager.podAnnotations | object | `{}` | Pods annotation. |
| helmController.manager.extraArgs | object | `{}` |  |
| helmController.manager.image.repository | string | `"ghcr.io/fluxcd/helm-controller"` | helm-controller image repository. |
| helmController.manager.image.pullPolicy | string | `"IfNotPresent"` | helm-controller container image pull policy. |
| helmController.manager.image.tag | string | `"v0.23.0"` | helm-controller image tag (default is the chart appVersion). |
| helmController.manager.livenessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/healthz","port":"healthz","scheme":"HTTP"},"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | helm-controller livenessProbe. |
| helmController.manager.livenessProbe.failureThreshold | int | `3` | Number of failure threshold liveness probe. |
| helmController.manager.livenessProbe.periodSeconds | int | `10` | helm-controller time interval liveness probe |
| helmController.manager.livenessProbe.successThreshold | int | `1` | helm-controller success threshold liveness probe |
| helmController.manager.livenessProbe.timeoutSeconds | int | `1` | helm-controller timeout seconds liveness probe |
| helmController.manager.livenessProbe.httpGet | object | `{"path":"/healthz","port":"healthz","scheme":"HTTP"}` | helm-controller HTTP request. |
| helmController.manager.readinessProbe.failureThreshold | int | `3` | Number of failure threshold readiness probe. |
| helmController.manager.readinessProbe.periodSeconds | int | `10` | helm-controller time interval liveness probe |
| helmController.manager.readinessProbe.successThreshold | int | `1` | helm-controller success threshold liveness probe |
| helmController.manager.readinessProbe.timeoutSeconds | int | `1` | helm-controller timeout seconds liveness probe |
| helmController.manager.readinessProbe.httpGet | object | `{"path":"/readyz","port":"healthz","scheme":"HTTP"}` | helm-controller HTTP request. |
| helmController.manager.ressources | object | `{}` | Container ressources. |
| helmController.manager.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security contexts to set for all containers of the pod. |
| helmController.manager.podSecurityContext | object | `{"fsGroup":1337}` | Security contexts to set for all pod of the nodes. |
| helmController.manager.nodeSelector | object | `{}` | Node Selectors |
| helmController.manager.tolerations | list | `[]` | Pod Tolerations |
| helmController.manager.affinity | object | `{}` | Affinity |
| sourceController.manager.replicaCount | int | `1` | Number of desired pods. |
| sourceController.manager.podAnnotations | object | `{}` | Pods annotation. |
| sourceController.manager.extraArgs | string | `nil` |  |
| sourceController.manager.image.repository | string | `"ghcr.io/fluxcd/source-controller"` | source-controller image repository. |
| sourceController.manager.image.pullPolicy | string | `"IfNotPresent"` | source-controller container image pull policy. |
| sourceController.manager.image.tag | string | `"v0.27.0"` | source-controller image tag (default is the chart appVersion). |
| sourceController.manager.livenessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/healthz","port":"healthz","scheme":"HTTP"},"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | source-controller liveness probe. |
| sourceController.manager.livenessProbe.failureThreshold | int | `3` | Number of failure threshold. |
| sourceController.manager.livenessProbe.httpGet | object | `{"path":"/healthz","port":"healthz","scheme":"HTTP"}` | source-controller liveness probe HTTP request. |
| sourceController.manager.livenessProbe.periodSeconds | int | `10` | source-controller time interval liveness probe |
| sourceController.manager.livenessProbe.successThreshold | int | `1` | source-controller success threshold liveness probe |
| sourceController.manager.livenessProbe.timeoutSeconds | int | `1` | source-controller timeout seconds liveness probe |
| sourceController.manager.readinessProbe | object | `{"failureThreshold":3,"httpGet":{"path":"/","port":"http","scheme":"HTTP"},"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | source-controller readiness probe. |
| sourceController.manager.readinessProbe.failureThreshold | int | `3` | Number of failure threshold. |
| sourceController.manager.readinessProbe.httpGet | object | `{"path":"/","port":"http","scheme":"HTTP"}` | source-controller readiness probe HTTP request. |
| sourceController.manager.readinessProbe.periodSeconds | int | `10` | source-controller time interval readiness probe |
| sourceController.manager.readinessProbe.successThreshold | int | `1` | source-controller success threshold readiness probe |
| sourceController.manager.readinessProbe.timeoutSeconds | int | `1` | source-controller timeout seconds readiness probe |
| sourceController.manager.resources | object | `{}` | Container ressources. |
| sourceController.manager.strategy.type | string | `"Recreate"` |  |
| sourceController.manager.containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security contexts to set for all containers of the pod. |
| sourceController.manager.podSecurityContext | object | `{"fsGroup":1337}` | Security contexts to set for all pod of the nodes. |
| sourceController.manager.nameOverride | string | `""` | Helm's name computing override. |
| sourceController.manager.fullnameOverride | string | `""` | Helm's fullname computing override. |
| sourceController.manager.nodeSelector | object | `{}` | Node Selectors |
| sourceController.manager.tolerations | list | `[]` | Pod Tolerations |
| sourceController.manager.affinity | object | `{}` | Affinity |
| kubeRBACProxy.enabled | bool | `true` | Enable kube-rbac-proxy. |
| kubeRBACProxy.image.repository | string | `"gcr.io/kubebuilder/kube-rbac-proxy"` | kube-rbac-proxy image repository. |
| kubeRBACProxy.image.tag | string | `"v0.8.0"` | kube-rbac-proxy image tag. |
| kubeRBACProxy.image.pullPolicy | string | `"IfNotPresent"` | kube-rbac-proxy image pull policy. |
| kubeRBACProxy.resources | object | `{}` | kube-rbac-proxy container required resources. |
| serviceMonitor.enabled | bool | `false` | Create a rtmp operator ServiceMonitor. |
| serviceMonitor.additionalLabels | object | `{}` | Labels added to the ServiceMonitor. |
| serviceMonitor.annotations | object | `{}` | Annotations added to the ServiceMonitor. |
| serviceMonitor.interval | string | `""` | Override prometheus operator scrapping interval. |
| serviceMonitor.scrapeTimeout | string | `""` | Override prometheus operator scrapping timeout. |
| serviceMonitor.relabelings | list | `[]` | Relabellings to apply to samples before scraping. |
| serviceAccount.create | bool | `true` | Create a rtmp operator ServiceAccount. |
| serviceAccount.name | string | `""` | Override rtmp operator ServiceAccount name. |
| serviceAccount.annotations | object | `{}` | Annotations added to the ServiceMonitor. |

