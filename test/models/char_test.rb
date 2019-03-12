require 'test_helper'

class CharTest < ActiveSupport::TestCase

  test 'Create char and count them' do
    char = Char.new(name: 'Boyeee', strength: 15, perception: 45, endurance: 78, charisma: 15, intelligence: 10, agility: 18, luck: 79, nick: 'WOW')
    char.save
    assert_equal 2, Char.all.count
  end

  test 'Create char and assert data' do
    char = Char.new(name: 'Boyeee', strength: 15, perception: 45, endurance: 78, charisma: 15, intelligence: 10, agility: 18, luck: 79, nick: 'WOW')
    char.save
    assert_equal 'Boyeee', Char.all.second[:name]
  end

  test 'Create 2 chars and count' do
    char1 = Char.new(name: 'Boyeee', strength: 15, perception: 45, endurance: 78, charisma: 15, intelligence: 10, agility: 18, luck: 79, nick: 'WOW')
    char2 = Char.new(name: 'Goga', strength: 43, perception: 21, endurance: 87, charisma: 48, intelligence: 31, agility: 44, luck: 62, nick: 'LOL')
    char1.save
    char2.save
    assert_equal 3, Char.all.count
  end

  test 'Update game and assert data' do
    @char = Char.new(name: 'Boyeee', strength: 15, perception: 45, endurance: 78, charisma: 15, intelligence: 10, agility: 18, luck: 79, nick: 'WOW')
    @char.save
    @char.update(name: 'Goga', strength: 43, perception: 21, endurance: 87, charisma: 48, intelligence: 31, agility: 44, luck: 62, nick: 'LOL')
    assert_equal 'Goga', Char.all.second[:name]
    assert_equal 43, Char.all.second[:strength]
    assert_equal 21, Char.all.second[:perception]
    assert_equal 87, Char.all.second[:endurance]
    assert_equal 48, Char.all.second[:charisma]
    assert_equal 31, Char.all.second[:intelligence]
    assert_equal 44, Char.all.second[:agility]
    assert_equal 62, Char.all.second[:luck]
    assert_equal 'LOL', Char.all.second[:nick]
  end

  test 'Delete chars and count' do
    char = Char.new(name: 'Boyeee', strength: 15, perception: 45, endurance: 78, charisma: 15, intelligence: 10, agility: 18, luck: 79, nick: 'WOW')
    char.save
    char.delete
    assert_equal 1, Char.all.count
  end

end
