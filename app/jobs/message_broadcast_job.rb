class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end
  # A job is a class which performs code by using Redis server and is not connected with a Rails server.
  # It’s completely independant. It can create or update a record, call a model’s method, or do whatever you want!
end
