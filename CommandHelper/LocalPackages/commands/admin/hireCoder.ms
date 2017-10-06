register_command(hirecoder, 

    array(
        description: 'Hire\'s a Player as a Coder',
        usage: '/hirecoder <player>',
        permission: 'hire.coder',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
    
        executor: closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 1) {
                return(false)
            }

            @player = player()
            @vic = player(@args[0])

            include('/home/minecraft/server/plugins/CommandHelper/includes/checkJobs.ms')
            if(!_checkJobs(@vic)){
                die()
            }
            
            runas(~console,"/pex user ".@player." add is.coder")
            runas(~console,"/pex user ".@player." group add coder")
            tmsg(player(),color(red)."You have hired ".@player. " as a Coder!")
            tmsg(@player,color(red)."You have been hired as a Coder!")
        }
    )
)

register_command(firecoder, 

    array(
        description: 'Fire\'s a Player as a DNA Engineer',
        usage: '/firednaengineer <player>',
        permission: 'fire.dnaengineer',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
        executor: closure(@alias, @sender, @args) {
        
            if (array_size(@args) != 1) {
                return(false)
            }
        
            @player = player()
            @vic = player(@args[0])

            runas(~console,"/pex user ".@vic." remove is.coder")
            runas(~console,"/pex user ".@vic." group remove coder")
            tmsg(@player,color(red)."You have fired ". @vic ." from Coding!")
            tmsg(@vic,color(red)."You have been fired from Coding")
        }
    )
)