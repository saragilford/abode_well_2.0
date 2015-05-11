# abode_well_2.0



<!-- stashed notes -->

GET  /buildings/:id
Controller#Action:  Building#Score

Description:
Getting The building object and score.

Returns an object and the associated score, or "Scoops Score" for that building.

Building fields include:......

<!-- for the GET routes: sending json objects -->

4.2 JSON parameters If you're writing a web service application, you might find yourself more comfortable accepting parameters in JSON format.

If the "Content-Type" header of your request is set to "application/ json", Rails will automatically convert your parameters into the params hash, which you can access as you would normally.

So for example, if you are sending this JSON content:
`{ "company": { "name": "acme", "address": "123 Carrot Street" } }`
You'll get:
`params[: company] as { "name" = > "acme", "address" = > "123 Carrot Street" }`.

Also, if you've turned on config.wrap_parameters in your initializer or calling wrap_parameters in your controller, you can safely omit the root element in the JSON parameter. The parameters will be cloned and wrapped in the key according to your controller's name by default. So the above parameter can be written as:
`{ "name": "acme", "address": "123 Carrot Street"`


And assume that you're sending the data to CompaniesController, it would then be wrapped in `:company` key like this:
`{ name: "acme", address: "123 Carrot Street", company: { name: "acme", address: "123 Carrot Street" }`

Ruby on Rails. Ruby on Rails Guides  v2 (Kindle Locations 4799-4802). Ruby on Rails.

*source: Ruby on Rails. Ruby on Rails Guides  v2 (Kindle Locations 4791-4799). Ruby on Rails.*

<!-- web: bundle exec rackup p $PORT ->