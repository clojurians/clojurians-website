# clojurians-website
The website for the Clojurians Slack Community

# Refreshing the Slack Join URL
Set the SLACK_JOIN_URL environment variable in Netlify
under "Projects" > "clojurians.net" > "Environment variables".
Alternatively, do it via CLI: `netlify env:set SLACK_JOIN_URL '...'`.

After doing that, hit "Trigger deploy" or run `netlify deploy --prod`.
