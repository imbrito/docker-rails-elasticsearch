require 'spec_helper'

RSpec.describe Article, type: :model do
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
