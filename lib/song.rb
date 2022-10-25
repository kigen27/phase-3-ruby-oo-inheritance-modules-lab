require 'pry'
require_relative './Memorable'
class Song
  attr_accessor :name, :artist

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  @@songs = []

  def initialize
    @@songs << self
  end

  def self.find_by_name(name)
    @@songs.detect { |a| a.name == name }
  end

  def self.all
    @@songs
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end