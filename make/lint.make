ESLINT = ./node_modules/.bin/eslint

lint:
	@$m "Linting..."
	@eslint -c shared/eslintrc.yml src

lint.install:
	yarn add --dev eslint eslint-plugin-babel eslint-plugin-flowtype eslint-plugin-react eslint-plugin-react-hooks babel-eslint
