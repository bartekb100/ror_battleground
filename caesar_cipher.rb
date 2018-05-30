class CaesarCipher
  attr_accessor :args, :number
  def initialize(*args)
    self.args = *args
  end


  def perform
    if @args.size == 1
      rot_num(@args[0], 13).join
    elsif @args.size == 2
      rot_num(@args[0], @args[1].to_i).join
    end

    # if @args.size == 1
    #   # "Grfgbjl Grxfg"
    #   value = @args[0].downcase.tr!("abcdefghijklmnopqrstuvwxyz", "nopqrstuvwxyzabcdefghijklm")
    #   value = value.split(" ")
    #   value[0].capitalize!
    #   value[1].capitalize!
    #   value = value[0] + " " + value[1]
    # elsif @args.size == 2
    #   # args = @args
    #   # args[0]
    #   # rot(@args[0], @args[1].to_i)
    #   rot_num(@args[0], @args[1].to_i).join
    # end
  end

  private

  def rot_num(string, num = 13)
    alphabet  = Array('a'..'z')
    non_caps  = Hash[alphabet.zip(alphabet.rotate(num))]

    alphabet = Array('A'..'Z')
    caps     = Hash[alphabet.zip(alphabet.rotate(num))]

    encrypter = non_caps.merge(caps)

    string.chars.map { |c| encrypter.fetch(c, c) }
  end
end

# p CaesarCipher.new('Testowy Tekst').perform
# p CaesarCipher.new('Ala ma...psa!', 4).perform
# p CaesarCipher.new('Ala ma...psa!', -4).perform
# p CaesarCipher.new('Ala ma...psa!', 26).perform
# p CaesarCipher.new('Ala ma...psa!', -26).perform
