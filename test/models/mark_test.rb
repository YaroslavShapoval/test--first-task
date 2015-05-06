require 'test_helper'

class MarkTest < ActiveSupport::TestCase
  def setup
    map = Map.new(name: 'TestTest')
    map.save

    @mark = Mark.new
    @mark.description = 'Description'
    @mark.lng = -65.23640
    @mark.lat = 89.99999
    @mark.map_id = map.id
    @mark.save
  end

  test 'should save valid mark' do
    assert @mark.save, 'Could not save valid mark'
  end

  test 'should save mark without description' do
    @mark.description = ''
    assert @mark.save, 'Could not save mark without description'
  end

  test 'should be with not so long description' do
    @mark.description = 'a'*256
    assert_not @mark.save, 'Saved mark with very long description'
    @mark.description = 'a'*255
    assert @mark.save, 'Cannot save mark with long description'
  end

  test 'should exist latitude and longitude' do
    @mark.lat = ''
    assert_not @mark.save, 'Saved mark without latitude'
    @mark.lat = 0
    @mark.lng = ''
    assert_not @mark.save, 'Saved mark without longitude'
  end

  test 'should not save mark with wrong latitude and longitude' do
    @mark.lng = 0
    @mark.lat = 90.1
    assert_not @mark.save, 'Saved mark with wrong latitude'
    @mark.lat = -90.1
    assert_not @mark.save, 'Saved mark with wrong latitude'

    @mark.lat = 0
    @mark.lng = 180.1
    assert_not @mark.save, 'Saved mark with wrong longitude'
    @mark.lng = -180.1
    assert_not @mark.save, 'Saved mark with wrong longitude'
  end
end
