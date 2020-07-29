# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Visitors of the site can see all products, view individual product details and add them to a cart. User is then able to view the contents of the cart before checking out through the Stripe Payment API.

Administrators can login and create new products, and view a dashboard and the existing categories.

## Screenshots
### Home/Products 
!["Products page"](https://github.com/julimancan/tinyapp/blob/master/docs/create_new_shortUrl.JPG?raw=true)
### My Cart
!["My Cart page"](https://github.com/julimancan/tinyapp/blob/master/docs/user_urls.JPG?raw=true)
### Admin Products 
!["Admin Producst page"](https://github.com/julimancan/tinyapp/blob/master/docs/user_urls.JPG?raw=true)
### Admin Add A Product
!["Add a Product Page"](https://github.com/julimancan/tinyapp/blob/master/docs/user_urls.JPG?raw=true)

## Testing
- RSpec
- Capybara and Poltergeist

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
