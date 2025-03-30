# frozen_string_literal: true

RSpec.describe BattleNetClient do
  it 'has a version number' do
    expect(BattleNetClient::VERSION).not_to be_nil
  end
end
