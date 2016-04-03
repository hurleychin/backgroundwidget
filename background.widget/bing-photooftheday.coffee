# Created by Sam Roach 1/21/2016
# Bing's photo of the day backgroud with a fade to black at the bottom of the screen to make a more usable space for other widgets.

command: """
curl -s 'http://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1'
"""

# Set the refresh frequency.
refreshFrequency: '8h'

style: """
  top: 0%
  left: 0%
  color: #fff

  .wallpaper
    position: absolute
    z-index: -10000
    width: 100%

  .background
    width: 100%
    position: absolute
    z-index: -10000

  .myimage
    width: 1280px
    height: 800px
    position: absolute
    z-index: -10000

  .copyright
    margin-right 20px
    font-size: 20px

  .darker
    width: 1920px
    height: 300px
    color: green
    top: 900px
    position: absolute
    z-index: -9998
    background: linear-gradient(0deg, black, rgba(0, 0, 0, 0));

"""

render: -> """
<div id='background'></div>
<div class='darker'></div>

"""

# Update the rendered output.
update: (output, domEl) ->
  mydiv = $(domEl).find('#background')
  html = ''
  url=JSON.parse(output).images[0].url
  html += "<div class='wallpaper'>"
  html += "<img src='" +url+ "' class='myimage' >"
  html += "</div>"

  # Set the output
  mydiv.html(html)
