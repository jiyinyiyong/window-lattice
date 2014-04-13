
{at} = require './tween'
{putSpace, clipSpace} = require './algorithm'

exports.Space = class
  constructor: (config) ->
    @img = config.img
    @x = config.x
    @y = config.y
    @makeClip()

  makeClip: ->
    position =
      x: @x
      y: @y
    windou =
      w: innerWidth
      h: innerHeight
    @clip = clipSpace @img, position, windou

  config: (state) ->
    @state = state
    @calculate()

  calculate: ->
    @oldDetail = @detail
    windou = w: innerWidth, h: innerHeight
    position =
      x: @x
      y: @y
    @detail =
      fg: putSpace position, @state, windou
      img: @clip

    # console.log @detail.fg

  getDetailAt: (ratio) ->
    fg: at @oldDetail.fg, @detail.fg, ratio
    img: @clip

  getDetail: ->
    @detail