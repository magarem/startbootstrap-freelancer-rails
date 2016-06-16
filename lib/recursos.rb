
#################################################################
# Desenvolvido por Marcelo A. Magalhães
# contato@magaweb.com.br
# em 07/06/2016
# Framework para controle do conteúdo vinculado no tema Freelacer
# do site start bootstrap
#################################################################
require 'yaml'

class Collection 

  attr_accessor :data, :a

  def load val
    if val.class == Hash 
      return loadHash val
    end

    if val.class == String
      if val.include? ".json" then return loadJsonFile val end
      if val.include? ".yaml" then return loadYamlFile val end
    end
  end

  def loadHash data
    # JSON.parse(data.to_json, object_class: OpenStruct)
    OpenStruct.new(data)
  end

  def loadJson data
    JSON.parse(data, object_class: OpenStruct)
  end

  def loadJsonFile file
    data_file = File.read("#{Rails.root}/public/"+file)
    JSON.parse(data_file, object_class: OpenStruct)
  end

  def loadYamlFile file  
    #@a = 10
    data = YAML.load_file("#{Rails.root}/public/"+file)
    #byebug
    JSON.parse(data.to_json, object_class: OpenStruct)

  end
end


class Portfolio 

    attr_accessor :items

    def initialize (string)
      @items = Collection.new.load(string)
    end 

end 


class Txtbox 

    attr_accessor :items

    def initialize (string)
      @items = Collection.new.loadHash(string)
    end 

    # def display_body
    #     return (@body + @bodyl.join("<br>")).html_safe
    # end

end


class Menu
   #attr_accessor :op, :tela, :ulClass
   attr_accessor :items, :ops, :tela

   def initialize (string)
        @items = Collection.new.load(string)
        @ops = @items.ops
        @tela = ""
        @tree = {}
        @lnk = Array.new
        @t = 0
        @ulClass = @items.style_class_ul

        doTree
   end

   # def setUlClass c
   #    @ulClass = c
   # end

   def doTree
      @ops.each do |t|
          label = t[:label]
          @lnk << t[:link]
          current  = @tree
          label.split("|").inject("") do |sub_path,dir|
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
        @t += 1
        print_tree(prefix + "  ", subtree) unless subtree.empty?
      end
      @tela = @tela +  "#{prefix}</ul>"
      @tela
    end

    def tela
      @tela.html_safe
    end
end


class SocialLink

      attr_accessor :items

      def initialize (string)
         @items = Collection.new.load(string)
      end 
end