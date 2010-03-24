# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_qonda_session',
  :secret      => 'c1a9d9ccaefd0e5cd1f255db03b308ad464417bbf5d4b1b0b27f50cf4972a61512354fdaa8b08b10998267ddd0650812a6a377f30d260c3b39bde171242c2f38'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
