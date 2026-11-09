CXX := clang++
CXXFLAGS := -std=c++17 -O2 -Wall -Wextra
OPENCV_CFLAGS := $(shell pkg-config --cflags opencv5)
OPENCV_LIBS := $(shell pkg-config --libs opencv5)

TARGET := build/reid
SOURCE := src/main.cpp

$(TARGET): $(SOURCE)
	mkdir -p build
	$(CXX) $(CXXFLAGS) $(OPENCV_CFLAGS) $(SOURCE) -o $(TARGET) $(OPENCV_LIBS)


run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf build

# Declare run and clean as commands
.PHONY: run clean
