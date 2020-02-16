all: generate build push

generate:
	./generate.sh $(TARGET_VERSION)

build:
	docker build -f $(TARGET_VERSION)/rails/Dockerfile -t sharshenov/ruby-for-rails:$(TARGET_VERSION) .

push:
	docker push sharshenov/ruby-for-rails:$(TARGET_VERSION)