# require('minitest/autorun')
# require('minitest/reporters')
# Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
#
# require_relative('../models/owner')
# require_relative('../models/dog')
#
# class TestOwner < Minitest::Test
# 
#   def setup
#
#       @owner1 = Owner.new({ 'name' => 'No Owner', 'email' => 'na', 'phone' => 'na', 'has_cats' => false, 'has_other_dogs' => false, 'has_children' => false, 'bio' => 'empty profile' })
#       @owner1.save
#       @owner2 = Owner.new({ 'name' => 'Daisy Steiner', 'email' => 'daisy@gmail.com', 'phone' => '01234568', 'has_cats' => false, 'has_other_dogs' => false, 'has_children' => false, 'bio' => 'Daisy is looking for a cute fluffy dog.' })
#       @owner2.save
#
#       # @dog1 = Dog.new( { 'name' => 'Poppy', 'age' => 7, 'gender' => 'female', 'size' => 'medium', 'breed' => 'Poodle', 'ok_w_cats' => true, 'ok_w_dogs' => true, 'ok_w_children' => true, 'owner_id' => owner1.id, 'bio' => "My name is Poppy, I'm the world's cutest poodle." } )
#
#   end
#
#     def test_get_name
#       assert_equal('Daisy Steiner', @owner2.name)
#     end
#
#     def test_get_email
#       assert_equal('daisy@gmail.com', @owner2.email)
#     end
#
#     def test_get_phone
#       assert_equal('01234568', @owner2.phone)
#     end
#
#     def test_has_cats
#       assert_equal(false, @owner2.has_cats)
#     end
#
#     def test_has_other_dogs
#       assert_equal(false, @owner2.has_other_dogs)
#     end
#
#     def test_has_children
#       assert_equal(false, @owner2.has_children)
#     end
#
#     def test_get_bio
#       bio = 'Daisy is looking for a cute fluffy dog.'
#       assert_equal(bio, @owner2.bio)
#     end
# end
