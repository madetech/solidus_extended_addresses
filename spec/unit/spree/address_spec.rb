describe Spree::Address do
  let(:address) { create(:address) }

  subject { address.full_name }

  it { is_expected.to eq('Mr John Doe') }
end
