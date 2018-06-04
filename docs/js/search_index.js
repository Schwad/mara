var search_data = {"index":{"searchIndex":["botutils","checklocationstaleness","checktheweather","datapoint","handleanycommands","inspectmessagevalidity","managemessage","marabot","petitionforinfo","recorddatapoint","thanktheuser","updateuserlocation","user","verifyuser","visitorscontroller","weather","call()","call()","call()","call()","call()","call()","call()","call()","call()","index()","new()","perform()","ping_user()","send_user_custom_message()","readme","manifest.js","application.js","cable.js","application.css.scss","base.scss","test.scss","mara.rake","rdoc.rake","scheduler.rake"],"longSearchIndex":["botutils","checklocationstaleness","checktheweather","datapoint","handleanycommands","inspectmessagevalidity","managemessage","marabot","petitionforinfo","recorddatapoint","thanktheuser","updateuserlocation","user","verifyuser","visitorscontroller","weather","checklocationstaleness#call()","checktheweather#call()","handleanycommands#call()","inspectmessagevalidity#call()","petitionforinfo#call()","recorddatapoint#call()","thanktheuser#call()","updateuserlocation#call()","verifyuser#call()","visitorscontroller#index()","marabot::new()","marabot#perform()","marabot#ping_user()","marabot#send_user_custom_message()","","","","","","","","","",""],"info":[["BotUtils","","classes/BotUtils.html","","<p>This is the home for generic bot utilities extracted from MaraBot as\nconcerns.\n"],["CheckLocationStaleness","","classes/CheckLocationStaleness.html","","<p>If the user&#39;s location data has gotten stale, reject if fully stale or\nwarn if somewhat stale.\n"],["CheckTheWeather","","classes/CheckTheWeather.html","","<p>Pulls in weather information from the WeatherUnderground integration. Fails\nif API fails.\n"],["DataPoint","","classes/DataPoint.html","","<p>This stores the realtime pain data against weather. Often used data is\naccessed via the accessors associated …\n"],["HandleAnyCommands","","classes/HandleAnyCommands.html","","<p>This is the interactor that terminates the message management process and\nprocesses any commands (if …\n"],["InspectMessageValidity","","classes/InspectMessageValidity.html","","<p>Ensures that the submitted message is valid.\n"],["ManageMessage","","classes/ManageMessage.html","","<p>Primary message management organizer interactor used within MaraBot\n"],["MaraBot","","classes/MaraBot.html","","<p>The primary interfact with which the application interacts with the\ntelegram api via the telegram_bot …\n"],["PetitionForInfo","","classes/PetitionForInfo.html","","<p>Interactor that petitions users for pain reading information.\n"],["RecordDataPoint","","classes/RecordDataPoint.html","","<p>The final interactor in the process if all has passed. Records the data\npoint and corresponding information …\n"],["ThankTheUser","","classes/ThankTheUser.html","","<p>Issues a response to the user at the end of the process.\n"],["UpdateUserLocation","","classes/UpdateUserLocation.html","","<p>If the new message contains location data, updates it against the user.\nAlso terminates the message, …\n"],["User","","classes/User.html","","<p>The main user object, although built up under a typical\n&#39;Devise-style&#39; framework, this will primarily …\n"],["VerifyUser","","classes/VerifyUser.html","","<p>Interactor object that runs at the front of the `ManageMessage` interactor,\nensuring that all handled …\n"],["VisitorsController","","classes/VisitorsController.html","","<p>This class handles public-facing GET requests on any web-ui elements built\nfor the application.\n"],["Weather","","classes/Weather.html","","<p>Model used as a Ruby wrapper for the API response of weather underground\n"],["call","CheckLocationStaleness","classes/CheckLocationStaleness.html#method-i-call","()",""],["call","CheckTheWeather","classes/CheckTheWeather.html#method-i-call","()",""],["call","HandleAnyCommands","classes/HandleAnyCommands.html#method-i-call","()",""],["call","InspectMessageValidity","classes/InspectMessageValidity.html#method-i-call","()",""],["call","PetitionForInfo","classes/PetitionForInfo.html#method-i-call","()",""],["call","RecordDataPoint","classes/RecordDataPoint.html#method-i-call","()",""],["call","ThankTheUser","classes/ThankTheUser.html#method-i-call","()",""],["call","UpdateUserLocation","classes/UpdateUserLocation.html#method-i-call","()",""],["call","VerifyUser","classes/VerifyUser.html#method-i-call","()",""],["index","VisitorsController","classes/VisitorsController.html#method-i-index","()","<p>The root path of the application web-ui.\n"],["new","MaraBot","classes/MaraBot.html#method-c-new","()","<p>Instantiates the bot variable as a new Telegram bot.\n"],["perform","MaraBot","classes/MaraBot.html#method-i-perform","()","<p>Runs the bot, it must always be running &#39;live&#39; on its own\nprocess/worker in order to receive …\n"],["ping_user","MaraBot","classes/MaraBot.html#method-i-ping_user","(user)","<p>Pings the user to request for new data inputs, called in a rake task and\ncalled via a scheduler.\n<p>The pings …\n"],["send_user_custom_message","MaraBot","classes/MaraBot.html#method-i-send_user_custom_message","(user, message)","<p>This is a utility to allow for MaraBot to quickly send customized messages\nto specified approved users. …\n"],["README","","files/README_md.html","","<p>Mara <img src=\"https://badges.gitter.im/gitterHQ/gitter.png\">\n<p><img\nsrc=\"https://api.codeclimate.com/v1/badges/a6cec7ae312fd71a8383/maintainability\">\n…\n"],["manifest.js","","files/app/assets/config/manifest_js.html","","<p>//= link_tree ../images //= link_directory ../javascripts .js //=\nlink_directory ../stylesheets .css …\n"],["application.js","","files/app/assets/javascripts/application_js.html","","<p>// This is a manifest file that&#39;ll be compiled into application.js,\nwhich will include all the files …\n"],["cable.js","","files/app/assets/javascripts/cable_js.html","","<p>// Action Cable provides the framework to deal with WebSockets in Rails. //\nYou can generate new channels …\n"],["application.css.scss","","files/app/assets/stylesheets/application_css_scss.html","","<p>@import “bootstrap-sprockets”;\n<p>// Import variables\n<p>// Import bootstrap @import “bootstrap”; …\n"],["base.scss","","files/app/assets/stylesheets/base_scss.html","","<p>// // make all images responsive by default // img { //   @extend\n.img-responsive; //   margin: 0 auto; …\n"],["test.scss","","files/app/assets/stylesheets/test_scss.html","","<p>.test-class {\n\n<pre><code>color: blue;</code></pre>\n<p>}\n"],["mara.rake","","files/lib/tasks/mara_rake.html","","<p>namespace :mara do\n\n<pre><code>desc &#39;initializes mara bot&#39;\ntask start: :environment do\n  MaraBot.perform_async\nend ...</code></pre>\n"],["rdoc.rake","","files/lib/tasks/rdoc_rake.html","","<p>require &#39;sdoc&#39; require &#39;rdoc/task&#39;\n<p>RDoc::Task.new do |rdoc|\n\n<pre><code>rdoc.rdoc_dir = &#39;docs&#39;\nrdoc.generator ...</code></pre>\n"],["scheduler.rake","","files/lib/tasks/scheduler_rake.html","","<p>namespace :scheduled do\n\n<pre><code>task ping_users: :environment do\n  # Currently randomly samples every four hours ...</code></pre>\n"]]}}