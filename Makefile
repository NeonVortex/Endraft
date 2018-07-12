GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BUILD_FOLDER=build
BINARY_WIN=Endraft.exe
BINARY_NIX=Endraft

all: deps build test

build:
	$(GOBUILD) -o $(BINARY_NAME) -v

test:
	$(GOTEST) -v ./..

deps:
	$(GOGET) -u -v github.com/therecipe/qt/cmd/...

clean:
	$(GOCLEAN)
	rm -r $(BUILD_FOLDER)