ARG KATSDPDOCKERBASE_REGISTRY=harbor.sdp.kat.ac.za/dpp/ska-sa

FROM $KATSDPDOCKERBASE_REGISTRY/docker-base-build as build

# Enable Python 3 venv
ENV PATH="$PATH_PYTHON3" VIRTUAL_ENV="$VIRTUAL_ENV_PYTHON3"

# Install dependencies
COPY --chown=kat:kat requirements.txt /tmp/install/
RUN install_pinned.py -r /tmp/install/requirements.txt

# Install the package
COPY --chown=kat:kat . /tmp/install/katsdprfi
WORKDIR /tmp/install/katsdprfi
RUN python ./setup.py clean
RUN pip install --no-deps .
RUN pip check

#######################################################################

FROM $KATSDPDOCKERBASE_REGISTRY/docker-base-runtime
LABEL maintainer="sdpdev+katsdprfi@ska.ac.za"

COPY --from=build --chown=kat:kat /home/kat/ve3 /home/kat/ve3
ENV PATH="$PATH_PYTHON3" VIRTUAL_ENV="$VIRTUAL_ENV_PYTHON3"
