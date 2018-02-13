# Heroku Buildpack for webpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for web applications that use webpack.

## Usage

The `bin/compile` script expects `webpack.config.js` in the project root. 

To use the buildpack, create a special pipeline of buildpacks for the Pocket Lobby constituents app:

1. Clear buildpacks

`heroku buildpacks:clear`

1. Specify buildpacks _in the specific order_:

```bash
heroku buildpacks:add heroku/nodejs
heroku buildpacks:add https://github.com/PocketLobby/heroku-buildpack-webpack
heroku buildpacks:add heroku/ruby
```

2. Confirm correct ordering:

```bash
=== pocket-lobby Buildpack URLs
1. heroku/nodejs
2. https://github.com/PocketLobby/heroku-buildpack-webpack
3. heroku/ruby
```

3. Deploy a new version of Constituents to Heroku.
