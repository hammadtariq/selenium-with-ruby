require_relative '../../libs/ssimata.api'
require 'json'

Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Given "I login using a valid account $email and $password" do |email, password|
  # Some Ruby code here
  response = SSIMATAAPI.login(email, password)
  expect(response.code).to eq(200)

  @account = JSON.parse(response.body)
  expect(@account['success']).to eq(true)
end

When "I login using an invalid account $email and $password" do |email, password|
  # Some Ruby code here
  response = SSIMATAAPI.login(email, password)
  expect(response.code).to eq(200)

  @account = JSON.parse(response.body)
  expect(@account['success']).to eq(false)
end

Then(/^login should fail$/) do
  expect(@account['success']).to eq(false)
end

When("I request for all projects") do

  response = SSIMATAAPI.getProjects()
  expect(response.code).to eq(200)

  @projects = JSON.parse(response.body)
end

Then("I should see $n projects") do |n|
  expect(@projects['total']).to eq(n)
end
