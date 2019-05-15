package natscon

import (
	"log"
	"time"

	"github.com/nats-io/go-nats"
)

func ConnectNATSSub(urls string, userCreds string) (nc *nats.Conn, err1 error) {

	opts := setupConnOptions([]nats.Option{nats.Name("NATS Sample Subscriber")})

	// Use UserCredentials
	if userCreds != "" {
		opts = append(opts, nats.UserCredentials(userCreds))
	}

	// Connect to NATS
	nc, err := nats.Connect(urls, opts...)
	if err != nil {
		log.Fatal(err)
	}

	return nc, err

}

func ConnectNATSPub(urls string, userCreds string) (nc *nats.Conn, err1 error) {

	nc, err := nats.Connect(urls)
	
	if err != nil {
		log.Fatal(err)
	}

	return nc, err

}

func setupConnOptions(opts []nats.Option) []nats.Option {
	totalWait := 10 * time.Minute
	reconnectDelay := time.Second

	opts = append(opts, nats.ReconnectWait(reconnectDelay))
	opts = append(opts, nats.MaxReconnects(int(totalWait/reconnectDelay)))
	opts = append(opts, nats.DisconnectHandler(func(nc *nats.Conn) {
		log.Printf("Disconnected: will attempt reconnects for %.0fm", totalWait.Minutes())
	}))
	opts = append(opts, nats.ReconnectHandler(func(nc *nats.Conn) {
		log.Printf("Reconnected [%s]", nc.ConnectedUrl())
	}))
	opts = append(opts, nats.ClosedHandler(func(nc *nats.Conn) {
		log.Fatal("Exiting, no servers available")
	}))
	return opts
}

func PrintMsg(m *nats.Msg, i int) {
	log.Printf("[#%d] Received on [%s]: '%s'", i, m.Subject, string(m.Data))
}
