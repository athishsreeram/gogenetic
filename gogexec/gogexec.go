package gogexec

import (
	"log"
	"os"
	"os/exec"
	"strings"
)

func MoveTo(dir string) {
	os.Chdir(dir)
}

func ExecuteProtoCmd(args []string) {

	cmd := exec.Command("protoc")
	cmd.Args = append(cmd.Args, args...)
	// We set the RUN_AS_PROTOC_GEN_GO environment variable to indicate that
	// the subprocess should act as a proto compiler rather than a test.
	cmd.Env = append(os.Environ(), "RUN_AS_PROTOC_GEN_GO=1")
	out, err := cmd.CombinedOutput()
	if len(out) > 0 || err != nil {
		cmd := exec.Command("protoc")
		log.Println("RUNNING: ", strings.Join(cmd.Args, " "))
	}
	if len(out) > 0 {
		log.Println(string(out))
	}
	if err != nil {
		log.Println("protoc: %v", err)
	}

}

func ExecuteCmd(cmdIn string, args []string) {

	cmd := exec.Command(cmdIn)
	cmd.Args = append(cmd.Args, args...)
	// We set the RUN_AS_PROTOC_GEN_GO environment variable to indicate that
	// the subprocess should act as a proto compiler rather than a test.
	out, err := cmd.CombinedOutput()
	if len(out) > 0 || err != nil {
		cmd := exec.Command(cmdIn)
		log.Println("RUNNING: ", strings.Join(cmd.Args, " "))
	}
	if len(out) > 0 {
		log.Println(string(out))
	}
	if err != nil {

		dir, err := os.Getwd()

		log.Println(dir)
		log.Println(cmdIn)
		log.Println(args)

		log.Println("protoc: %v", err)
	}

}
