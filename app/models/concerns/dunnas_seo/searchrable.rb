module DunnasSeo
    module Searchrable
        extend ActiveSupport::Concern
        module ClassMethods
        def search(value, options = { includes: '', columns: [] })
            if value.blank?
            all
            else
            query = ''
            ((options[:columns] + columns_hash.to_a)).each do |_column, _type|
                unless _column.include? '_id' && 'id'
                if query.blank?
                    case _type.type
                    when :string
                    if _type.default == '{}'
                        # TODO: array de string
                    else
                        query << ".where(\"LOWER(#{_column}) ILIKE LOWER('%#{value}%')\")"
                    end
                    when :integer
                    query << ".where(\"#{_column} = #{value} \")" if is_integer?(value)
                    when :decimal
                    query << ".where(\"#{_column} = #{value} \")" if is_decimal?(value)
                    when :boolean
                    query << ".where(\"#{_column} = #{to_boolean(value)} \")" if is_boolean?(value)
                    when :datetime, :date
                    if is_datetime?(value)
                        query << ".where(\"DATE(#{_column}) = TO_DATE('#{value.to_date}', 'DD/MM/YYYY') \")"
                    end
                    when :inet
                    # TODO: ip
                    else
                    query << ".where(\"#{_column} = '#{value}'\")"
                    end
                else
                    case _type.type
                    when :string
                    if _type.default == '{}'
                        # TODO: array de string
                    else
                        query << ".or(self#{options[:includes]}.where(\"LOWER(#{_column}) ILIKE LOWER('%#{value}%')\"))"
                    end
                    when :integer
                    query << ".or(self#{options[:includes]}.where(\"#{_column} = #{value} \"))" if is_integer?(value)
                    when :decimal
                    query << ".or(self#{options[:includes]}.where(\"#{_column} = #{value} \"))" if is_decimal?(value)
                    when :boolean
                    if is_boolean?(value)
                        query << ".or(self#{options[:includes]}.where(\"#{_column} = #{to_boolean(value)} \"))"
                    end
                    when :datetime, :date
                    if is_datetime?(value)
                        query << ".or(self#{options[:includes]}.where(\"DATE(#{_column}) = TO_DATE('#{value.to_date}', 'DD/MM/YYYY') \"))"
                    end
                    when :inet
                    # TODO: ip
                    else
                    query << ".or(self#{options[:includes]}.where(\"#{_column} = '#{value}'\"))"
                    end
                end
                end
            end
            eval "self#{options[:includes]}#{query.blank? ? '.all' : query}"
            end
        end
    
        private
    
        def is_integer?(s)
            /\A[-+]?\d+\z/ === s
        end
    
        def is_decimal?(s)
            /\A-?(?:\d+(?:\.\d*)?|\.\d+)\z/ === s
        end
    
        def is_boolean?(s)
            to_boolean(s)
            true
        rescue StandardError
            false
        end
    
        def to_boolean(s)
            case s.downcase
            when 'true', 'sim', '1'
            true
            when 'false', 'não', 'nao', '0'
            false
            else
            raise 'CannotCastBoolean'
            end
        end
    
        def is_datetime?(s)
            s.to_date
            true
        rescue StandardError
            false
        end
        end
    end
end