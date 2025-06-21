# Pin npm packages by running ./bin/importmap
pin "application"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
pin "@hotwired/turbo-rails", to: "turbo-rails"
pin_all_from "app/javascript/controllers", under: "controllers"