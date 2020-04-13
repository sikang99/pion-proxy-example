#
# Makefile for webrtc-socket-proxy
#
VERSION=0.0.1
PROG=wrtc-proxy
usage:
	@echo "usage: make [build|run]"

build b:
	go build -o $(PROG)

run r:
	@echo "make (run) [signal|prog]"

run-signal rs:
	centrifugo -c config.centrifugo.test.json &

run-prog rp:
	./$(PROG) -signal=localhost -secret=secret -as=<PEER_ID> -upstreamAddr=localhost:8000
	./$(PROG) -signal=localhost -secret=secret -to=<PEER_ID> -listen=:4444

kill k:
	@echo "make (kill) [signal|prog]"

kill-signal ks:
	pkill centrifugo

kill-prog kp:
	pkill $(PROG) 

#----------------------------------------------------------------------------------
git g:
	@echo "> make (git:g) [update|store]"
git-update gu:
	git add .
	git commit -a -m "$(VERSION)"
	git push
git-store gs:
	git config credential.helper store
#----------------------------------------------------------------------------------







