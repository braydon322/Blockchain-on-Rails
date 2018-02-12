require 'digest'
require 'awesome_print'
require 'pry'

class Block

  BLOCKCHAIN = []

  attr_reader :index
  attr_reader :currentTime
  attr_reader :data
  attr_reader :previousBlock
  attr_reader :scrambled


  def initialize(index, data, previousBlock)
    @index = index
    @currentTime = Time.now
    @data = data
    @previousBlock = previousBlock
    @scrambled = scrambleData
    BLOCKCHAIN << self
  end

  def scrambleData
    blockHash = Digest::SHA256.new
    blockHash.update( @index.to_s + @currentTime.to_s + @data + @previousBlock )
    blockHash.hexdigest
  end

  def self.genesis( data="Genesis")
    genesis = Block.new( 0, "GENESIS", "N/A")
  end

  def self.addBlock(previousBlock)
    Block.new( (previousBlock.index + 1), "Transaction Data...", previousBlock.scrambled )
  end

  def self.chain
    return BLOCKCHAIN
  end

end
