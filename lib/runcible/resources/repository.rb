# Copyright (c) 2012 Eric D Helms
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require './lib/runcible/base'


module Runcible
  module Pulp
    class Repository < Runcible::Base

      def self.path(id=nil)
        (id == nil) ? "repositories/" : "repositories/#{id}/" 
      end

      def self.create(id, optional={})
        required = required_params(binding.send(:local_variables), binding)
        call(:post, path, :payload => { :required => required })
      end

      def self.retrieve(id, query={})
        call(:get, path(id), :params => query)
      end

      def self.update(id, optional={})
        call(:put, path(id), :payload => { :delta => optional })
      end

      def self.delete(id)
        call(:delete, path(id))
      end

      def self.retrieve_all(optional={})
        call(:get, path, :payload => { :optional => optional })
      end

      def self.search(criteria)
        required = required_params(binding.send(:local_variables), binding)
        call(:post, path("search"), :payload => { :required => required })
      end

    end
  end
end