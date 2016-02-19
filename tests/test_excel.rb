require './lib/excel.rb;'
require 'minitest/autorun'

class TestExcel < Minitest::Test
    
  def test_to_excel
    assert_equal(Excel.new.to_excel(1),"A")
    assert_equal(Excel.new.to_excel(13),"M")
    assert_equal(Excel.new.to_excel(26),"Z")
    assert_equal(Excel.new.to_excel(27),"AA")
    assert_equal(Excel.new.to_excel(52),"AZ")
    assert_equal(Excel.new.to_excel(247),"IM")
    assert_equal(Excel.new.to_excel(300),"KN")
    assert_equal(Excel.new.to_excel(801),"ADU")
  end
  
  def test_to_excel_out_of_bounds
    assert_equal(Excel.new.to_excel(-1),"INPUT MUST BE > 1")
    assert_equal(Excel.new.to_excel(0),"INPUT MUST BE > 1")
  end

end