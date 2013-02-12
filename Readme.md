# Netstat24

Ruby wrapper for the [Netstat24 API](http://netstat24.com/documentation/podklyuchenie_k_sisteme/collector_api).

## Installation

    [sudo] gem install netstat24

## Usage

    require 'rubygems'
    require 'netstat24'

    client = Netstat24.new('app_id', 'access_token', 'user_id')
    client.visit
    client.userData(20, 'f', 321, 123, 69)