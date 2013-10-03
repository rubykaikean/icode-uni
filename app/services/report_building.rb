class ReportBuilder   

  def report_builder
    rb = ReportBuilder.new do
      text("2")
      section(:name=>"Section 1") do
        table(:name=>"Table", :header=>%w{id name}) do
          row([1,"John"])
        end
      end
      preformatted("Another Text")
    end
    rb.name="Html output"
    puts rb.to_html

  end
end
