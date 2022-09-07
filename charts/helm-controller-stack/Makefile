##@ General

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk commands is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

HELM_CONTROLLER_VERSION = v0.23.0
SOURCE_CONTROLLER_VERSION = v0.28.0

.PHONY: all
all: generate doc

.PHONY: generate-helm-controller
generate-helm-controller: yq kustomize
	@TMPDIR=$$(mktemp -d) && git clone --branch ${HELM_CONTROLLER_VERSION} --single-branch --depth 1 git@github.com:fluxcd/helm-controller.git $${TMPDIR}/repo && \
	${YQ} -y '.metadata.name = ("PREFIX-" + .metadata.name)' $${TMPDIR}/repo/config/rbac/role.yaml | \
		sed "s/PREFIX/{{ include \"helm-controller-stack.helmControllerFullname\" . }}/" > ./templates/helmController/manager_role.yaml && \
	${KUSTOMIZE} build $${TMPDIR}/repo/config/default/ > $${TMPDIR}/result_helm_contoller.yaml && \
	${YQ} -y 'select(.kind=="CustomResourceDefinition")' $${TMPDIR}/result_helm_contoller.yaml > ./crds/crds_helm_contoller.yaml && \
	${YQ} -y 'select(.kind=="ValidatingWebhookConfiguration" or .kind=="MutatingWebhookConfiguration")' $${TMPDIR}/result_helm_contoller.yaml | \
		sed -e 's|name: helm-controller-stack|name: {{ include \"helm-controller-stackca-from: {{ .Release.Namespace }}/{{ include \"helm-controller-stack.fullname\" . }}-serving-cert|'
	rm -rf $${TMPDIR}

.PHONY: generate-source-controller
generate-source-controller: yq kustomize
	@TMPDIR=$$(mktemp -d) && git clone --branch ${SOURCE_CONTROLLER_VERSION} --single-branch --depth 1 git@github.com:fluxcd/source-controller.git $${TMPDIR}/repo && \
	${YQ} -y '.metadata.name = ("PREFIX-" + .metadata.name)' $${TMPDIR}/repo/config/rbac/role.yaml | \
		sed "s/PREFIX/{{ include \"helm-controller-stack.sourceControllerFullname\" . }}/" > ./templates/sourceController/manager_role.yaml && \
	${KUSTOMIZE} build $${TMPDIR}/repo/config/default/ > $${TMPDIR}/result_source_contoller.yaml && \
	${YQ} -y 'select(.kind=="CustomResourceDefinition")' $${TMPDIR}/result_source_contoller.yaml > ./crds/crds_source_contoller.yaml && \
	${YQ} -y 'select(.kind=="ValidatingWebhookConfiguration" or .kind=="MutatingWebhookConfiguration")' $${TMPDIR}/result_source_contoller.yaml | \
		sed -e 's|name: helm-controller-stack|name: {{ include \"helm-controller-stackca-from: {{ .Release.Namespace }}/{{ include \"helm-controller-stack.fullname\" . }}-serving-cert|'
	rm -rf $${TMPDIR}

.PHONY: generate
generate: generate-source-controller generate-helm-controller ## Generate some manifests from source repositories.

doc: ## Generate documentation.
	@docker run --rm --volume "$$(pwd):/helm-docs" jnorwood/helm-docs:latest -s file

# find or download yq
# download yq if necessary
yq:
ifeq (, $(shell which yq))
	@pip3 install yq
endif
YQ=$(shell which yq)

# find or download kustomize
# download kustomize if necessary
VERSION="4.4.1"
kustomize:
ifeq (, $(shell which kustomize))
	@curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash -s -- "${VERSION}" "$$(go env GOPATH)/bin"
endif
KUSTOMIZE=$(shell which kustomize)
