# ruby-selenium-docker

Just a sample script to show Selenium webdriver usage through Ruby and Rspec

As always, Docker is the only pre-req!

Run the following docker run command:

```Bash
docker run --rm -it --name ruby-selenium -v $PWD:/home/app -w /home/app nbulai/ruby-chromedriver /bin/bash
```

This will provision and return back a root shell inside the container. Follow these steps to run the sample script(s)

- Install the required gems by running the following commands:
```
gem install selenium-webdriver
```
```
gem install rspec
```
- Clone this repo and change into the rspec-scripts directory
- Run this command:
```
rspec selenium-ui-test.rb
```
- Once the test passes, there would be a snapshot for the successful execution as well. It's a snap of my LinkedIn profile. Yeah I'm a shameless self-promotor. Get over it :)