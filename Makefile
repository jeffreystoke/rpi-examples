IMAGE_NAME_ARMV7 := jeffctor/rpi-examples-armv7:latest

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME_ARMV7) -f armv7.dockerfile .
	docker build -t $(IMAGE_NAME_ARM64) -f arm64.dockerfile .

.PHONY: run-from-image
run-from-image:
	docker run -it $(IMAGE_NAME_ARMV7)

.PHONY: push-image
push-image:
	docker push $(IMAGE_NAME_ARMV7)
	docker push $(IMAGE_NAME_ARM64)
