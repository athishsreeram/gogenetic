package domain

import (
	"log"

	cfg "{{.API.Name}}-{{.Architechture.Name}}-cud-output/config"
	"github.com/Jeffail/gabs"
	_ "github.com/go-sql-driver/mysql"
	"github.com/go-xorm/xorm"
)
type EventStores struct {
	Uuid        string    
	Data string
	Event string
	Command string
}
func CreateEvent(data string) {

	jsonObj, _ := gabs.ParseJSON([]byte(data))
	var command string
	var event string
	if jsonObj.ExistsP("command") == true {
		command = jsonObj.Search("command").Data().(string)
	}

	if jsonObj.ExistsP("event") == true {
		event = jsonObj.Search("event").Data().(string)
	}

	es := &EventStores{
		Uuid:    jsonObj.Search("uuid").Data().(string),
		Data:    data,
		Event:   event,
		Command: command,
	}

	var err error
	engineEvent, err := xorm.NewEngine("mysql", cfg.Conf.DBCon)
	engineEvent.Insert(es)

	if err != nil {
		log.Println(err)
	} else {
		log.Println("Successfully Created {}", es)
	}

}
