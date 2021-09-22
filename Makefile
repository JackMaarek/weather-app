setup:
	cp .github/hooks/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit
	pod install

lint:
	swiftlint lint

lint-fix:
	swiftlint --fix

format:
	swiftformat ./
