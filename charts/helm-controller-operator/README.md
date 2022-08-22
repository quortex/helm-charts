# helm-controller-operator

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

Have a look on official documentation [Using Helm Operator in Kubernetes clusters](https://github.com/fluxcd/helm-controller)

## Installation

1. Add github-public helm repository

```sh
helm repo add quortex-public https://quortex.github.io/helm-charts
```

2. Deploy the appropriate release in desired namespace.

```sh
helm install helm-controller-operator quortex-public/helm-controller-operator -n helm-system
```

:warning: Take care to pass config.dns server as mentioned in the values documentation.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| progressDeadlineSeconds | int | `600` |  |
| revisionHistoryLimit | int | `10` |  |
| podAnnotations | object | `{}` |  |
| manager.nameClusterRoleReconciler | string | `"helm-reconciler-role"` |  |
| manager.nameClusterRoleReconciler | string | `"helm-manager-role"` |  |
| manager.nameClusterRoleBindingReconciler | string | `"helm-reconciler-rolebinding"` |  |
| manager.nameClusterRoleBindingManager | string | `"helm-manager-rolebinding"` |  |
| manager.imageHelmController.image.repository | string | `"fluxcd/helm-controller"` |  |
| manager.imageHelmController.image.tag | string | `"v0.23.0"` |  |
| manager.imageHelmController.image.pullPolicy | string | `"IfNotPresent"` |  |
| manager.imageSourceController.image.repository | string | `"fluxcd/source-controller"` |  |
| manager.imageSourceController.image.tag | string | `"v0.27.0"` |  |
| manager.imageSourceController.image.pullPolicy | string | `"IfNotPresent"` |  |
| manager.helmControllerlivenessProbe.failureThreshold | int | `3` |  |
| manager.helmControllerlivenessProbe.periodSeconds | int | `10` |  |
| manager.helmControllerlivenessProbe.successThreshold | int | `1` |  |
| manager.helmControllerlivenessProbe.timeoutSeconds | int | `1` |  |
| manager.helmControllerlivenessProbe.httpGet.path | string | `"/healthz"` |  |
| manager.helmControllerlivenessProbe.httpGet.port | string | `"healthz"` |  |
| manager.helmControllerlivenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| manager.helmControllerreadinessProbe.failureThreshold | int | `3` |  |
| manager.helmControllerreadinessProbe.periodSeconds | int | `10` |  |
| manager.helmControllerreadinessProbe.successThreshold | int | `1` |  |
| manager.helmControllerreadinessProbe.timeoutSeconds | int | `1` |  |
| manager.helmControllerreadinessProbe.httpGet.path | string | `"/readyz"` |  |
| manager.helmControllerreadinessProbe.httpGet.port | string | `"healthz"` |  |
| manager.helmControllerreadinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| manager.helmControllerressources.limits.cpu | string | `"1"` |  |
| manager.helmControllerressources.limits.memory | string | `"1Gi"` |  |
| manager.helmControllerressources.requests.cpu | string | `"100m"` |  |
| manager.helmControllerressources.requests.memory | string | `"64Mi"` |  |
| manager.sourceControllerlivenessProbe.failureThreshold | int | `3` |  |
| manager.sourceControllerlivenessProbe.httpGet.path | string | `"/healthz"` |  |
| manager.sourceControllerlivenessProbe.httpGet.port | string | `"healthz"` |  |
| manager.sourceControllerlivenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| manager.sourceControllerlivenessProbe.periodSeconds | int | `10` |  |
| manager.sourceControllerlivenessProbe.successThreshold | int | `1` |  |
| manager.sourceControllerlivenessProbe.timeoutSeconds | int | `1` |  |
| manager.sourceControllerreadinessProbe.failureThreshold | int | `3` |  |
| manager.sourceControllerreadinessProbe.httpGet.path | string | `"/"` |  |
| manager.sourceControllerreadinessProbe.httpGet.port | string | `"http"` |  |
| manager.sourceControllerreadinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| manager.sourceControllerreadinessProbe.periodSeconds | int | `10` |  |
| manager.sourceControllerreadinessProbe.successThreshold | int | `1` |  |
| manager.sourceControllerreadinessProbe.timeoutSeconds | int | `1` |  |
| manager.sourceControllerresources.limits.cpu | string | `"1"` |  |
| manager.sourceControllerresources.limits.memory | string | `"1Gi"` |  |
| manager.sourceControllerresources.requests.cpu | string | `"50m"` |  |
| manager.sourceControllerresources.requests.memory | string | `"64Mi"` |  |
| manager.helmControllerStrategy.rollingUpdate.maxSurge | string | `"25%"` |  |
| manager.helmControllerStrategy.rollingUpdate.maxUnavailable | string | `"25%"` |  |
| manager.helmControllerStrategy.type | string | `"RollingUpdate"` |  |
| manager.sourceControllerStrategy.type | string | `"Recreate"` |  |
| serviceAccount.create | bool | `true` | Create a rtmp operator ServiceAccount. |
| serviceAccount.name | string | `""` | Override rtmp operator ServiceAccount name. |
| serviceAccount.annotations | object | `{}` | Annotations added to the ServiceMonitor. |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| service.clusterIps[0] | string | `"10.96.163.142"` |  |

