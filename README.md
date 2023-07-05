# Authentication vs Authorization
- Authentication: Credentials that prove you are who you say you are  (username, password)
- Authorization: What you have access to when you are logged in

## Devise
- Devise is a gem that helps with authentication and authorization
- Gives the ability to create a user and have access to certain content based on credentials

```
$ bundle add devise
$ rails generate devise:install
$ rails generate devise User
$ rails db:migrate
```

## JWT
JSON Web Tokens
- A token is handed from our backend to the frontend telling our application a user is logged in and authenticated

