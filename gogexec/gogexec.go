package gogexec

import (
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
		log.Println("output " + string(out))
		if cmdIn == "java" && cmd.Args[5] == "updateSQL" {
			sqlWriteFile(out, "liquibaseout.sql")
		}

	}
	if err != nil {
		dir, err := os.Getwd()
		log.Println(dir)
		log.Println(cmdIn)
		log.Println(args)
		check(err)
	}

}

func sqlWriteFile(inData []byte, filename string) {

	err := ioutil.WriteFile("tmp.txt", inData, 0644)
	check(err)

	input, err := ioutil.ReadFile("tmp.txt")
	check(err)

	lines := strings.Split(string(input), "\n")

	for i, _ := range lines {
		if i == 0 {
			lines[i] = ""
		}
	}
	output := strings.Join(lines, "\n")
	err = ioutil.WriteFile(filename, []byte(output), 0644)
	check(err)
}

func check(e error) {
	if e != nil {
		log.Println(e)
		panic(e)
	}
}

func CreateDirIfNotExist(dir string) {
	if _, err := os.Stat(dir); os.IsNotExist(err) {
		err = os.MkdirAll(dir, 0777)
		check(err)
	}
}

func SwaggerTemplate(dir string, file string) {
	box := packr.NewBox("../gogfile/template/swagger/dist")

	t := [6]string{"/index.html", "/swagger-ui-bundle.js", "/swagger-ui-standalone-preset.js", "/swagger-ui.css", "/favicon-32x32.png", "/favicon-16x16.png"}
	for _, value := range t {
		swaggerDir, err := box.Find(value)
		copyFile(swaggerDir, dir+value)
		check(err)
	}

	input, err := ioutil.ReadFile(dir + "/" + file)
	check(err)

	log.Println(dir + "/swagger.json")
	copyFile(input, dir+"/swagger.json")
	os.Remove(dir + "/" + file)

}

func LiquibaseTemplate(dir string) {
	box := packr.NewBox("../gogfile/template/liquibaseexec")

	t := [5]string{"/liquibase.jar", "/logback-classic-1.2.3.jar", "/logback-core-1.2.3.jar", "/slf4j-api-1.7.25.jar", "/snakeyaml-1.23.jar"}
	for _, value := range t {
		liquibaseDir, err := box.Find(value)
		copyFile(liquibaseDir, dir+value)
		check(err)
	}

}

func LiquibaseMySQLTemplate(dir string) {
	box := packr.NewBox("../gogfile/template/liquibaseexec/mysql")

	t := [2]string{"/liquibase.properties", "/mysql-connector-java-5.0.5.jar"}
	for _, value := range t {
		liquibaseDir, err := box.Find(value)
		copyFile(liquibaseDir, dir+value)
		check(err)
	}

}

func copyFile(input []byte, destinationFile string) {
	err := ioutil.WriteFile(destinationFile, input, 0644)
	check(err)
}
