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
          one_result.date = mypage.headers['date']
          one_result.server = mypage.headers['server']
          one_result.content_length = mypage.headers['content-length']||""
          one_result.connection_type = mypage.headers['connection']||""


          one_result.out_links_number = mypage.links.count


          @task.results << one_result
        end

      end
    end

  end

end
