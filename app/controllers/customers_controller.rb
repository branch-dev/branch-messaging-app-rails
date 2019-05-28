class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @agents = Agent.all
  end

  def send_message
    customer = Customer.find(params[:id])
    msg_body = params[:message]
    agent_id = params[:agent].to_i
    agent = Agent.find(agent_id)

    msg = Message.create(
      customer: customer,
      agent: agent,
      body: msg_body
    )

    redirect_to customer_path, notice: "Sent message #{msg.body} for customer #{customer.name} (id #{customer.id})"
  end

  def test
    @customers = Customer.all

    if request.post?
      msg_body = params[:message]
      customer_id = params[:customer_id]
      customer_name = params[:customer_name]

      customer = customer_id.present? ? Customer.find(customer_id) : Customer.create(name: customer_name)

      msg = Message.create(customer: customer, body: msg_body)
      return redirect_to test_customers_path, notice: "Sent message #{msg.body} for customer #{customer.name} (id #{customer.id})"
    end
  end
end
