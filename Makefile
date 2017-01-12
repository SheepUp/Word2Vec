.PHONY: clean start

all:
	virtualenv env -p python3.5 --no-site-packages
	env/bin/pip install --upgrade pip
	env/bin/pip install wheel
	env/bin/pip install -r requirements.txt
	env/bin/jupyter serverextension enable --py ipyparallel --user
	env/bin/jupyter nbextension install --py ipyparallel --user 
	env/bin/jupyter nbextension enable --py ipyparallel --user
	env/bin/python -m spacy.en.download all
	env/bin/python -m spacy.de.download all

clean:
	rm -rfv bin develop-eggs dist downloads eggs env parts
	rm -fv .DS_Store .coverage .installed.cfg bootstrap.py
	rm -fv logs/*.txt
	find . -name '*.pyc' -exec rm -fv {} \;
	find . -name '*.pyo' -exec rm -fv {} \;
	find . -depth -name '*.egg-info' -exec rm -rfv {} \;
	find . -depth -name '__pycache__' -exec rm -rfv {} \;

