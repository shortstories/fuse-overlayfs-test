package main

import (
	"io"
	"os"
)

func main() {
	execPath, err := os.Executable()
	if err != nil {
		panic(err)
	}

	swapPath := execPath + ".swap"

	if err := os.Rename(execPath, swapPath); err != nil {
		panic(err)
	}

	execFile, err := os.Create(execPath)
	if err != nil {
		panic(err)
	}
	defer execFile.Close()

	swapFile, err := os.Open(swapPath)
	if err != nil {
		panic(err)
	}
	defer swapFile.Close()

	if _, err := io.Copy(execFile, swapFile); err != nil {
		panic(err)
	}
}