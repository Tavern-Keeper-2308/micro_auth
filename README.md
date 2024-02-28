
<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]


<h3 align="center">Micro Auth</h3>

  <p align="left">
    This application is a micro service for user authentication and management. It utilizes Devise as this is an industry standard and has robust community support for project longevity.
    <br />




<!-- TABLE OF CONTENTS -->
## Table of Contents
  1. [About The Project](#about-the-project)
      - [Built With](#built-with)
      - [Gems](#gems)
  2. [Getting Started](#getting-started)
      - [Installation](#installation)
  3. [Endpoints](#endpoints)
      - [POST users/tokens/sign_up](#sign-up)
      - [POST users/tokens/sign_in](#sign-in)
      - [POST users/tokens/refresh](#refresh-token)
      - [POST users/tokens/revoke](#revoke-token)
      - [GET users/tokens/info](#user-info)
  4. [Contributors](#contributors)



<!-- ABOUT THE PROJECT -->
## About The Project

[![Tavern Keeper](https://img.shields.io/badge/Tavern_Keeper-Visit_Website-purple?style=for-the-badge)](https://tavern-keeper-fe.vercel.app/)

### Built With
#### Development
* [![Ruby on Rails][Rails-shield]][Rails-url]
* [![PostgreSQL][PostgreSQL-shield]][PostgreSQL-url]

#### Additional Tools and Deployment
* [![Postman][Postman-shield]][Postman-url]
* [![Render][Render-shield]][Render-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Gems

#### Production
* [![rack-cors][gem-rackcors]][gem-rackcors-url]

#### Testing and Development
* [![rspec-rails][gem-rspec-rails]][gem-rspec-rails-url]
* [![simplecov][gem-simplecov]][gem-simplecov-url]
* [![factory_bot_rails][gem-factory_bot_rails]][gem-factory_bot_rails-url]
* [![faker][gem-faker]][gem-faker-url]
* [![shoulda-matchers][gem-shoulda-matchers]][gem-shoulda-matchers-url]
* [![pry][gem-pry]][gem-pry-url]
* [![debug][gem-debug]][gem-debug-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com:Tavern-Keeper-2308/micro_auth.git
   ```
2. Gem Bundle
   ```sh
    bundle
   ```
3. Rake
   ```sh
    rails db:{drop,create,migrate,seed}
   ```
4. To run on local server, [http://localhost:4000/](http://localhost:4000/)
   ```sh
    rails s
   ```
5. Live deploy via desired method



<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Testing
1. Run test suite
   ```sh
   bundle exec rspec
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ENDPOINTS -->
## Endpoints

### [POST users/tokens/sign_up](#sign-up)
- Signs a user up for MicroAuth, must provide a valid email and password greater than 5 characters.

##### Body
```json
{
    "email": "test@development.com",
    "password": "123456"
}
```
##### Response
```json
{
  "token": "Y9XDYyF1CTTssa9GE14Uu5JTpvYzzk9Uajr98y6czjANemsCcxvi2oVDfrny",
  "refresh_token": "LFYxfHNU5VB1pgizMTPeJ4yndwyyNigFE1WCtukmoB_L5wgoH1cz9JmQ5Kj5",
  "expires_in": 3600,
  "token_type": "Bearer",
  "resource_owner": {
      "id": 1,
      "email": "test@development.com",
      "created_at": "2024-02-28T20:46:37.866Z",
      "updated_at": "2024-02-28T20:46:37.866Z"
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [POST users/tokens/sign_in](#sign-in)
- Signs a user in to MicroAuth, generating a token and a refresh token. Must provide an email and password for a signed up user.

##### Body
```json
{
    "email": "test@development.com",
    "password": "123456"
}
```

##### Response
```json
{
  "token": "We3HAeRHpwvrBPJgY2f8FrejiirtaYpAyZrboVgy9sn1PKieBRt_z6xz-bhb",
  "refresh_token": "yxPPyb6-qA4odLHgUF4rxT1xrSoEuJ91sWSosv_UzaKWgfp8Ch7ze96cxAHk",
  "expires_in": 3600,
  "token_type": "Bearer",
  "resource_owner": {
      "id": 1,
      "email": "test@development.com",
      "created_at": "2024-02-28T20:46:37.866Z",
      "updated_at": "2024-02-28T20:46:37.866Z"
    }
}
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [POST users/tokens/refresh](#refresh-token)
- Generates a new token for a user. Must provide refresh token as bearer token, without a body.
- Used for keeping a user logged in securely without having to provide login credentials when a token expires.

##### Response
```json
{
    "token": "Jf6YUxLzxnm4_gv2zcwyWV8vpwAcxSfTuSFQJsLywTxf_JZ7LHci_vxVKZCC",
    "refresh_token": "kqJByMxiiMrnzSiXDsmK4GsSK2zGcdzdQmGSRSXbDoudmwzWUL5HbqWtwzLC",
    "expires_in": 3600,
    "token_type": "Bearer",
    "resource_owner": {
        "id": 1,
        "email": "test@development.com",
        "created_at": "2024-02-28T20:46:37.866Z",
        "updated_at": "2024-02-28T20:46:37.866Z"
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [POST users/tokens/revoke](#revoke-token)
- Revokes an active user's token and refresh token. Must provide either token or refresh token as a bearer token. Used for logging a user out.
- Successful requests will not return a response.

<p align="right">(<a href="#readme-top">back to top</a>)</p>




### [GET users/tokens/info](#user-info)
- Returns info for a user. Must provide token as bearer token, without a body.

##### Response
```json
{
  "id": 1,
  "email": "test@development.com",
  "created_at": "2024-02-28T20:46:37.866Z",
  "updated_at": "2024-02-28T20:46:37.866Z"
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Organization: Tavern Keeper

Organization Link: [https://github.com/Tavern-Keeper-2308](https://github.com/Tavern-Keeper-2308)

Project Link: [https://github.com/Tavern-Keeper-2308/micro_auth](https://github.com/Tavern-Keeper-2308/micro_auth)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Contributors

Xander Hendry 

[![LinkedIn][linkedin-shield]][linkedin-url-zh]
[![GitHub][github-shield-zh]][github-url-zh]

Kevin Zolman 

[![LinkedIn][linkedin-shield]][linkedin-url-kz]
[![GitHub][github-shield-kz]][github-url-kz]


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[contributors-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[forks-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/network/members
[stars-shield]: https://img.shields.io/github/stars/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[stars-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[issues-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/issues
[license-shield]: https://img.shields.io/github/license/Tavern-Keeper-2308/tavern_keeper_be.svg?style=for-the-badge
[license-url]: https://github.com/Tavern-Keeper-2308/tavern_keeper_be/blob/master/LICENSE.txt
[product-screenshot]: images/screenshot.png

<!-- BUILD WITH SHIELDS -->
[Rails-shield]: https://img.shields.io/badge/Ruby%20on%20Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/

[PostgreSQL-shield]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org/

[Postman-shield]: https://img.shields.io/badge/Postman-orange?style=for-the-badge&logo=Postman&logoColor=white
[Postman-url]: https://www.postman.com/

[Render-shield]: https://img.shields.io/badge/Render-6A0DAD?style=for-the-badge&logo=Render&logoColor=white
[Render-url]: https://render.com/

<!-- GEM SHIELDS -->
[gem-debug]: https://img.shields.io/badge/debug-1.9.1-brightgreen?style=flat-square
[gem-debug-url]: https://rubygems.org/gems/debug

[gem-rspec-rails]: https://img.shields.io/badge/rspec--rails-6.1.0-green?style=flat-square
[gem-rspec-rails-url]: https://github.com/rspec/rspec-rails

[gem-simplecov]: https://img.shields.io/badge/simplecov-0.22.0-yellow?style=flat-square
[gem-simplecov-url]: https://github.com/simplecov-ruby/simplecov

[gem-factory_bot_rails]: https://img.shields.io/badge/factory_bot_rails-6.4.0-success?style=flat-square
[gem-factory_bot_rails-url]: https://github.com/thoughtbot/factory_bot_rails

[gem-faker]: https://img.shields.io/badge/faker-3.2.2-00CED1?style=flat-square
[gem-faker-url]: https://github.com/faker-ruby/faker

[gem-pry]: https://img.shields.io/badge/pry-0.14.2-yellow?style=flat-square
[gem-pry-url]: https://github.com/pry/pry

[gem-shoulda-matchers]: https://img.shields.io/badge/shoulda--matchers-6.0.0-orange?style=flat-square
[gem-shoulda-matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[gem-rackcors]: https://img.shields.io/badge/rack--cors-2.0.1-9b59b6?style=flat-square&label=rack-cors
[gem-rackcors-url]: https://github.com/cyu/rack-cors

<!-- CONTRIBUTOR SHIELDS AND URLS -->
[github-shield-zh]: https://img.shields.io/badge/GitHub-XanderHendry-success?style=for-the-badge&logo=github
[github-url-zh]: https://github.com/xanderhendry

[github-shield-kz]: https://img.shields.io/badge/GitHub-zkevkev-success?style=for-the-badge&logo=github
[github-url-kz]: https://github.com/zkevkev

<!-- LINKEDIN SHIELDS AND URLS-->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url-kz]: https://www.linkedin.com/in/kevin-zolman
[linkedin-url-zh]: https://www.linkedin.com/in/xander-hendry-70b804289
