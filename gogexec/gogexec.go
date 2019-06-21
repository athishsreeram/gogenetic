package gogexec

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"strings"

	"github.com/gobuffalo/packr"
)

func MoveTo(dir string) {
	os.Chdir(dir)
}

func RemoveFile(dir string) {
	dir1, _ := os.Getwd()
	err := os.Remove(dir1 + "/" + dir)
	if err != nil {
		log.Println(err)
	}
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

func CreateDirIfNotExist(dir string) {
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		err = os.MkdirAll(dir, 0777)
		if err != nil {
			panic(err)
		}
	}
}

func SwaggerTemplate(dir string, file string) {
	box := packr.NewBox("../gogfile/template/swagger/dist")

	t := [6]string{"/index.html", "/swagger-ui-bundle.js", "/swagger-ui-standalone-preset.js", "/swagger-ui.css", "/favicon-32x32.png", "/favicon-16x16.png"}
	for _, value := range t {
		swaggerDir, err := box.Find(value)
		copyFile(swaggerDir, dir+value)
		if err != nil {
			log.Fatal(err)
		}
	}

	input, err := ioutil.ReadFile(dir + "/" + file)
	if err != nil {
		log.Fatal(err)
		return
	}

	log.Println(dir + "/swagger.json")
	copyFile(input, dir+"/swagger.json")
	os.Remove(dir + "/" + file)

}

func copyFile(input []byte, destinationFile string) {

	err := ioutil.WriteFile(destinationFile, input, 0644)
	if err != nil {
		fmt.Println("Error creating", destinationFile)
		fmt.Println(err)
		return
	}

}
