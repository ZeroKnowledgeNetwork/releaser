# tmp-goreleaser

temporary project to explore automated cross-platform go builds + release

Local testing:

```sh
go install github.com/goreleaser/goreleaser@latest
goreleaser --clean --snapshot --skip=publish
```
