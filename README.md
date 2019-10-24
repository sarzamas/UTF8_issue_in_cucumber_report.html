# UTF8_issue_in_cucumber_report.html


1. This is repo one can clone for error reproduction on remote machine:
----------------------------------------------------------------------------------
issue description on github: https://github.com/cucumber/cucumber-ruby/issues/1300

2. A single command to be ran cucumber:
------------------------------------------------
2.1 - Update dependencies:
$ bundle update

2.2 - Launch cucumber: (no need to attach any device or emulator)
$ bundle exec cucumber -t @smoke -p android_dev_usb -f pretty --expand -f html -o test_report/report.html

NOTICE!
- never mind errors in execution log like:
adb: error: device 'PL2GAR98' not found
- its because no need to attach any device or emulator

3. An observable failure:
----------------------------
look at genegated report.html in folder ~/UTF8_issue_in_cucumber_report.html/test_report/
and found in it error like:

invalid byte sequence in UTF-8 (ArgumentError)
-1# Couldn't get snippet for 

NOTICE!
if error is not present for some reason - one can check as of my own run in file report_error.html in same folder



4. Workaround to solve error:
 ---------------------------------
 
 To escape error with UTF8 one should:

4.1 add two empty lines in step_definition file after this line 
 ./features/step_definitions/MyAlarm_steps.rb:2

4.2 run Launch cucumber command again and look after generated report.html

NOTICE!
- one can check solution as of my own run in file report_NO_error.html in same folder


5. Environment:
------------------

macOS 10.13.6 High Sierra
language: default (en)
i use Default Gherkin predicates in en but write instructions on my native lang - that works fine except html report


$ cucumber --version
3.1.2

$ ruby --version 
ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin17]

$ gem list

*** LOCAL GEMS ***

activesupport (4.2.11.1)
addressable (2.7.0, 2.6.0, 2.3.8)
algoliasearch (1.27.1)
atomos (0.1.3)
awesome_print (1.8.0)
babosa (1.0.2)
backports (3.15.0)
bigdecimal (default: 1.4.1)
builder (3.2.3)
bundler (2.0.1, default: 1.17.2)
bundler-unload (1.0.2)
calabash-android (0.9.12, 0.9.9)
calabash-cucumber (0.21.10)
CFPropertyList (3.0.1, 3.0.0)
childprocess (1.0.1)
claide (1.0.3, 1.0.2)
clipboard (1.3.3)
cmath (default: 1.0.0)
cocoapods (1.8.4, 1.8.3, 1.8.1, 1.7.5, 1.7.1, 1.7.0, 1.6.2)
cocoapods-core (1.8.4, 1.8.3, 1.8.1, 1.7.5, 1.7.1, 1.7.0, 1.6.2)
cocoapods-deintegrate (1.0.4)
cocoapods-downloader (1.2.2)
cocoapods-plugins (1.0.0)
cocoapods-search (1.0.0)
cocoapods-stats (1.1.0)
cocoapods-trunk (1.4.1, 1.3.1)
cocoapods-try (1.1.0)
colored (1.2)
colored2 (3.1.2)
command_runner_ng (0.1.4)
commander-fastlane (4.4.6)
concurrent-ruby (1.1.5)
csv (default: 3.0.2)
cucumber (3.1.2)
cucumber-core (3.2.1)
cucumber-expressions (6.0.1)
cucumber-tag_expressions (1.1.1)
cucumber-wire (0.0.1)
date (default: 1.0.0)
dbm (default: 1.0.0)
declarative (0.0.10)
declarative-option (0.1.0)
did_you_mean (1.3.0)
diff-lcs (1.3)
digest-crc (0.4.1)
domain_name (0.5.20190701, 0.5.20180417)
dotenv (2.7.2)
e2mmap (default: 0.1.0)
edn (1.1.1)
emoji_regex (1.0.1)
encryptor (3.0.0)
escape (0.0.4)
etc (default: 1.0.1)
excon (0.64.0)
executable-hooks (1.6.0)
faraday (0.15.4)
faraday-cookie_jar (0.0.6)
faraday_middleware (0.13.1)
fastimage (2.1.5)
fastlane (2.123.0)
fcntl (default: 1.0.0)
fiddle (default: 1.0.0)
fileutils (default: 1.1.0)
forwardable (default: 1.2.0)
fourflusher (2.3.1, 2.3.0, 2.2.0)
fuzzy_match (2.0.4)
gem-wrappers (1.4.0)
geocoder (1.5.2, 1.5.1)
gh_inspector (1.1.3)
gherkin (5.1.0)
google-api-client (0.23.9)
google-cloud-core (1.3.0)
google-cloud-env (1.0.5)
google-cloud-storage (1.16.0)
googleauth (0.6.7)
highline (1.7.10)
http-accept (1.7.0)
http-cookie (1.0.3)
httparty (0.17.1, 0.17.0, 0.16.2)
httpclient (2.8.3)
i18n (0.9.5)
io-console (default: 0.4.7)
ipaddr (default: 1.2.2)
irb (default: 1.0.0)
json (2.2.0, default: 2.1.0, 1.8.6)
jwt (2.2.1)
logger (default: 1.3.0)
luffa (2.1.0)
matrix (default: 0.1.0)
memoist (0.16.0)
mime-types (3.3, 3.2.2, 2.99.3)
mime-types-data (3.2019.1009, 3.2019.0904, 3.2019.0331)
mini_magick (4.5.1)
minitest (5.12.2, 5.11.3)
molinillo (0.6.6)
multi_json (1.14.1, 1.14.0, 1.13.1)
multi_test (0.1.2)
multi_xml (0.6.0)
multipart-post (2.1.1, 2.0.0)
mutex_m (default: 0.1.0)
nanaimo (0.2.6)
nap (1.1.0)
naturally (2.2.0)
net-telnet (0.2.0)
netrc (0.11.0)
openssl (default: 2.1.2)
os (1.0.1)
ostruct (default: 0.1.0)
plist (3.5.0)
power_assert (1.1.3)
prime (default: 0.1.0)
psych (default: 3.1.0)
public_suffix (4.0.1, 3.1.1, 3.1.0, 3.0.3, 2.0.5)
rake (13.0.0, 12.3.3, 12.3.2)
rdoc (default: 6.1.0)
representable (3.0.4)
require (0.2.7)
require_all (3.0.0, 2.0.0)
require_relative (1.0.3)
rest-client (2.1.0, 2.0.2, 1.6.7)
retriable (2.0.2)
rexml (default: 3.1.9)
rouge (2.0.7)
rspec (3.8.0)
rspec-core (3.8.0)
rspec-expectations (3.8.3)
rspec-mocks (3.8.0)
rspec-support (3.8.0)
rss (default: 0.2.7)
ruby-macho (1.4.0)
rubygems-bundler (1.4.5)
rubyzip (1.2.4, 1.2.3, 1.2.2)
run_loop (4.4.2, 4.4.1, 4.3.0, 4.2.2)
rvm (1.11.3.9)
scanf (default: 1.0.0)
sdbm (default: 1.0.0)
security (0.1.3)
selenium-webdriver (3.142.2)
shell (default: 0.7)
signet (0.11.0)
simctl (1.6.5)
slack-notifier (2.3.2)
slowhandcuke (0.0.3)
stringio (default: 0.0.2)
strscan (default: 1.0.0)
sync (default: 0.5.0)
syntax (1.2.2)
teamcity_formatter (0.8.3)
terminal-notifier (2.0.0)
terminal-table (1.8.0)
test-unit (3.2.9)
testrail (0.0.1)
thor (0.20.3)
thread_safe (0.3.6)
thwait (default: 0.1.0)
tiny_tds (2.1.2)
tracer (default: 0.1.0)
tty-cursor (0.6.1)
tty-screen (0.7.0)
tty-spinner (0.9.0)
tzinfo (1.2.5)
uber (0.1.0)
unf (0.1.4)
unf_ext (0.0.7.6)
unicode-display_width (1.6.0)
unirest (1.1.2, 1.0.8)
webrick (default: 1.4.2)
word_wrap (1.0.0)
xamarin-test-cloud (2.3.0, 2.2.0)
xcodeproj (1.13.0, 1.12.0, 1.9.0)
xcpretty (0.3.0)
xcpretty-travis-formatter (1.0.0)
xmlrpc (0.3.0)
zlib (default: 1.0.0)

