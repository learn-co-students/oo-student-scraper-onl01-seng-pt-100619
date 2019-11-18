require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative '../lib/student.rb'

class Scraper 
  
  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
        students = [] 
        
    index_page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        name = student.css(".student-name").text 
        location = student.css(".student-location").text 
        profile_url = student.attributes["href"].value 
            student_hash = {
                :name => name,
                :location => location, 
                :profile_url => profile_url 
            }
               students << student_hash 
      end 
    end 
    students 
  end 
     
  def self.scrape_profile_page(profile_url)
    attributes = {} 
    
    profile_page = Nokogiri::HTML(open(profile_url)) 
        
    profile_page.css(".social-icon-container a").each do |profile|
      link = profile.attributes["href"].value 
          if link.include?("twitter") 
            attributes[:twitter] = profile.attributes["href"].value 
          elsif link.include?("linkedin")
            attributes[:linkedin] = profile.attributes["href"].value 
          elsif link.include?("github")
            attributes[:github] = profile.attributes["href"].value 
          else 
            attributes[:blog] = profile.attributes["href"].value
          end 
    end 

        attributes[:profile_quote] = profile_page.css("div.profile-quote").text 
        attributes[:bio] = profile_page.css("div.bio_content div.description").text
  
      attributes  
    end  
    
  end    