module ApplicationHelper

  def tag_parser(names_string)
    # split user-inputted tags string
    # iterate over comma-seperated list of tags
    # create tag for each
    names_array = names_string.split(",")
    names_array.map do |name|
      Tag.new(name: name)
    end
  end

end
