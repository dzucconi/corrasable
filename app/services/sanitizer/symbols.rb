# Convert symbols to what one would pronounce if reading.
# Not the actual names of symbols, in some circumstances.

class Sanitizer
  class Symbols
    SILENT = %w{
      ' " » « › ‹ ” “ ’ ‘ ⟩ ⟨ [ ] ( ) \{ \} : , ، 、 ‒ – — ― ‐ - … . ! ? ; ‽
    }.freeze

    TYPOGRAPHICAL = {
      '&' => 'and',
      '*' => 'asterisk',
      '@' => 'at',
      '/' => 'slash',
      '\\' => 'backslash',
      '•' => 'bullet',
      '^' => 'caret',
      '‡' => 'double dagger',
      '†' => 'dagger',
      '°' => 'degrees',
      'º' => 'degrees',
      '¡' => 'inverted exclamation mark',
      '¿' => 'inverted question mark',
      '※' => 'note',
      '#' => 'hash',
      '№' => 'number',
      '÷' => 'divided by',
      '×' => 'multiplied by',
      'ª' => 'ordinal',
      '‰' => 'per mil',
      '%' => 'percent',
      '−' => 'minus',
      '+' => 'plus',
      '=' => 'equals',
      '‱' => 'basis point',
      '¶' => 'pilcrow',
      '′' => 'prime',
      '″' => 'double prime',
      '‴' => 'triple prime',
      '§' => 'section',
      '~' => 'aproximately',
      '_' => 'underscore',
      '|' => 'pipe',
      '¦' => 'broken bar',
      '©' => 'copyright',
      '®' => 'registered ',
      '℠' => 'service mark ',
      '™' => 'trademark'
    }.freeze

    def self.symbol?(token)
      TYPOGRAPHICAL.keys.concat(SILENT).include? token
    end

    def self.map(token)
      if SILENT.include? token
        ''
      elsif TYPOGRAPHICAL.keys.include? token
        TYPOGRAPHICAL[token]
      else
        ''
      end
    end
  end
end
