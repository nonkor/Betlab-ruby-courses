system 'echo "5"'

$?.success? # => true
$CHILD_STATUS.success? # => undefined method `success?' for nil:NilClass (NoMethodError)

require 'English'

$?.success? # => true
$CHILD_STATUS.success? # => true

system 'open text.text'

$?.success? # => false
$CHILD_STATUS.success? # => false

raise 'bash command failed' unless $CHILD_STATUS.success?
