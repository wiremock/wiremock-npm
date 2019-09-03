# Wiremock NPM

[![NPM](https://img.shields.io/npm/v/wiremock.svg?style=flat-square) ](https://www.npmjs.com/package/wiremock)

This is [Wiremock Standalone](http://wiremock.org/docs/running-standalone/) wrapped inside an NPM package.

It only relies on dependencies found in an NPM package repository. It is created with [JDeploy](https://github.com/shannah/jdeploy) and will download and use a JRE, [node-jre](https://www.npmjs.com/package/node-jre), if one is not available.

## Usage

It is used as a command line tool like this:

```bash
npx wiremock
```

See: http://wiremock.org/docs/running-standalone/

## Example - Mock API in frontend app

This example is in the repo in [`example-mock-api-with-express`](/example-mock-api-with-express).

It starts a server with [ExpressJS](https://www.npmjs.com/package/expressjs) and delegates to a frontend and an API. Like this:

When running `npm run serve` it will start this setup:
```
http://localhost:8080/ -------[/api/*]------------> http://localhost:8081/
                        \
                         \
                          \-----[*]---------------> http://localhost:8082/
```

So that:

 * http://localhost:8080/api/example Will serve the API with `npx wiremock`.
 * http://localhost:8080/whatever Will serve the frontend. This can be a Vue app or whatever.