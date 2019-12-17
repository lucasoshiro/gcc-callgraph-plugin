FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y gcc python3-yaml graphviz gcc-python3-plugin git make \
	python gcc-5-plugin-dev python-six python-dev python3-dev python3-sphinx

# Remove this package, as it does not work properly. Keep its dependencies for
# the version that will be cloned from GitHub.
RUN apt-get remove -y gcc-python3-plugin

WORKDIR /tmp
RUN git clone https://github.com/davidmalcolm/gcc-python-plugin.git
WORKDIR /tmp/gcc-python-plugin
RUN make install PYTHON=python3 PYTHON_CONFIG=python3-config
RUN rm -rf /tmp/gcc-python-plugin

RUN mkdir /gcc-callgraph-plugin
COPY gcc-callgraph-plugin.py /gcc-callgraph-plugin/

COPY docker/run.sh /

RUN mkdir /src
WORKDIR /src
CMD ["bash", "/run.sh"]
