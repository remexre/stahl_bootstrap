all: out/stahl_bootstrap
ci:
	docker build -t remexre/stahl_bootstrap-builder .travis
	docker run -v "$(shell pwd):/code" --rm remexre/stahl_bootstrap-builder make ci-inner
ci-inner: clean all
	chown -R $(shell stat -c "%u:%g" Makefile) .
clean: clean-tmp
	rm -rf out
clean-tmp:
	dune clean
watch:
	watchexec -cre ml $(MAKE)
.PHONY: all ci clean clean-tmp watch

out/stahl_bootstrap:
	@mkdir -p $(dir $@)
	dune build stahl_bootstrap.exe
	@cp _build/default/stahl_bootstrap.exe $@
.PHONY: out/stahl_bootstrap
