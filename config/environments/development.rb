Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  ## GEOKIT CONFIG

  # These defaults are used in Geokit::Mappable.distance_to and in acts_as_mappable
  Geokit::default_units = :miles # others :kms, :nms, :meters
  Geokit::default_formula = :sphere

  # This is the timeout value in seconds to be used for calls to the geocoder web
  # services.  For no timeout at all, comment out the setting.  The timeout unit
  # is in seconds.
  Geokit::Geocoders::request_timeout = 3


  # This is your username key for geonames.
  # To use this service either free or premium, you must register a key.
  # See http://www.geonames.org
  Geokit::Geocoders::GeonamesGeocoder.key = Rails.application.secrets.geoname_key


  # Geonames has a free service and a premium service, each using a different URL
  # GeonamesGeocoder.premium = true will use http://ws.geonames.net (premium)
  # GeonamesGeocoder.premium = false will use http://api.geonames.org (free)
  Geokit::Geocoders::GeonamesGeocoder.premium = false

  # require "external_geocoder.rb"
  # Please see the section "writing your own geocoders" for more information.
  # Geokit::Geocoders::external_key = 'REPLACE_WITH_YOUR_API_KEY'

  # This is the order in which the geocoders are called in a failover scenario
  # If you only want to use a single geocoder, put a single symbol in the array.
  # Valid symbols are :google, :yahoo, :us, and :ca.
  # Be aware that there are Terms of Use restrictions on how you can use the
  # various geocoders.  Make sure you read up on relevant Terms of Use for each
  # geocoder you are going to use.
  Geokit::Geocoders::provider_order = [:google,:us]

  # Disable HTTPS globally.  This option can also be set on individual
  # geocoder classes.
  Geokit::Geocoders::secure = false

  # Control verification of the server certificate for geocoders using HTTPS
  Geokit::Geocoders::ssl_verify_mode = OpenSSL::SSL::VERIFY_NONE
  # Setting this to VERIFY_NONE may be needed on systems that don't have
  # a complete or up to date root certificate store. Only applies to
  # the Net::HTTP adapter.
end
