FROM emergency_image

# Setup environment
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

# You should run the following commands manually on first setup
# $ rake db:migrate
# $ rake db:seed
# $ rake searchkick:reindex:all
