require 'factory_bot_rails'
require 'faker'

# Load FactoryBot factories
FactoryBot.reload

# Generate 10 users
10.times do
  FactoryBot.create(:user)
end
