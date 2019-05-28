# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_names = ['Joe', 'Jane', 'Frank']
customers = []
customer_names.each do |name|
  customer = Customer.create(name: name)
  customers << customer
end

agent_names = ['Ben', 'Katie']
agents = []
agent_names.each do |name|
  agent = Agent.create(name: name)
  agents << agent
end

threads = [
  [
    'Hello, I need help',
    'How can I help you?',
    'I need a loan'
  ],
  [
    'I\'m just spamming'
  ]
]

threads.each_with_index do |thread, thread_index|
  puts thread
  customer = customers[thread_index % customers.length]
  agent = agents[thread_index % customers.length]
  puts customer
  puts agent

  thread.each_with_index do |msg_body, msg_index|
    # Every other message is by an agent. If the message is by a customer,
    # the agent reference is set to nil
    Message.create(
      customer: customer,
      agent: msg_index.odd? ? agent : nil,
      body: msg_body
    )
  end
end
