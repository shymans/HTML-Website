require 'nokogiri'
require 'open-uri'
@playerarray = []

File.open('nba_table.html', 'w') do |f|

  f.puts("<html>")
  f.puts("<head>")
  f.puts("<title>NBA Stats</title>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("<h1>Player Stats</h1>")
  f.puts("<table>")

  ["1", "41", "81", "121", "161", "201", "241", "281", "321", "361"].each do |url|  
    page = Nokogiri::HTML(open("http://espn.go.com/nba/statistics/player/_/stat/scoring-per-game/sort/avgPoints/qualified/false/count/#{url}"))

    players = page.css('tr')

    players.each do |player|
      cells = player.children

        @playerarray << {}
        @playerarray[-1][:playername] = cells[1].text
        @playerarray[-1][:team] = cells[2].text
        @playerarray[-1][:gamesplayed] = cells[3].text
        @playerarray[-1][:minutespergames] = cells[4].text
        @playerarray[-1][:pointspergame] = cells[5].text
        @playerarray[-1][:fieldgoals] = cells[6].text
        @playerarray[-1][:fieldgoalpercent] = cells[7].text
        @playerarray[-1][:threepoints] = cells[8].text
        @playerarray[-1][:threepointpercent] = cells[9].text
        @playerarray[-1][:freethrows] = cells[10].text
        @playerarray[-1][:freethrowpercent] = cells[11].text

    end
  end

  @playerarray.each do |player|
    f.puts("<tr>")
    f.puts("<td>#{player[:playername]}</td>")
    f.puts("<td>#{player[:team]}</td>")
    f.puts("<td>#{player[:gamesplayed]}</td>")
    f.puts("<td>#{player[:minutespergames]}</td>")
    f.puts("<td>#{player[:pointspergame]}</td>")
    f.puts("<td>#{player[:fieldgoals]}</td>")
    f.puts("<td>#{player[:fieldgoalpercent]}</td>")
    f.puts("<td>#{player[:threepoints]}</td>")
    f.puts("<td>#{player[:threepointpercent]}</td>")
    f.puts("<td>#{player[:freethrows]}</td>")
    f.puts("<td>#{player[:freethrowpercent]}</td>")
    f.puts("</tr>")
  end

  f.puts("</table>")
  f.puts("</body>")
  f.puts("</html>")


end

