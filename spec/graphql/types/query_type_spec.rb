# frozen_string_literal: true

RSpec.describe Types::QueryType do
  describe 'items' do
    subject(:result) do
      MartianLibrarySchema.execute(query).as_json
    end

    let!(:items) { create_pair(:item) }

    let(:query) do
      %(query {
        items {
          title
        }
      })
    end

    it 'returns all items' do
      expect(result.dig('data', 'items')).to match_array(
        items.map { |item| { 'title' => item.title } }
      )
    end
  end
end
