# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rsavin-it_session',
  :secret      => '64c812d44128309d49dfcf93c6a5ecd17868a732bbab4c57b3154ef068f68a3930ffe508356c5cb725a994aa9ec41b02adef74b9a0481794c79fe400b6a139cd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
