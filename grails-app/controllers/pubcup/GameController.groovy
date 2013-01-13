package pubcup

import org.springframework.dao.DataIntegrityViolationException

class GameController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gameInstanceList: Game.list(params), gameInstanceTotal: Game.count()]
    }

    def create() {
        [gameInstance: new Game(params)]
    }

    def save() {
        if(params.teams.size() != 2) {
            flash.message = message(code: 'game.teams.persist')
            redirect(action: "create", params: params)
            return
        }
        def gameInstance = new Game(params)
        if (!gameInstance.save(flush: true)) {
            render(view: "create", model: [gameInstance: gameInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'game.label', default: 'Game'), gameInstance.id])
        redirect(action: "show", id: gameInstance.id)
    }

    def show(Long id) {
        def gameInstance = Game.get(id)
        if (!gameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "list")
            return
        }

        [gameInstance: gameInstance]
    }

    def edit(Long id) {
        def gameInstance = Game.get(id)
        if (!gameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "list")
            return
        }

        [gameInstance: gameInstance]
    }

    def update(Long id, Long version) {
        if(params.teams.size() != 2) {
            flash.message = message(code: 'game.teams.persist')
            redirect(action: "edit")
            return
        }
        def gameInstance = Game.get(id)
        if (!gameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gameInstance.version > version) {
                gameInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'game.label', default: 'Game')] as Object[],
                          "Another user has updated this Game while you were editing")
                render(view: "edit", model: [gameInstance: gameInstance])
                return
            }
        }

        gameInstance.properties = params

        if (!gameInstance.save(flush: true)) {
            render(view: "edit", model: [gameInstance: gameInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'game.label', default: 'Game'), gameInstance.id])
        redirect(action: "show", id: gameInstance.id)
    }
	def auth(){
		if(params.message){
			["messageError": params.message]
		}
	}
	
	def validateAuth(String email){
		if(User.findByEmail(email)){
			session.isUser = true
			redirect(action: "create")
		}else{
			redirect(action: "auth", params:["message":message(code:"game.email.not.found", default: "Mail not found.")])
		}
		
		
	}
		
    def delete(Long id) {
        def gameInstance = Game.get(id)
        if (!gameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "list")
            return
        }

        try {
            gameInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'game.label', default: 'Game'), id])
            redirect(action: "show", id: id)
        }
    }
}
