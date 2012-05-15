/**
* Created by JetBrains RubyMine.
* User: arijit
* Date: 31/3/12
* Time: 2:26 PM
* To change this template use File | Settings | File Templates.
*/

$('<%= escape_javascript(render(:partial => @comment))%>')
.appendTo('#comments')
.hide()
.fadeIn()

$('#new_comment')[0].reset()

$('#comments_count').html '<%= comments_count %>'