require_relative "logger_helper.rb"

include LoggerHelper

class MyLogger
  def initialize(**args)
    @warn_size = args[:warn_size]
    @error_size = args[:error_size]
    @warnings = []
    @errors = []
  end

  def info(text)
    LoggerHelper.save_log_into_file LoggerHelper::INFO_LEVEL, text
    text_with_log_level LoggerHelper::INFO_LEVEL, text
  end

  def warn(text)
    warn_log = text_with_log_level LoggerHelper::WARN_LEVEL, text
    @warnings.append(warn_log) unless @warn_size.nil?

    if @warn_size.nil?
      LoggerHelper.save_log_into_file LoggerHelper::WARN_LEVEL, text
      warn_log
    elsif @warnings.length < @warn_size
    else
      warnings = @warnings.join("/n")
      @warnings = []
      warnings
    end
  end

  def error(text)
    error_log = text_with_log_level LoggerHelper::ERROR_LEVEL, text
    @errors.append(error_log) unless @error_size.nil?

    if @error_size.nil?
      LoggerHelper.save_log_into_file LoggerHelper::ERROR_LEVEL, text
      error_log
    elsif @errors.length < @error_size
    else
      errors = @errors.join("/n")
      @errors = []
      errors
    end
  end

  private

  def text_with_log_level(level, text)
    prepend_tag = text[/\[(.*?)\]/, 1]

    if prepend_tag.nil?
      "[#{level}] #{text}"
    else
      "[#{prepend_tag}][#{level}] #{text.split("]")[1].strip}"
    end
  end
end
