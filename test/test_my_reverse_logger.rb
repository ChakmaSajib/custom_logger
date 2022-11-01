require "./my_reverse_logger"
require_relative "test_helper"

class TestMyReverseLogger < TestHelper
  def test_logs_the_output
    assert_equal MyReverseLogger.new.info("hello world"), "[INFO] dlrow olleh"
  end

  def test_supports_warn
    assert_equal MyReverseLogger.new.warn("a warn"), "[WARN] nraw a"
  end

  def test_supports_error
    assert_equal MyReverseLogger.new.error("an error"), "[ERROR] rorre na"
  end
end
