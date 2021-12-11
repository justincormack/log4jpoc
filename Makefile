build:
	docker build -t log4jcve .
run: build
	docker run -ti log4jcve