require 'spec_helper'

describe Speaker do 
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}

  it { should have_many :speeches }
  it { should have_many(:lines).through :speeches }
  it { should have_many(:scenes).through :speeches }

  it 'calls longest_speech' do 
    speakers = Speaker.all
    speakers.each do |speaker|
      expect(speaker.longest_speech).to be_instance_of(Sppech)
    end
  end

  it 'calls scene_percent' do 
    speakers = Speaker.all 
    speakers.each do |speaker|
      expect(speaker.scence_percent).to be_instance_of(String)
    end
  end
end