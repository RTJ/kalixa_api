# KalixaApi

Kalixa Payments API client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kalixa_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kalixa_api

## Usage

Initialize the the gem by setting your username, password and api mode.

Example:

config/initializers/kalixa_api.rb

```ruby

KalixaApi.api_user ||= ENV['KALIXA_API_USER']
KalixaApi.api_password ||= ENV['KALIXA_API_PASSWORD']

KalixaApi.test_api_user ||= ENV['TEST_KALIXA_API_USER']
KalixaApi.test_api_password ||= ENV['TEST_KALIXA_API_PASSWORD']

KalixaApi.api_mode ||= (ENV['KALIXA_API_MODE'].downcase == 'production') rescue false

```


```ruby

response = KalixaApi::V4::Merchant.new.get_merchant_user("merchant_id","user_id")

# the parsed response is in the body
=> response.body

{
    "user"=>{
        "id"=>1234567,
         "externalId"=>"testCustomer01",
         "firstname"=>"FirstName",
         "lastname"=>"LastName",
         "username"=>"",
         "languageCode"=>"en",
         "email"=>"user.email@someuserdomain.com",
         "dateOfBirth"=>"0001-01-01T00:00:00",
         "gender"=>"0",
         "address"=>{
            "street"=>"",
             "houseName"=>"",
             "houseNumber"=>"",
             "houseNumberExtension"=>"",
             "postalCode"=>"",
             "city"=>"",
             "State"=>"",
             "countryCode"=>nil,
             "telephoneNumber"=>""
        }
    }
}

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kalixa_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KalixaApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/kalixa_api/blob/master/CODE_OF_CONDUCT.md).
