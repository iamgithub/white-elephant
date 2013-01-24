# Copyright 2012 LinkedIn, Inc

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require File.dirname(__FILE__) + '/app'
require "sprockets"
require "logger"
require 'multi_json'
require 'handlebars_assets'

HandlebarsAssets::Config.ember = true

# use gzip compression
use Rack::Deflater

map '/assets' do

  environment = Sprockets::Environment.new do |env|

  end

  environment.append_path 'vendor/assets/javascripts'
  environment.append_path 'vendor/assets/stylesheets'
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path HandlebarsAssets.path

  run environment
end

map '/' do  
  run Sinatra::Application
end