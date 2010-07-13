# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_WSOPRails_session',
  :secret      => '5e5ff6d92a02d602a29d297ac8d5ab059f6917eaff7141903122cab3eea4bbf8400714f14a29b5d6dfa6385822097ae41af6f6653f4f5755ae7e798ff8470320'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
