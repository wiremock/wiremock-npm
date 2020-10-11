# Wiremock NPM

[![NPM](https://img.shields.io/npm/v/wiremock.svg?style=flat-square) ](https://www.npmjs.com/package/wiremock)
[![Build Status](https://travis-ci.org/tomasbjerre/wiremock-npm.svg?branch=master)](https://travis-ci.org/tomasbjerre/wiremock-npm)

This is [Wiremock Standalone](http://wiremock.org/docs/running-standalone/) wrapped inside an NPM package. It relies only on dependencies found in NPM. It is created with [JDeploy](https://github.com/shannah/jdeploy) and will use the existing JRE if found, or download one with [node-jre](https://www.npmjs.com/package/node-jre).

See: http://wiremock.org/docs/running-standalone/

## Example - Command line

It can be used as a command line tool like this:

```bash
npx wiremock
```

## Example - Mock API in frontend app

This example is in the repo in [`example-mock-api-with-express`](/example-mock-api-with-express).

It starts a server with [ExpressJS](https://www.npmjs.com/package/expressjs) and delegates to a frontend and an API. When running `npm run serve` it will start this setup:

```
http://localhost:8080/
  |
  |
  |---[/api/*]-> http://localhost:8081/
  |
   \
    \-[*]------> http://localhost:8082/
```

So that:

 * `http://localhost:8080/api/example` Will serve the API with `wiremock`.
 * `http://localhost:8080/whatever` Will serve the frontend. This can be a Vue app or whatever.


## Command line arguments

Available command line arguments `npx wiremock --help`:

```
Option                                  Description                             
------                                  -----------                             
--admin-api-basic-auth <String>         Require HTTP Basic authentication for   
                                          admin API calls with the supplied     
                                          credentials in username:password      
                                          format                                
--admin-api-require-https               Require HTTPS to be used to access the  
                                          admin API                             
--async-response-enabled <String>       Enable asynchronous response (default:  
                                          false)                                
--async-response-threads <String>       Number of asynchronous response threads 
                                          (default: 10)                         
--bind-address <String>                 The IP to listen connections            
--ca-keystore <String>                  Path to an alternative keystore         
                                          containing a Certificate Authority    
                                          private key & certificate for         
                                          generating certificates when proxying 
                                          HTTPS. Password is assumed to be      
                                          "password" if not specified.          
                                          (default: /home/bjerre/.wiremock/ca-  
                                          keystore.jks)                         
--ca-keystore-password <String>         Password for the alternative CA         
                                          keystore. (default: password)         
--ca-keystore-type <String>             Type of the alternative CA keystore     
                                          (jks or pkcs12). (default: jks)       
--container-threads <String>            The number of container threads         
--disable-banner                        Disable print banner logo               
--disable-gzip                          Disable gzipping of request and         
                                          response bodies                       
--disable-http                          Disable the default HTTP listener.      
--disable-request-logging               Disable logging of stub requests and    
                                          responses to the notifier. Useful     
                                          when performance testing.             
--enable-browser-proxying               Allow wiremock to be set as a browser's 
                                          proxy server                          
--enable-stub-cors                      Enable automatic sending of CORS        
                                          headers with stub responses.          
--extensions <String>                   Matching and/or response transformer    
                                          extension class names, comma          
                                          separated.                            
--global-response-templating            Preprocess all responses with           
                                          Handlebars templates                  
--help                                  Print this message                      
--https-keystore <String>               Path to an alternative keystore for     
                                          HTTPS. Password is assumed to be      
                                          "password" if not specified.          
                                          (default: jar:file:/home/bjerre/.     
                                          npm/_npx/2949/lib/node_modules/wiremock/jdeploy-
                                          bundle/wiremock-standalone-2.27.2.jar!
                                          /keystore)                            
--https-port <String>                   If this option is present WireMock will 
                                          enable HTTPS on the specified port    
--https-require-client-cert             Make the server require a trusted       
                                          client certificate to enable a        
                                          connection                            
--https-truststore <String>             Path to an alternative truststore for   
                                          HTTPS client certificates. Must have  
                                          a password of "password".             
--jetty-accept-queue-size <String>      The size of Jetty's accept queue size   
--jetty-acceptor-threads <String>       Number of Jetty acceptor threads        
--jetty-header-buffer-size <String>     The size of Jetty's buffer for request  
                                          headers                               
--jetty-stop-timeout <String>           Timeout in milliseconds for Jetty to    
                                          stop                                  
--key-manager-password <String>         Key manager password for use with the   
                                          alternative keystore. (default:       
                                          password)                             
--keystore-password <String>            Password for the alternative keystore.  
                                          (default: password)                   
--keystore-type <String>                The HTTPS keystore type. (default: JKS) 
--local-response-templating             Preprocess selected responses with      
                                          Handlebars templates                  
--match-headers <String>                Enable request header matching when     
                                          recording through a proxy             
--max-request-journal-entries <String>  Set maximum number of entries in        
                                          request journal (if enabled) to       
                                          discard old entries if the log        
                                          becomes too large. Default: no discard
--max-template-cache-entries [String]   The maximum number of response template 
                                          fragments that can be cached. Only    
                                          has any effect when templating is     
                                          enabled. Defaults to no limit.        
--no-request-journal                    Disable the request journal (to avoid   
                                          heap growth when running wiremock for 
                                          long periods without reset)           
--permitted-system-keys [String]        A list of case-insensitive regular      
                                          expressions for names of permitted    
                                          system properties and environment     
                                          vars. Only has any effect when        
                                          templating is enabled. Defaults to no 
                                          limit.                                
--port <String>                         The port number for the server to       
                                          listen on (default: 8080). 0 for      
                                          dynamic port selection.               
--preserve-host-header                  Will transfer the original host header  
                                          from the client to the proxied service
--print-all-network-traffic             Print all raw incoming and outgoing     
                                          network traffic to console            
--proxy-all <String>                    Will create a proxy mapping for /* to   
                                          the specified URL                     
--proxy-via <String>                    Specifies a proxy server to use when    
                                          routing proxy mapped requests         
--record-mappings                       Enable recording of all (non-admin)     
                                          requests as mapping files             
--root-dir <String>                     Specifies path for storing recordings   
                                          (parent for mappings and __files      
                                          folders) (default: .)                 
--trust-all-proxy-targets               Trust all certificates presented by     
                                          origins when browser proxying         
--trust-proxy-target <String>           Trust any certificate presented by this 
                                          origin when browser proxying          
--truststore-password <String>          Password for the trust store            
--truststore-type <String>              The HTTPS trust store type (default:    
                                          JKS)                                  
--use-chunked-encoding <String>         Whether to use Transfer-Encoding:       
                                          chunked in responses. Can be set to   
                                          always, never or body_file. (default: 
                                          always)                               
--verbose                               Enable verbose logging to stdout 
```

