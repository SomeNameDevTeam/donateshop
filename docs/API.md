# DonateShop API

To authenticate, add X-USER-TOKEN header.
Always specify content-type

- Invalid / expired token => 401 UNAUTHORIZED
- No token / not admin / etc => 403 FORBIDDEN

Request and response examples are marked with flow types

## CRUD notation

NOTE: :id is not always integer

sometimes there are resources marked as CRUDI

i.e.

`CRUD /:category/articles`

`CRD /:category/articles/items`

it means following is granted:

### POST /:resource (C)

Request:

```
{
  resource: { ...attributes },
}
```

Response:

- 201 CREATED with `R` JSON
- 422 UNPROCESSABLE ENTITY
  ```
  {
    code: "unprocessable",
    errors: {[attribute]: string[]},
  }
  ```

### GET /:resource/:id (R)

Response:

- 200 OK
  ```
  {
    code: "ok",
    resource: { ...attributes },
  }
  ```

- 404 NOT FOUND
  ```
  {
    code: "not found",
  }
  ```

### PUT /:resource/:id (U)

Request:

```
{
  resource: { ...attributes },
}
````


Response:

- 200 OK with `R` JSON
- 422 UNPROCESSABLE ENTITY
  ```
  {
    code: "unprocessable",
    errors: {[attribute]: string[]},
  }
  ```

### DELETE /:resource/:id (D)

Response:

  - 200 OK
  ```
  {
    code: "ok"
  }
  ```

### GET /:resource

Request:

```
{
  page?: string,
  per_page?: string,
}
```

Response:
- 200 OK
  ```
    {
      page?: integer,
      per_page?: integer,
      resources: [/* R json */]
    }
  ```

## RUD Users

### POST /users

Request:

```
{
  email: string,
  password: string,
}
```

Response:

- 201 Created
  ```
  {
    status: "ok",
    token: string,
    userId: integer,
  }
  ```

## Session

### POST /session

Request:

```
{
  email: string,
  password: string,
}
```

Response:

- 201 Created
  ```
  {
    status: "ok",
    token: string,
    userId: integer,
  }
  ```

### DELETE /session

Response:

- 200 OK
  ```
  {
    status: "ok"
  }
  ```

## CRUDI Categories

## CRUDI Modifiers (/categories/:id/modifiers)

Contains possible values

## CRUDI Articles (/categories/:id/articles)

Contains items index at `items:`

## Items (/categories/:id/articles/:id/items)

### GET /categories/:id/articles/:id/items

Response:

```
{
  status: "ok",
  items:
    {
      modifiers: { [string]: string },
      count: integer,
    }[]
  ],
}
```

### POST /categories/:id/articles/:id/items

Request:

```
  {
    modifiers: { [string]: string },
    count?: integer,
  }
```

Response:

- 201 CREATED
  ```
    {
      status: "ok"
    }
  ```

### DELETE /categories/:id/articles/:id/items


Request:

```
  {
    modifiers: { [string]: string },
    count?: integer,
  }
```


Response:

- 200 OK
  ```
    {
      status: "ok"
    }
  ```

- 422 UNPROCESS ENTITY
  ```
  {
    status: "unprocessable",
    errors: { count: ["not_enough"] }
  }
  ```

## RUI orders (/orders)

### GET /user/:id/orders

Same as /orders, but scoped

### POST create /orders

Request:

```
{
  donation: integer,
  adress: string,
  items: {
    count: integer,
    article_id: integer,
    modifiers: { [string]: string }
  }[]
}
