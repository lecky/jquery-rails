module Jquery
  module Rails
    class Railtie < ::Rails::Railtie

      config.before_configuration do
        require "jquery-rails/assert_select_jquery" if ::Rails.env.test?

        if ::Rails.root.join("public/javascripts/jquery-ui.min.js").exist?
          jq_defaults = %w(jquery jquery-ui)
          jq_defaults.map!{|a| a + ".min" } if ::Rails.env.production?
        else
          jq_defaults =  %w(https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js)
        end

        config.action_view.javascript_expansions[:defaults] = jq_defaults + %w(rails)
      end

    end
  end
end
