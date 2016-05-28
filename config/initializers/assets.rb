# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += [ 'viewer/bootswatch_yeti.css',
                                                'viewer/bootswatch_darkly.css',
                                                'viewer/bootswatch_flatly.css',
                                                'viewer/bootswatch_cyborg.css',
                                                'viewer/bootswatch_simplex.css']
