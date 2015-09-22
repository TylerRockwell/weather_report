class LocationParser

  attr_reader :city, :state

  def get_type(input)
    abv_regex = /[a-zA-Z ]{1,22}, [A-Z]{2}/     #Matches 'Durham, NC' format
    full_regex = /[a-z ]{1,22}, [a-z ]{4,13}/i  #Matches 'Durham, North Carolina' format
    zip_regex = /\d{5}/                         #Matches zip codes

    #Determine format of input and convert it into something useful
    if full_regex.match(input)
      @city = input.split(',')[0]
      @state = get_abbreviation(input.split(',')[1])
    elsif abv_regex.match(input)
      @city = input.split(',')[0]
      @state = input.split(',')[1]
    elsif zip_regex.match(input)
      @zip = input
      "zip"
    end
  end

  def get_abbreviation(state_name)
    state_name = state_name[1..-1] #Remove leading space
    state_hash = {"Alabama" => "AL", "Alaska" => "AK", "Arizona" => "AZ", "Arkansas" => "AR",
    "California" => "CA", "Colorado" => "CO", "Connecticut" => "CT",
    "Delaware" => "DE", "Florida" => "FL", "Georgia" => "GA", "Hawaii" => "HI",
    "Idaho" => "ID", "Illinois" => "IL", "Indiana" => "IN", "Iowa" => "IA",
    "Kansas" => "KS", "Kentucky" => "KY", "Louisiana" => "LA", "Maine" => "ME",
    "Maryland" => "MD", "Massachusetts" => "MA", "Michigan" => "MI",
    "Minnesota" => "MN", "Mississippi" => "MS", "Missouri" => "MO",
    "Montana" => "MT", "Nebraska" => "NE", "Nevada" => "NV", "New Hampshire" => "NH",
    "New Jersey" => "NJ", "New Mexico" => "NM", "New York" => "NY",
    "North Carolina" => "NC", "North Dakota" => "ND", "Ohio" => "OH",
    "Oklahoma" => "OK", "Oregon" => "OR", "Pennsylvania" => "PA", "Rhode Island" => "RI",
    "South Carolina" => "SC", "South Dakota" => "SD", "Tennessee" => "TN",
    "Texas" => "TX", "Utah" => "UT", "Vermont" => "VT", "Virginia" => "VA",
    "Washington" => "WA", "West Virginia" => "WV", "Wisconsin" => "WI",
    "Wyoming" => "WY"}

    state_hash[state_name]
  end
end
