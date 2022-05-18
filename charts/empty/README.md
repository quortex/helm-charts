# empty

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

An empty chart to deploy arbitrary manifests.

## Installation

1. Add github-public helm repository

```sh
helm repo add quortex-public https://quortex.github.io/helm-charts
```

2. Deploy the appropriate release in desired namespace.

```sh
helm install my-release quortex-public/empty -n kube-system
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| manifests | string | `""` | A string to evaluate as a template for rendering kubernetes manifests. |

