
class Dashing.Appstore extends Dashing.Widget
  ready: ->
    @onData(this)
 
  onData: (data) ->
    widget = $(@node)
    console.log(data)
    last_version = @get('last_version')
    all_versions = @get('all_versions')
    rating = last_version.average_rating
    console.log(rating)
    voters_count = last_version.voters_count
    console.log(voters_count)
    widget.find('.appstore-rating-value').html( '<div>Last Version Average Rating</div><span id="appstore-rating-integer-value">' + rating + '</span>')
    widget.find('.appstore-voters-count').html( '<span id="appstore-voters-count-value">' + voters_count + '</span> Votes' )
    widget.find('.appstore-all-versions-average-rating').html( all_versions.average_rating )
    widget.find('.appstore-all-versions-voters-count').html( all_versions.voters_count )