# Oystercard Challenge (Makers Academy Week 2)

A simulation of the oystercard fare card system used by London's TFL transport  
 system.

## Contents
/lib  
airport.rb  
plane.rb  
weather.rb  

/spec  
airport_spec.rb  
plane_spec.rb  
weather_spec.rb  

## Getting Started

1) Clone or download and unzip repository.
2) run bundle install to install dependencies listed in Gemfile
2) from the root directory, run irb or pry. They .pryrc or .irbrc config files  
will load all dependencies automatically.

## Instructions for use

The .pryrc or .irbrc config file will have created a new oystercard for you   
(called **card**), and three new stations (bank in zone 1, aldgate in zone 1,   
and finsbury park in zone 3).

To make new stations, input **[your station name] = Station.new([name], [zone])**, where **[name]** is a string with the stations name, and [zone] is an integer with the stations zone.

You card cannot be used until you have at least £1 credit. To check your balance, use **card.balance**, and to top up, use **card.top_up([amount])** where amount is a float or an integer greater than zero.

To go on a journey, use **card.touch_in(station)** to touch in, and **card.touch_out(station)** to touch out. A fare appropriate to the length of the journey will be applied.

If you forget to touch in (touch out without touching in) or forget to touch out (touch in twice without touching out), a penalty fare of £6 will be applied to your account.


## Testing

All tests were designed and run using the rspec framework. If the rspec gem is installed, they can be run from terminal in the main repository folder using the **rspec** command.
