GORELEASER_IMAGE := ghcr.io/goreleaser/goreleaser-cross:v1.22.2

IDS := \
	linux-amd64 \
	linux-arm64 \
	linux-armhf \
	darwin-amd64 \
	darwin-arm64 \
	windows-amd64 \
	windows-arm64 \
	windows-386

.PHONY: goreleaser-dry-run
goreleaser-dry-run:
	docker run \
		--rm \
		-e CGO_ENABLED=1 \
		-v $(CURDIR):/src \
		-w /src \
		$(GORELEASER_IMAGE) \
			--clean \
			--skip=validate \
			--skip=publish

.PHONY: $(IDS)
$(IDS):
	docker run \
		--rm \
		-e CGO_ENABLED=1 \
		-v $(CURDIR):/src \
		-w /src \
		$(GORELEASER_IMAGE) \
			build \
			--clean \
			--skip=validate \
			--verbose \
			--id="$@"
