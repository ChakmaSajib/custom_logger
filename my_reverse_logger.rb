require_relative "logger_helper.rb"

include LoggerHelper

class MyReverseLogger
  def info(text)
    LoggerHelper.save_log_reversely_into_file LoggerHelper::INFO_LEVEL, text
    reverse_with_log_level LoggerHelper::INFO_LEVEL, text
  end

  def warn(text)
    LoggerHelper.save_log_reversely_into_file LoggerHelper::WARN_LEVEL, text
    reverse_with_log_level LoggerHelper::WARN_LEVEL, text
  end

  def error(text)
    LoggerHelper.save_log_reversely_into_file LoggerHelper::ERROR_LEVEL, text
    reverse_with_log_level LoggerHelper::ERROR_LEVEL, text
  end

  private

  def reverse_with_log_level(level, text)
    "[#{level}] #{text.reverse}"
  end
end
