ifdef SYSTEMROOT
  ifdef MSYSTEM
    RM = rm -rf
  else
	RM = DEL /Q
  endif
  BINARY_NAME_EXTENSION = .exe
else
  RM = rm -rf
endif

GOCMD=go
SRC_FOLDER=./src
BUILD_FOLDER=./build
MAIN_PACKAGE=main

BINARY_NAME=Endraft
BINARY_PATH=$(BUILD_FOLDER)/$(BINARY_NAME)$(BINARY_NAME_EXTENSION)

all: deps build test

build: 
	$(GOCMD) build -o $(BINARY_PATH) -v $(SRC_FOLDER)/$(MAIN_PACKAGE)

run: build
	./$(BINARY_PATH)

test: build
	$(GOCMD) test -v ./...

deps:
	$(GOCMD) get -u -v github.com/therecipe/qt/cmd/...

clean:
	$(GOCMD) clean
	$(RM) $(BUILD_FOLDER)