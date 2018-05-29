class AccTest
  public
  def pub 
    puts "aaaa"
  end

  private

  def priv
    puts "bbb"
  end
end

acc = AccTest.new
acc.pub
acc.priv
