require "test/unit"
require_relative "../app"

class AppTest < Test::Unit::TestCase 

  def setup
    @app = App.new
  end 
  
  def test_banana
    assert_equal "yellow", @app.banana
  end 
  
  def test_can_drink_true
    assert @app.can_drink?(22)
  end 
  
  def test_can_drink_false
    assert_equal false, @app.can_drink?(12)
  end

  def test_can_drink_bad_input
    assert_raise ArgumentError do 
      @app.can_drink?("zebra")
    end 
  end  
  
end 