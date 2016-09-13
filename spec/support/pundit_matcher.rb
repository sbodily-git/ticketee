RSpec::Matchers.define :permit_action do |the_action|
  match do |the_policy|
    the_policy.public_send("#{the_action}?")
  end # match
  
  failure_message do |the_policy|
    "#{the_policy.class} does not allow #{the_policy.user || "nil"} to " +
      "perform #{the_action}? on #{the_policy.record}."
  end # failure_message
  
  failure_message_when_negated do |the_policy|
    "#{the_policy.class} does not forbid #{the_policy.user || "nil"} from " +
      "performing :#{the_action}? on #{the_policy.record}."
  end # failure_message_when_negated
  
end # Matchers