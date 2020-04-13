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
	@echo "make (run) [signal|proxy]"

run-signal rs:
	centrifugo -c config.centrifugo.test.json &

run-proxy rp:
	./$(PROG) -signal=localhost -secret=secret -as=asid -upstreamAddr=localhost:8000
	./$(PROG) -signal=localhost -secret=secret -to=toid -listen=:4444

kill k:
	@echo "make (kill) [signal|proxy]"

kill-signal ks:
	pkill centrifugo

kill-proxy kp:
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







