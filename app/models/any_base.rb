#!/usr/bin/ruby
module AnyBase
  base28 = ([*0..9,*'a'..'z'] - %w[a e i o u 0 1 3]).join
  base49 = ([*0..9,*'a'..'z',*'A'..'Z'] - %w[a e i o u A E I O U 0 1 3]).join
  ENCODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.with_index.to_a.map(&:reverse) ]
  end
  DECODER = Hash.new do |h,k|
    h[k] = Hash[ k.chars.map.with_index.to_a ]
  end
  def self.encode( value, keys )
    ring = ENCODER[keys]
    base = keys.length
    result = []
    until value == 0
      result << ring[ value % base ]
      value /= base
    end
    result.reverse.join
  end
  def self.decode( string, keys )
    ring = DECODER[keys]
    base = keys.length
    string.reverse.chars.map.with_index.inject(0) do |sum,(char,i)|
      sum + ring[char] * base**i
    end
  end
end