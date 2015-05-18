# A loop to read what the user types
# until the user types an empty line

$stdout.puts "Enter a blank line or Press Ctrl-D to exit."

$stdout.print "type a line: "

dont_stop = true

while ((line = $stdin.gets) && line.chomp! != '') || dont_stop  do
  $stdout.puts "you typed: " + line
  $stdout.print "type a line: "
end

$stdout.puts "bye!"
