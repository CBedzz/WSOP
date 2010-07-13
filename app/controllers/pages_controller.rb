require 'open-uri'

class PagesController < ApplicationController
  def home
    url = 'http://www.pokernews.com/live-reporting/2010-wsop/main-event/chips.htm'
    doc = Nokogiri::HTML.parse(open(url))

    @categories = %w[Level Blinds Ante Remaining_Players Total_Entries Average_Stack]
    @info = []
    doc.xpath('//dd//dd').each do |data|
      @info << data.inner_text.to_s
    end
    @avg = (@info[4].to_f / @info[3].to_f * 30000).to_i

    data_array = []
    doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "numeric", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)] | //*[(@id = "chipsCountEntries")]//td[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]').each do |data|
      data_array << data.inner_text.strip
    end

    len = data_array.length
    player_count = 0
    @player = []
    @chips = []

    (0..len).step(2) do |x|
      @player[player_count] = data_array[x]
      @chips[player_count] = data_array[x+1]
      player_count +=1
    end

    jeff = @player.index("Jeff Heiberg")
    begin
      @note = "#{jeff+1} -- Jeff Heiberg -- #{@chips[jeff]}"
    rescue
      @note = "Jeff's chipcount not listed...stay tuned!"
    end
    @commentary = []
    @commentary[0] = "NOTES ON JEFF: 100 players from the money! It's either time to hang on for dear life to get your 19 grand"
    @commentary[1] = "or time to go get some chips to go for the real money! No word from Jeff, he had over 100,000 at 4:00 Vegas time.."
  end
end
