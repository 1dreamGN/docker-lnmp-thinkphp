# Makefile for Docker Nginx PHP Composer MySQL

# include .env



help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  dc             docker-compose up( docker-compose无后台)"
	@echo "  dc-d          docker-compose up -d( docker-compose后台运行) "
	@echo "  dc-s          docker-compose down -v( docker-compose 停止) "
	@echo "  ds            停止所有进程 "
	@echo "  backup         备份docker目录 "

	

init:
	echo '123'



clean:
	docker rmi  $(docker images -qa)
	

dc:
	docker-compose up

dc-d: 
	docker-compose up -d

dc-s:
	docker-compose down 
	
ds:
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)

backup:
	bash bakup.sh