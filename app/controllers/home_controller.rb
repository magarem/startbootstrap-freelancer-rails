require "recursos"

class HomeController < ApplicationController
          
    def index
        @page =  Txtbox.new({
            img:   "/assets/profile.png",
            label: "Bem vindo",
            body:  "Desenvolvedor Web - Web master"
        })

        header
        portfolio
        sobre
        contato
        footer
    end

    def header
        #logo
        @logo = Txtbox.new({
         	label: "Marcelo A. Magalhães",
         	link: "#page-top"
        })
         
        #menu
        @menu = Menu.new
        @menu.setUlClass ("nav navbar-nav navbar-right")
        @menu.op = [
          { label: "Portfólio", link: "#portfolio"},
          { label: "Sobre",     link: "#about"},
          { label: "Contato",   link: "#contact"}
        ]
        @menu.doTree
    end

    def portfolio
        #portfólio
        @port = Portfolio.new "portfolio.yaml"
    end

    def sobre
        #sobre
        @sobre = Txtbox.new({
          label: "Sobre",           
          bodyl: [
            "<i>Lorem</i> ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dolor arcu, suscipit at turpis id, dictum hendrerit lectus. Suspendisse sed tempor nibh. Nunc dignissim risus nec mauris porttitor placerat. Ut sodales ligula vel lorem pretium finibus. Nam id sodales metus. Suspendisse maximus accumsan magna.",
            "Nam ut facilisis mauris. Nulla varius pulvinar lorem, sit amet porttitor lacus pulvinar eu. Pellentesque non cursus neque, vel tristique mauris. Proin tincidunt ut sapien id suscipit. Vestibulum sed pellentesque lorem. Cras malesuada libero tincidunt venenatis ultrices. Pellentesque ac pretium turpis, eu bibendum dolor. "
          ]
        })
    end

    def contato
        #contact
        @contact = Contact.new 
    end

    def contato_do
        #envio dos dados do formulário de contato      
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
          flash.now[:notice] = 'Mensagem enviada com sucesso.'
        else
          flash.now[:error] = 'Sua mensagem não pode ser enviada. Favor tentar novamente.'
        end
        self.index
        render "home/index"
    end

    def footer         
         #endereço
         @box1 =  Txtbox.new({
           	label: "Local",
           	body: "Rio de Janeiro - RJ - Brasil"
          })
          
         #social links
         @box2 = SocialLink.new ({
 	          facebook:   "marcelo.a.magalhaes.5",
            googleplus: "marcelo5",
            twitter:    "marcelo.a.magalhaes5"
          })

			   #créditos
			   @box3 =  Txtbox.new({
           	label: "Créditos",
           	body:  "Ruby on Rails,<br>tema <a href='http://blackrockdigital.github.io/startbootstrap-freelancer/'>Freelancer</a>"
          })

			   #copyright
			   @box4 =  Txtbox.new({
           	label: "Marcelo A. Magalhães - 2016"              
          })
    end
end

