.PHONY: image
image:
	docker build -t my-swift-app .

.PHONY: run-bash
run-bash:
	docker run --rm -it --entrypoint sh my-swift-app

.PHONY: run
run:
	docker run --rm -it my-swift-app
