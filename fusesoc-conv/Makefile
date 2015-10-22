JSON_SRC=cores_t.mli cores_t.ml cores_j.mli cores_j.ml

all: main.byte

$(JSON_SRC): cores.atd
	atdgen -t cores.atd
	atdgen -j -j-strict-fields cores.atd

main.byte: main.ml $(JSON_SRC)
	ocamlfind c -o $@ -package yojson,atdgen -linkpkg $(JSON_SRC) main.ml

cores.json: ini2json.py
	find ../../orpsoc-cores/cores/ -name "*.core" -print0 | xargs -0 -L 1 ./ini2json.py > cores.json

run: cores.json main.byte
	./main.byte < cores.json

clean:
	rm -f main.byte $(JSON_SRC)

