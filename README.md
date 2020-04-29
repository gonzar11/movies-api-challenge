# Movies API Challenge!

### Ruby version
2.6.5

### Rails version
6.0.2.2

### Hosting
https://movies-api-challenge.herokuapp.com/

### Authentication
JWT Authentication

### Api Doc
#### Signup
    POST /api/signup
* Data params example
```json
{ 
    "name": "John",
    "email": "john@email.com",
    "password": "123456",
    "password_confim": "123456",
    
 }
```
#### Login
    POST api/auth/login
* Data params example 
```json
{ 
    "email": "john@email.com",
    "password": "123456",
 }
```
#### Movies
    GET /api/movies                                                          
    POST   /api/movies
    GET    /api/movies/:id
    PUT    /api/movies/:id                                                               
    DELETE /api/movies/:id
    
 * Data params example (POST and PUT)
 ```
  { 
    "title": "Pulp Fiction",
    "release_year": 1995,
    "casting": [1,2,3],
    "directors": [4],
    "producers": [5]
    
  }

```
Casting, directors and producer are array of Integers with people's ids

#### People
    GET /api/people                                                          
    POST   /api/people
    GET    /api/people/:id
    PUT    /api/people/:id                                                               
    DELETE /api/people/:id
    
 * Data params example (POST and PUT)
 ```json
  { 
    "first_name": "Quentin",
    "last_name": "Tarantino",
    "acted_movies": [1,2],
    "directed_movies": [1,2],
    "produced_movies": [1,4]
    
  }

```
acted_movies, directed_movies and produced_movies are array of integer with movies's ids


### Running tests
This project uses rspec for testing. To run the tests, run 
```sh
$ rspec
```

