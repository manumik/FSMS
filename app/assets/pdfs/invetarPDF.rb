class Invetarspdfs < Prawn::Document
    def initialize(itme, kunde, typ)
        super()
        @kunde = kunde 
        @item = item
        @typ = typ
        
        text "Hello Welt2"
        
    end
end