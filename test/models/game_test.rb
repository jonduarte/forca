require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "guess correct word" do
    @game = games(:atual)

    @game.guess 'a'
    @game.guess 't'
    @game.guess 'u'

    @game.guess 'atual'

    assert @game.win?
    assert !@game.lose?
  end

  test "guess incorrect word" do
    @game = games(:atual)

    @game.guess 'a'
    @game.guess 't'
    @game.guess 'u'

    @game.guess 'atuar'

    assert !@game.win?
    assert @game.lose?
  end
end
