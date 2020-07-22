require 'flipper/adapters/memory'
require 'flipper/adapters/active_record'

adapter = Rails.env.test? ? Flipper::Adapters::Memory.new : Flipper::Adapters::ActiveRecord.new
FeatureFlags = Flipper.new(adapter)