require "./my_logger"
require_relative "test_helper"

class TestMyLogger < TestHelper
  def test_logs_the_output
    assert_equal MyLogger.new.info("hello world"), "[INFO] hello world"
    assert_equal "[API CALLS][INFO] api is calling", MyLogger.new.info("[API CALLS] api is calling")
  end

  def test_supports_warn
    assert_equal MyLogger.new.warn("this is a warning"), "[WARN] this is a warning"
  end

  def test_supports_error
    assert_equal MyLogger.new.error("this is an error"), "[ERROR] this is an error"
  end

  def test_supports_buffered_output
    my_logger = MyLogger.new(warn_size: 2, error_size: 3)

    assert_equal my_logger.info("hello"), "[INFO] hello"

    assert_nil my_logger.warn("blabla")

    assert_equal my_logger.warn("umbrella"), ["[WARN] blabla", "[WARN] umbrella"].join("/n")

    assert_nil my_logger.warn("hello")

    assert_nil my_logger.error("oops")

    assert_nil my_logger.error("oopsie")

    assert_equal my_logger.warn("what"), ["[WARN] hello", "[WARN] what"].join("/n")

    assert_equal my_logger.error("ouch"), ["[ERROR] oops", "[ERROR] oopsie", "[ERROR] ouch"].join("/n")
  end
end
