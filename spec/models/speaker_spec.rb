require 'spec_helper'

describe Speaker do 
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}

  it { should have_many :speeches }
  it { should have_many(:lines).through :speeches }
  it { should have_many(:scenes).through :speeches }
end
