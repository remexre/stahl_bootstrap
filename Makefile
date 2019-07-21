all: out/stahl_bootstrap
clean:
	dune clean
watch:
	watchexec -cre ml $(MAKE)
.PHONY: all clean watch

out/stahl_bootstrap:
	@mkdir $(dir $@)
	dune build
	@cp _build/default/stahl_bootstrap.exe $@
.PHONY: out/stahl_bootstrap
