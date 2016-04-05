require 'rouge'
module Rouge
  module Lexers
    class Nodejs < Rouge::Lexers::Javascript
      tag 'nodejs'
    end
  end
end