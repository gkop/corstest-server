# Corstest.com server

This is the server behind [Corstest.com](https://www.corstest.com)

### Requirements for the main development server

- Elixir v1.0.0+

## Run the main development server

```bash
mix do deps.get, compile
mix phoenix.start
```

More info on the Phoenix web framework at https://github.com/phoenixframework/phoenix

### Requirements for the node spdy server

- npm

## Run the node js spdy server

```bash
npm install
nodejs node_spdy_server.js
```

TODO: merge the SPDY server into the Phoenix server and get rid of node
