.PHONY: build
build:
	python3 setup.py sdist bdist_wheel

release:
	twine upload dist/*

clean:
	rm -rf build/ dist/ aws_ossm.egg-info/
