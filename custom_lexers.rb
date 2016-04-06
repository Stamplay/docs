require 'rouge'
module Rouge
  module Lexers
    class Nodejs < Rouge::Lexers::Javascript
    	tag 'nodejs'
    end
    class Node < Rouge::Lexers::Javascript
    	tag 'nodejs-always'
    end
    class JavaScript < Rouge::Lexers::Javascript
    	tag 'javascript-always'
    end
    class JavaScript < Rouge::Lexers::Javascript
    	tag 'shell-always'
    end
  end
end