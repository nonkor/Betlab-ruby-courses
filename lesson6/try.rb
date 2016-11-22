x = [nil, 'two words']

x.each { |i| p i&.split } # =>
# nil
# ["two", "words"]
