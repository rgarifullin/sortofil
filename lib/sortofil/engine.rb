module Sortofil
  # Use assets pipeline
  class Engine < ::Rails::Engine
    initializer 'Sortofil precompiled assets', group: :all do |app|
      app.config.assets.precompile += %w[filter_restore.js]
    end
  end
end
