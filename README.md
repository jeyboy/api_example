# api_example


## Getting Started

To start the API server:

    bundle exec rackup

Now you can curl the API:

    curl localhost:9292/api/tags/parse/url
    curl localhost:9292/api/tags

## Swagger

To access the Swagger doc that is generated automatically with the `grape-swagger` gem, navigate your browser to
http://localhost:9292/api/swagger_doc.
