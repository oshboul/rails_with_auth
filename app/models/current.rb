class Current < ActiveSupport::CurrentAttributes
  attribute :user_authentication
  delegate :user, to: :user_authentication, allow_nil: true
end
