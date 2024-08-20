# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

# pin 'autoprefixer'
# pin 'bootstrap-icons'
# pin 'nodemon'
# pin 'sass'

# "autoprefixer": "^10.4.14",
# "bootstrap-icons": "^1.10.5",
# "esbuild": "^0.18.8",
# "nodemon": "^2.0.22",
# "postcss": "^8.4.24",
# "postcss-cli": "^10.1.0",
# "sass": "^1.63.6"
