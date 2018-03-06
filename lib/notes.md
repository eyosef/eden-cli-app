Notes to self; How to build a CLI gem

1. Plan your gem, imagine your interface, DONE
2. Start with the project structure - google, DONE
3. start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

1. User types articles
  - 'articles' initiates a file that executes the program [executable]
2. Program shows a numbered list of articles
  - I.e;
      - 1. <article title 1> by <author x> published on <date>
      - 2. <article title 2> by <author y> published on <date>
      - 3. ...etc...
3. Program puts "Which article do you want to read?"
  - Note to self =
      - will program select the article based on the number in the list? or based on name?
      - need to indicate such in, "Which article do you want to read?"

1. An article has; [UI]
  - Title
  - Author
  - Date of publication
  - link

./bin/cli-app require_relative "rube_cli_app"
