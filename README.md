# JWT RUby on Rails

## Descrição

Login e autenticação de rotas com Ruby on Rails, utilziando JWT.

## Configuração do Ambiente

### Dependencias

Certifique-se de ter as seguintes ferramentas instaladas em seu sistema:

- Ruby
- Rails
- PostgreSQL

### Instalação

Clone o repositório:
```
git clone https://github.com/Paulo-Abreu/Login-Acess-JWT-Ruby-on-Rails-Teste-Printer-.git
cd JWTacess
```
Instale as dependências:

```
bundle install
```
Configurações do Banco de Dados:

Crie o banco de dados:

```
rails db:create
```
Execute as migrações:

```
rails db:migrate
```
Execute o servidor:

```
rails server
```


## Endpoints

- POST : base_url/users (create user)

```
[
  {
      "email": "email@email.com",
      "password": "senha123",
      "name": "paul"
  }...
]

....

STATUS: 201 CREATED
{
    "id": 3,
    "email": "email@email.com",
    "password": "senha123",
    "name": "paul",
    "reset_password_token": null,
    "reset_password_sent_at": null,
    "remember_created_at": null,
    "created_at": "2023-12-05T01:04:56.381Z",
    "updated_at": "2023-12-05T01:04:56.381Z"
}

```

- POST : base_url/api/v1/auth/login

```
[
  {
      "email": "email@email.com",
      "password": "senha123"
  }...
]

....

STATUS: 200 OK
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3MDE3NDE2Mjl9.-8QSgDOgQz2T6SYmzjQPz7zhAWgN3wiL2DKxlPXVypY"
}

....
STAUTS: 401 UNATHOURIZED

{
    "error": "Invalid email or password"
}

```

- GET : base_url/users (only work with header jwt token generated in : POST : base_url/api/v1/auth/login - w/ KEY:'Authorization')
  
![image](https://github.com/Paulo-Abreu/Login-Acess-JWT-Ruby-on-Rails-Teste-Printer-/assets/56804712/7afb0616-6f8f-44a7-a4f0-9da1e4aa264d)

- INVALID TOKEN

![image](https://github.com/Paulo-Abreu/Login-Acess-JWT-Ruby-on-Rails-Teste-Printer-/assets/56804712/9cc45863-1c68-440f-81da-3ce77799b4ef)

- NIL TOKEN

![image](https://github.com/Paulo-Abreu/Login-Acess-JWT-Ruby-on-Rails-Teste-Printer-/assets/56804712/b9d3fa98-a723-4b77-9725-fdbfa5001198)


- PUT : base_url/users/paul (only work with header jwt token generated in : POST : base_url/api/v1/auth/login - w/ KEY:'Authorization')

![image](https://github.com/Paulo-Abreu/Login-Acess-JWT-Ruby-on-Rails-Teste-Printer-/assets/56804712/494f3705-2d5a-4cf0-bd80-79033bee482b)
