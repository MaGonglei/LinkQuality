class Task < ActiveRecord::Base

  validates :urls,  :presence => true

  validate :check_urls_input

  has_many :results ,:dependent => :destroy

  def check_urls_input
    self.urls.split.each do |url|
      errors.add(:urls,"#{url} not match the url type!") unless  url.match %r|^https?://.*\.*$|
    end
  end


  # Use anemone crawl web
  def check_url
    @task = self

    @task.results.clear

    anemoneOptions = {:threads => @task.threads,:depth_limit => @task.depth_limit,:crawl_subdomains => @task.subdomains }

    @task.urls.split.each do |crawl_url|

      Anemone.crawl(crawl_url, anemoneOptions ) do |anemone|

        anemone.on_every_page do |mypage|

          one_result = @task.results.build
          the_doc = mypage.doc
          one_result.url = mypage.url.to_s
          one_result.code = mypage.code
          one_result.depth = mypage.depth
          one_result.referer = mypage.referer.to_s
          one_result.content_type = mypage.content_type
          one_result.response_time = mypage.response_time
          one_result.title = the_doc.title unless the_doc.nil?
          one_result.headers = mypage.headers
          one_result.out_links_number = mypage.links.count
          unless the_doc.nil?
            the_links =  the_doc.xpath("//a")
            one_result.links = " "
            the_links.each do |link|
              one_result.links << "url:#{link['href']} line:#{link.line}  text:#{link.text} \n"
            end
          end
          @task.results << one_result
        end
      end
    end

  end

end
