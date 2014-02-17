# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Gemoria::Application.config.secret_token    = '652b9477d0873e4f8c7df6edabed3794d72ea06492926722ce9a51701f46ab89616ad8aa34fea75ef19175938d0333a98bbef653cf8e93105530036f06c1e08a'
Gemoria::Application.config.secret_key_base = '9c8fa4ff6e148703142f3d67544906bf91fb0f82d077cd8a45564c1f6b155663877e68470ce8614a5ffd1f0f73e8a5634f8945100d9afa274d6b88b0bafa691e'
