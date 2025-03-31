# frozen_string_literal: true

RSpec.describe BattleNetClient::Models::Achievement do
  it 'requires the attributes to be defined' do
    expect { described_class.new(id: 1, name: 'Test Achievement') }.not_to raise_error
  end
end
