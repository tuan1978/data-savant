# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_data-savant_session',
  :secret      => 'ec5abd8c06116abd873e2d5956d890d4cd9b6a208ad2aa8a80be3783388a3e178fa9cc30bcc1c74f07c5fd9c3b395ec2192be4f8e8a3b9ca19d9544fc930f52f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
