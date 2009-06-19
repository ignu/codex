# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_codez_session',
  :secret      => '9fc8bbe0e52492629042ce3f1b0941aecf05aa100b453a752199b5739028d9eca026e2dbffba09cb90e171b9f9c85c12df21dc074de0eac3f3e34e5fcd792e06'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
