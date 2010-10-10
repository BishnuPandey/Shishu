# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Shishu_session',
  :secret      => 'c431fa4218c07b10bf46c1ad9978b47c42d298d2d4c41f04bbeba34527030b49cb13aef214c16b622ea3a177cfd79808182f073a5082ec910d94fd7f6ec226ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
