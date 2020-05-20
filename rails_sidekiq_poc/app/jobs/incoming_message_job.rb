# frozen_string_literal: true
class IncomingMessageJob < ApplicationJob
  queue_as :incoming_message

  def perform(args)
    # Do something later
    puts("Processing incoming message #{args.inspect}")
    args['sleep_duration'] = 0.001 *  rand(50..150)
    sleep(args['sleep_duration'])
    Sidekiq::Client.push({'queue' => 'outgoing_message', 'class' => 'OutgoingMessageJob', 'args' => [args]})
  end
end
