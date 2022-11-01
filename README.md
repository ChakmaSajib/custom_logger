# Basic custom logger

Logger has the following features:

- Print messages and save into a file with different levels such as `INFO`, `WARN` and `ERROR`

- Reverse order formating option of log messages

### Project setup

#### 1. Install Ruby

NOTE: You need to install Ruby before running this project on your local machine.

##### i) RVM

```
$ \curl -sSL https://get.rvm.io | bash -s stable
```

##### ii) Ruby

```
$ rvm install 3.1.0
$ rvm use 3.1.0 --default
```

#### 2. Project dependencies

##### i) Install Minitest framework

Run `bundle install` from the root folder to install it. I used Minitest framework for the testing.

#### Folder and File

In the root folder, We have 2 separate folders

1.  `log` folder in where our log data/information will be stored and
2.  `test` folder in where our test files are located.
3.  `logger_helper.rb` - in here I defined one module which hold - constant variable and methods.
4.  `my_logger.rb` and `my_reverse_logger.rb` are mainly providing the custom logger functionality.

- Inside `my_logger.rb` I created one private method `text_with_log_level(level, text)` which one is basically accepting two arguments and base one argument value it will return value.

5.  `log/customer_logger_log.txt` helps to view the log message with the date.

#### Run `tests` of a specific file

<hr>

To run specific test

- `ruby [folder_name]/[file_name.rb]`
  - Example: `ruby test/test_my_logger.rb`

In the test folder I added another file `test_helper.rb` in where I imported `minitest/autorun` and inherited the `Minitest::Test`.

NOTE: Why I added this `test_helper.rb`

- To avoid repeated code. For example, I don't need to import and write minitest again and again.

#### Run specific `class` instance method of a specific file

<hr>

To run:

- `ruby -r "./[file_name.rb]" -e "[class_name].new.[method_name] '[params]'"`
  - Example: `ruby -r "./my_logger.rb" -e "MyLogger.new.info 'hi'"`
