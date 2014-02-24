RSpec::Matchers.define :allow_access_to do |*args|
  match do |permission|
    expect(permission.allow?(*args)).to be_true
  end

  description do
    "allow access to #{args}"
  end

  failure_message_for_should do
    "expected access to be granted for #{ args[0] + '#' + args[1] }"
  end

  failure_message_for_should_not do
    "expected access NOT to be granted for #{ args[0] + '#' + args[1] }"
  end
end
