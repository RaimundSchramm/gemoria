require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    let!(:mund) { create :mund, email: 'mund@test.com' }
    let(:mail) { UserMailer.password_reset(mund) }

    before { mund.stub(:password_reset_token).and_return 1 }

    it "renders the headers" do
      expect(mail.subject).to eq 'Password Reset'
      expect(mail.to.first).to eq mund.email
      expect(mail.from.first).to eq 'gemoria.com'
    end

    it "renders the body" do
      to_be_fixtured = "http://localhost:3000/password_resets/1/edit"

      expect(mail.body.encoded).to match to_be_fixtured
    end
  end

end
