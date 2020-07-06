# Project - Animal Shelter

A dog shelter has requested an app that can track dogs for rehoming. An owner may reserve more than one dog. A dog is reserved by only one owner.

## MVP

Important information for the shelter to know is:
* For the dog:
    * Name
    * Owner
    * Age
    * Breed
    * Gender
    * Size
    * Bio
* For the owner:
    * Name
    * Email address
    * Contact number
    * Bio listing what they're looking for
* Allow an owner to reserve a dog (assign a dog to an owner)
* A staff member can edit, add, update and delete both dogs and owners.
* Staff members can also see a list of all owners and dogs and also which dog is assinged to which owner.

Possible Extensions:

* Add an availability status for dogs. Which dogs are available and which are reserved?
* Add characteristics to dogs and preferences to owners. List potential dog matches for owners.
* Add profile images for dogs.
* Add more types of animal.
* Record donations from owners.

## :wrench: Setup

This app requires Ruby, Postgres, Sinatra to run.

Clone this repo, then in the root directory, use Terminal to install the gems needed to run the app.

```bash
bundle install
```

Create a local Postgres database:

```
createdb animal_shelter
```

Load some data into the database:

```
ruby db/seeds.rb
```

Run the app:

```
ruby app.rb
```

Hop over to http://localhost:4567/ in your browser to use the app. 
