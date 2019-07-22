all: build test
build: out/stahl-bootstrap
ci:
	docker build -t remexre/stahl-bootstrap-builder .travis
	docker run -v "$(shell pwd):/code" --rm remexre/stahl-bootstrap-builder make ci-inner
ci-inner:
	sh -c "trap 'chown -R $(shell stat -c "%u:%g" Makefile) .' EXIT; $(MAKE) clean all"
clean:
	cabal v2-clean
	rm -rf out
test:
	cabal v2-test --enable-tests 
watch:
	watchexec -cre cabal,hs -i 'dist-newstyle/**' $(MAKE)
.PHONY: all build ci ci-inner clean test watch

out/stahl-bootstrap:
	@mkdir -p $(dir $@)
	cabal v2-build
	@cp `cabal v2-exec -- which stahl-bootstrap` $@
.PHONY: out/stahl-bootstrap
