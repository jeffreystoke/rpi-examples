# TARGET for python is only used to triger `pipenv install` (non-empty)
ARG TARGET="app"

FROM arhatdev/builder-python3.7-alpine-arm64:onbuild as builder
FROM arhatdev/python3.7-alpine-arm64:onbuild