# frozen_string_literal: true

require 'sinatra'
# Only loads this gem if not in deployment to heroku
# It will automatically reload a page when changes are made
require 'sinatra/reloader' if development?
require './caesar_cipher' # Actual logic

cc = CaesarCipher.new

get '/' do
  message = nil

  erb :index, locals: {
    message: message
  }
end

get '/cipher' do
  txt = params['txt'].to_s
  shift = params['shift'].to_i

  if txt.is_a?(String) && shift.is_a?(Integer)
    message = cc.encrypt(shift: shift, text: txt)
  end

  erb :index, locals: {
    cc: cc,
    message: message,
    txt: txt
  }
end
