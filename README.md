# Docker-compose setup for Stellar Compliance Server

Get the Stellar Compliance Server up and running in a docker container.

## Docker Tagging Convention

This will follow the version of compliance with the addition of the release number at the end. For example:

- `v0.0.17.0` (first v0.0.17 release)
- `v0.0.17.1` (there's a problem with the image; second release)

## Instructions

Supply an environment variable `CONFIG_FILE_PATH` (defaults to `/config/compliance.cfg`) that points to the location of your `compliance.cfg` file.

You will most likely want to mount a volume with a `compliance.cfg` in it.

### Run Locally

- Build the docker image: `docker-compose build compliance`
- Copy `volumes/config/compliance.cfg.sample` to `volumes/config/compliance.cfg` and fill with your own settings.
- Run the compliance server: `docker-compose up`

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
