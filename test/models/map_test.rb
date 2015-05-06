require 'test_helper'

class MapTest < ActiveSupport::TestCase
  def setup
    @map = Map.new(name: 'First')
    @map.save
  end

  test 'should save valid map' do
    assert @map.save, 'Could not save valid map'
  end

  test 'should not save map without name' do
    @map.name = ''
    assert_not @map.save, 'Saved the map without name'
  end

  test 'name should be at least 5 character length' do
    @map.name = '1234'
    assert_not @map.save, 'Saved the map with short name'
    @map.name = '12345'
    assert @map.save, 'Cannot save the map with acceptable short name'
  end

  test 'name should be maximum 64 character length' do
    @map.name = 'a'*65
    assert_not @map.save, 'Saved the map with very long name'
    @map.name = 'a'*64
    assert @map.save, 'Cannot save the map with acceptable long name'
  end

  test 'map name should be unique' do
    new_map = Map.new
    new_map.name = @map.name
    assert_not new_map.save, 'Saved the map with non-uniqueness name'
  end

  test 'map name should be case insensitive' do
    first_map = Map.new
    first_map.name = 'AbCDeFgdfg'
    first_map.save
    second_map = Map.new
    second_map.name = first_map.name.downcase
    assert_not second_map.save, 'Saved the map with non-uniqueness name in other text case'
  end
end
