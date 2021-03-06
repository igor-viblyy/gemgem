ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...
end

Rails.backtrace_cleaner.remove_silencers!

# TODO: make cleaner work with our stuff.
# require 'database_cleaner'
# DatabaseCleaner.strategy = :transaction
class MiniTest::Spec
  # before :each do
  #   DatabaseCleaner.start
  # end
  after :each do
    # DatabaseCleaner.clean
    User.delete_all

  end

  def upload(name="vb.jpg")
    tmp = Tempfile.new("bla")
    tmp.write File.open("test/fixtures/#{name}").read

    ActionDispatch::Http::UploadedFile.new(
    :tempfile => tmp,
    :filename => name,
    :type     => "image/png")
  end
end

module MonbanMockToBePushedIntoGem
  def warden
    @warden ||= begin
      manager = Warden::Manager.new(nil) do |config|
        config.merge! Monban.warden_config
      end
      # changed from @request to request.
      request.env['warden'] = Warden::Proxy.new(request.env, manager)
    end
  end
end