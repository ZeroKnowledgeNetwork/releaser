.PHONY: goreleaser-dry-run
goreleaser-dry-run:
	docker run \
		--rm \
		-e CGO_ENABLED=1 \
		-v $(CURDIR):/src \
		-w /src \
    ghcr.io/goreleaser/goreleaser-cross:v1.22.2 \
			--clean \
			--skip=validate \
			--skip=publish
