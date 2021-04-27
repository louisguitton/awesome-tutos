build:
	cp readme.md docs/index.md
	cp ecole-des-mines-de-paris.jpg docs/ecole-des-mines-de-paris.jpg
	cp CNAME docs/CNAME

serve: build
	mkdocs serve

deploy: build
	mkdocs gh-deploy
