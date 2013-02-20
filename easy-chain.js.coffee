(($)->
  $.fn.easyChain = (options) ->
    settings =
      include_blank : true
      trriger_method : 'change'
      
    settings = $.extend settings,options
    
    optionsAssembler = (select,data) ->
      for i,option of data
        select.append("<option value='#{option[1]}'>#{option[0]}</option>")
    
    optionsCleaner = (select) ->
      if settings.include_blank
        select.find('option:gt(0)').remove()
        return select
      else
        sselect.empty()
    
    return @each () ->
      $self = $(@)
      $self.on settings.trriger_method,() ->
        $trigger = $($self.attr('data-next-cog'))
        val = $self.val()
        if !val && !!$self.attr('data-trigger-blank')          
          optionsCleaner($trigger).trigger(settings.trriger_method)
          return false
        else
          return false if !val
          $.ajax(
            dataType : 'JSON'
            method : 'GET'
            url : $self.attr('data-remote-url')
            data :
              value : val
          ).done((data)->
            optionsAssembler(optionsCleaner($trigger),data)
          )
        return
      return
  return
)(jQuery)