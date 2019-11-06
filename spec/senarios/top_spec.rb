describe 'top' do
  before do
    visit '/'
  end

  it { expect(page).to have_title 'Google' }
end
