SHELL := /usr/bin/env bash

fmt:
	stylua --config-path .stylua.toml .
