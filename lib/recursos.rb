
class Logo
     attr_accessor :txt, :slogan, :slogan2, :img
end

class Txt
    
      attr_accessor :label, :body, :img
    
      def initialize
          @body = Array.new
      end

      def body_
         txt = ""
         @body.each do |t|
            if t == @body.last
               txt=txt+t
             else
               txt=txt+t+"<br>"     
            end 
         end
         return txt
      end
end

class Menu

      attr_accessor :op

      def initialize
          @op = []
      end

      def setOps(ops)
          @op = ops
      end
end

class Portfolio

   attr_accessor :item

   def initialize
        @item = Array.new
   end

end   


class Menu
   attr_accessor :tela, :ulClass

   def initialize
        @tela = ""
        @tree = {}
        @lnk = []
        @t = 0
        @ulClass = ""
   end

   def setUlClass (c)
      @ulClass = c
   end

   def setOps(ops)
          @dirs = ops
          @dirs.each do |path, p2|
              @lnk.push p2
              current  = @tree
              path.split("|").inject("") do |sub_path,dir|
                    sub_path = File.join(sub_path, dir)
                    current[sub_path] ||= {}
                    current  = current[sub_path]
                    sub_path
              end
        end
         @tela = print_tree "", @tree
   end

   def print_tree(prefix, node)
      @tela = @tela + "#{prefix}<ul class='#{@ulClass}'>"
      node.each_pair do |path, subtree|
        @tela = @tela +  "#{prefix}  <li><a href='#{@lnk[@t]}'>#{File.basename(path)}</a></li>"
       @t = @t + 1
        print_tree(prefix + "  ", subtree) unless subtree.empty?

      end

      @tela = @tela +  "#{prefix}</ul>"
      @tela

    end

    def run
      @tela = print_tree "", @tree
    end

end

