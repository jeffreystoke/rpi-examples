IMAGE_NAME := jeffctor/rpi-examples-armv7:latest

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME) -f armv7.dockerfile .

.PHONY: run-from-image
run-from-image:
	docker run -it $(IMAGE_NAME)

.PHONY: push-image
push-image:
	docker push $(IMAGE_NAME)
