RSpec::Matchers.define :allow_access_to do |*args|
  match do |permission|
    expect(permission.allow?(*args)).to be_truthy
  end

  description do
    "allow access to #{args}"
  end

  failure_message do
    "expected access to be granted for #{ args[0] + '#' + args[1] }"
  end

  failure_message_when_negated do
    "expected access NOT to be granted for #{ args[0] + '#' + args[1] }"
  end
end
