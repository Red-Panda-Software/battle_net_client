# frozen_string_literal: true

RSpec.describe BattleNetClient::Client, :vcr do
  subject(:client) { described_class.new }

  describe '#access_token' do
    context 'when the client is configured' do
      before do
        client.client_id = ENV.fetch('BATTLE_NET_CLIENT_ID', nil)
        client.client_secret = ENV.fetch('BATTLE_NET_CLIENT_SECRET', nil)
      end

      it 'returns a valid access token object' do
        expect(client.access_token).to be_a(BattleNetClient::Models::AccessToken)
      end
    end

    context 'when the client is not configured' do
      before do
        client.client_id = nil
        client.client_secret = nil
      end

      it 'returns nil as access token' do
        expect(client.access_token).to be_nil
      end
    end

    context 'when the client is configured incorrectly' do
      before do
        client.client_id = 'wrong_client_id'
        client.client_secret = 'wrong_client_secret'
      end

      it 'returns nil as access token' do
        expect(client.access_token).to be_nil
      end
    end
  end
end
