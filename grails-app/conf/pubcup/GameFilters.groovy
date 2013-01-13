package pubcup

class GameFilters {

    def filters = {
		console(controller:'console', action:'*') {
			before = {
				if(session.isUser){
					return true
				}else{
				redirect(controller:"game", action: 'auth')
					return false
				}	
			}
		}
        all(controller:'game', action:'*') {
            before = {
				
				if(actionName == 'auth' || actionName == 'validateAuth' ){
					return true
				}else if(session.isUser){
					return true
				}else{
					redirect(controller:"game", action: 'auth')
					return false
				}
            }
        }
    }
}
