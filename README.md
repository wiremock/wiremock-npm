# Wiremock NPM

[![NPM](https://img.shields.io/npm/v/wiremock.svg?style=flat-square) ](https://www.npmjs.com/package/wiremock)

This is [Wiremock Standalone](http://wiremock.org/docs/running-standalone/) wrapped inside an NPM package. It relies only on dependencies found in NPM. It is created with [JDeploy](https://github.com/shannah/jdeploy) and will use the existing JRE if found, or download one with [node-jre](https://www.npmjs.com/package/node-jre).

See: http://wiremock.org/docs/running-standalone/

## Example - Command line

It can be used as a command line tool like this:

```bash
npx wiremock
```

## Example - Mock API in frontend app

This example is in the repo in [`example-mock-api-with-express`](/example-mock-api-with-express).

It starts a server with [ExpressJS](https://www.npmjs.com/package/expressjs) and delegates to a frontend and an API. Like this:

When running `npm run serve` it will start this setup:
```
http://localhost:8080/
  |
  |
  |---[/api/*]-> http://localhost:8081/
  |
   \
    \-[*]-------> http://localhost:8082/
```

So that:

 * `http://localhost:8080/api/example` Will serve the API with `wiremock`.
 * `http://localhost:8080/whatever` Will serve the frontend. This can be a Vue app or whatever.
