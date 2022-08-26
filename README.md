

[![master](https://github.com/LucDelmon/programming-challenge/actions/workflows/ci.yml/badge.svg)](https://github.com/LucDelmon/programming-challenge/actions?query=workflow%3Aci)
# Introduction

This is a technical test provided by Rails Europe. Instructions are available [here](./INSTRUCTIONS.md).

# Installation
- You need to have Ruby installed on your system. Preferably, you should have Ruby 3.0 or newer.
- You need bundle installed. You can install it with `gem install bundler`.

- Pull the project and run `bin/setup` to install dependencies.

# Running the program
- You can run all the spec with `rspec`.
- At the root of the project run `ruby rails_europe.rb` to run the program with the default xml.
- The output should be displayed on the screen.
- To use another xml file you can edit the file task/search.xml and run `ruby rails_europe.rb` again.
- You can also edit the file `rails_europe.rb` and change the path file to another xml file.
