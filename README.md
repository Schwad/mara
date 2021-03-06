Mara [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/mara-bot/)
================
[![Maintainability](https://api.codeclimate.com/v1/badges/a6cec7ae312fd71a8383/maintainability)](https://codeclimate.com/github/Schwad/mara/maintainability)
[![Build Status](https://travis-ci.org/Schwad/mara.svg?branch=master)](https://travis-ci.org/Schwad/mara)
[![Coverage Status](https://coveralls.io/repos/github/Schwad/mara/badge.svg?branch=master)](https://coveralls.io/github/Schwad/mara?branch=master)
[![Inline docs](http://inch-ci.org/github/schwad/mara.svg?branch=master)](http://inch-ci.org/github/schwad/mara)

[Mara Slack](https://patagonia-mara.slack.com)

Discussion
-----------

This application commands a registered Telegram bot to interface with individuals for chronic pain tracking. [The bot is here.](t.me/RubyMaraBot.)

This primarily relies on the fantastic [telegram_bot](https://github.com/eljojo/telegram_bot) gem built by the wonderful @eljojo.

Ruby on Rails
-------------

This application requires:

- Ruby 2.4.4
- Rails 5.2.0

General Notes
---------------

MaraBot does not currently persist or 'remember' conversation state and history, although this is likely to change in the future.

The Bot is run as a background job with Sidekiq/Redis, and is initialized in the Procfile like so:

`web: rake mara:start && bundle exec rails server -p $PORT`

To work with MaraBot in development, you fire it up with `rake mara:reset` (kills any active bots and starts a new one). If you are going from scratch, this will likely involve booting your `redis-server`, then `sidekiq`, then `rake mara:reset`. __This implementation is likely to be revisited as we set up webhooks__

This application uses the Interactor design pattern ([implemented with the interactor gem](https://github.com/collectiveidea/interactor)) to process bot interactions.

For further background, here is an unofficial talk about this project given at [Isle of Ruby](https://2018.isleofruby.org/):

[![VIDEO](https://i.imgur.com/JKcG9qZ.png)](https://www.youtube.com/watch?v=Qf0S29bJbPg)

Webhook setup in development
----------------------------

The best way to use telegram bots long term is with webhooks. [You can read more about them here](https://medium.com/@xabaras/setting-your-telegram-bot-webhook-the-easy-way-c7577b2d6f72).

* Set environment variables for :bot_host (the ngrok url), :mara_bot_key and 'webhook_key'

* `rails s`

* `ngrok http 3000` (you will need ngrok)

Adding yourself as a user
-------------------------

This should happen immediately whenever someone contacts the bot. Again, in production this is meant to be a bot-only interface (except for analytics on our end). Hooking in, getting out, should be open for the user in the interactions with MaraBot.


Documentation and Support
-------------------------

Full documentation for this application is [available here](https://schwad.github.io/mara/). In development, update the documentation files with `rake rdoc`.

## Key technologies:

* DB: Postgres
* Front-end:
  - Bootstrap
  - JS
  - ERB
  - Turbolinks
* Coverage: Coveralls/simplecov
* Code quality:
  - Rubocop
  - Reek
  - Code Climate
* Background jobs:
  - Sidekiq
  - Redis ([with Heroku Redis](https://elements.heroku.com/addons/heroku-redis))
* Weather tracking: [Wunderground Gem](https://github.com/wnadeau/wunderground)
* Notable
  - [Interactor gem](https://github.com/collectiveidea/interactor)

Misc
----------

* Check how many hits to Wunderground API we are receiving [here](https://www.wunderground.com/weather/api/)


Contributing
------------

See CONTRIBUTORS.md


Credits
-------

Todo
-------

* Build out utility to store and track data results over time (users - strategies - accuracy - daily)
* Build out script to run in memory and write writeable data

License
-------

Copyright 2018 Nick Schwaderer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
