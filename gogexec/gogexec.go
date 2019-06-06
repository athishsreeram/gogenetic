package gogexec

import (
	"log"
	"os"
	"os/exec"
)

func MoveTo(dir string) {
	os.Chdir(dir)
}

func ExecuteCmd(cmd string) {
	dir, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}
	log.Println(dir)
	c := exec.Command(cmd)
	c.Dir = dir
	out, err := c.Output()

	log.Println(out)
	log.Println(err)

}
