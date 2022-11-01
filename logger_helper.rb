module LoggerHelper
  INFO_LEVEL = "INFO"
  WARN_LEVEL = "WARN"
  ERROR_LEVEL = "ERROR"
  CUSTOM_LOGGER_LOG_FILE_DESTINATION = "log/custom_logger_log.txt"

  def save_log_into_file(label, text)
    File.open(CUSTOM_LOGGER_LOG_FILE_DESTINATION, "a") do |file|
      file.puts "[#{label}] #{text} at #{Time.now}"
    end
  end

  def save_log_reversely_into_file(label, text)
    File.open(CUSTOM_LOGGER_LOG_FILE_DESTINATION, "a") do |file|
      file.puts "[#{label}] #{text.reverse} at #{Time.now}"
    end
  end
end
