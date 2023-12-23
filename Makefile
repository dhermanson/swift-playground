.PHONY: release
release:
	swift build -c release

.PHONY: benchmark
benchmark:
	time -v ./.build/release/MyCLI


.PHONY: image
image:
	docker build -t my-swift-app .

.PHONY: run-bash
run-bash:
	docker run --rm -it --entrypoint sh my-swift-app

.PHONY: run-docker
run-docker:
	docker run --rm -it my-swift-app
