# frozen_string_literal: true

RSpec.describe BattleNetClient::Client, :vcr do
  subject(:client) { described_class.new }

  describe '#achievements' do
    # This is a test token, and needs to be regenerated once the recorded VCR
    # cassettes are deleted. Use the ClientID and Client secret on the official
    # documentation page to generate a new token.
    let(:access_token) { 'USuiosqMobTyIawrmkMoWE47n3yMm2Kvr7' }

    context 'when the client is configured' do
      before { client.region = 'eu' }

      it 'returns a list of achievements' do
        expect(client.achievements(access_token:)).not_to be_empty
      end
    end

    context 'when an incorrect access token is used' do
      before { client.region = 'eu' }

      it 'returns an empty array' do
        expect(client.achievements(access_token: nil)).to(be_empty)
      end
    end
  end
end
