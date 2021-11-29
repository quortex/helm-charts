# node-local-dns

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.21.1](https://img.shields.io/badge/AppVersion-1.21.1-informational?style=flat-square)

NodeLocal DNSCache improves Cluster DNS performance by running a dns caching agent on cluster nodes as a DaemonSet.

Have a look on official documentation [Using NodeLocal DNSCache in Kubernetes clusters](https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/)

## Installation

1. Add github-public helm repository

```sh
helm repo add quortex-public https://quortex.github.io/helm-charts
```

2. Deploy the appropriate release in desired namespace.

```sh
helm install node-local-dns quortex-public/node-local-dns -n kube-system
```

:warning: Take care to pass config.dns server as mentioned in the values documentation.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` | Helm's name computing override. |
| fullnameOverride | string | `""` | Helm's fullname computing override. |
| image.repository | string | `"k8s.gcr.io/dns/k8s-dns-node-cache"` | node-local-dns image repository. |
| image.pullPolicy | string | `"IfNotPresent"` | node-local-dns container image pull policy. |
| image.tag | string | `""` | node-local-dns image tag (default is the chart appVersion). |
| imagePullSecrets | list | `[]` | A list of secrets used to pull containers images. |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| updateStrategy | object | `{"rollingUpdate":{"maxUnavailable":"10%"}}` | An update strategy to replace existing DaemonSet pods with new pods. |
| priorityClassName | string | `"system-node-critical"` | If specified, indicates the pod's priority. |
| securityContext | object | `{"privileged":true}` | node-local-dns container security context. |
| resources | object | `{"requests":{"cpu":"25m","memory":"5Mi"}}` | node-local-dns resources. |
| nodeSelector | object | `{}` | Node labels for pod assignment. |
| tolerations | list | `[{"key":"CriticalAddonsOnly","operator":"Exists"},{"effect":"NoExecute","operator":"Exists"},{"effect":"NoSchedule","operator":"Exists"}]` | Node tolerations for scheduling to nodes with taints. |
| affinity | object | `{}` | Affinity for pod assignment. |
| podAnnotations | object | `{}` | Annotations to be added to pods. |
| podSecurityContext | object | `{}` | Security contexts to set for all containers of the pod. |
| config | object | `{"clusterDomain":"cluster.local","dnsServer":"","localDns":"169.254.20.10"}` | node-local-dns configuration. Get more information on kubernetes documentation https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/. |
| config.localDns | string | `"169.254.20.10"` | localDns is the local listen IP address chosen for NodeLocal DNSCache. |
| config.dnsServer | string | `""` | The dns server address Could be retrieved with `kubectl get svc kube-dns -n kube-system -o jsonpath={.spec.clusterIP}` |
| config.clusterDomain | string | `"cluster.local"` | The cluster domain |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator. https://github.com/coreos/prometheus-operator |
| serviceMonitor.scheme | string | `"http"` | HTTP scheme to use for scraping. |
| serviceMonitor.labels | object | `{}` | Labels to add to ServiceMonitor. |
| serviceMonitor.interval | string | `"15s"` | Interval at which metrics should be scraped. |
| serviceMonitor.scrapeTimeout | string | `"15s"` | Timeout after which the scrape is ended. |
| serviceMonitor.relabelings | list | `[]` | Relabelling configuration (dynamic rewriting of the label set). |

