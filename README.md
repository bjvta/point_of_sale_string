# Point of sale problem

## Requirements
 - Ruby version 2.7.7
 - Bundler
 - RSpec

## Installation

Clone the project

```
git clone https://github.com/bjvta/point_of_sale_string
cd point_of_sale_string
```

To install ruby using rbenv:
```
rbenv install 2.7.7
```
		
To set the local in the project
```
rbenv local 2.7.7
```

Install dependencies
```
gem install bundler:2.3.8
bundle install
```

## Running tests

The main class is `lib/checkout_service.rb`

```
rspec spec
```

You will see this examples

```bigquery
----
Input 1:
Given data:
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
----
Excepted data:
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
----
.----
Input 2:
Given data:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
----
Excepted data:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
----
.----
Input 3:
Given data:
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
----
Excepted data:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
----
```


Happy testing!
