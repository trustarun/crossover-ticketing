class ReportPdf < Prawn::Document
  def initialize(tickets)
    super()
    @tickets = tickets
    header
    text_content
    table_content
  end

  def header
    # This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/crossover-headr.png", width: 530, height: 50
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], width: 530, height: 50) do
      text 'List of tickets raised by user', size: 15, style: :bold
    end
  end

  def table_content
    # This makes a call to ticket_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table ticket_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = %w(DDDDDD FFFFFF)
      self.column_widths = [50, 100, 130, 100, 70, 80]
    end
  end

  def ticket_rows
    [%w(Id Title Description Category Priority Status)] +
      @tickets.map do |ticket|
        [ticket.id, ticket.title, ticket.description, ticket.category.name, ticket.priority.name, ticket.status.name]
      end
  end
end
