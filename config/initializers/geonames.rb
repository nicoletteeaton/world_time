Timezone::Lookup.config(:geonames) do |c|
  c.username = Rails.application.secrets.geoname_key
end