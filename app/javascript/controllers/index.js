// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from './application'

import ArtistsSongsController from './artists_songs_controller'
import MetronomeController from './metronome_controller'
application.register('artists-songs', ArtistsSongsController)
application.register('metronome', MetronomeController)
