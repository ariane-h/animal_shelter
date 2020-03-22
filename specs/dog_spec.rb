require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/owner')
require_relative('../models/dog')

class TestDog < Minitest::Test

  def setup

    Dog.delete_all
    Owner.delete_all

      @owner1 = Owner.new({ 'name' => 'No Owner', 'email' => 'na', 'phone' => 'na', 'has_cats' => false, 'has_other_dogs' => false, 'has_children' => false, 'bio' => 'empty profile' })
      @owner1.save

      @owner2 = Owner.new({
        'name' => 'Daisy Steiner',
        'email' => 'daisy@gmail.com',
        'phone' => '01234568',
        'has_cats' => false,
        'has_other_dogs' => false,
        'has_children' => false,
        'bio' => 'Daisy is looking for a cute fluffy dog.'})
      @owner2.save

      @dog1 = Dog.new({
        'name' => 'Poppy',
        'age' => 7,
        'gender' => 'female',
        'size' => 'medium',
        'breed' => 'Poodle',
        'ok_w_cats' => true,
        'ok_w_dogs' => true,
        'ok_w_children' => true,
        'bio' => 'My name is Poppy and I am the cutest',
        'owner_id' => @owner2.id })
      @dog2 = Dog.new({
        'name' => 'Colin',
        'age' => 5,
        'gender' => 'male',
        'size' => 'small',
        'breed' => 'Miniature Schnauzer',
        'ok_w_cats' => false,
        'ok_w_dogs' => true,
        'ok_w_children' => true,
        'bio' => 'Hi, i am Colin',
        'owner_id' => @owner2.id })

      @dog1.save
      @dog2.save

    end


end
