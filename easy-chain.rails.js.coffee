(($)->
  $.fn.easyChain = (options) ->
    settings =
      include_blank : true
      
    settings = $.extend settings,options
    
    optionsAssembler = (select,data) ->
      for i,option of data
        select.append("<option value='#{option[1]}'>#{option[0]}</option>")
      return
    
    optionsCleaner = (select) ->
      if settings.include_blank
        select.find('option:gt(0)').remove()
        return select
      else
        sselect.empty()
    
    return @each () ->
      $self = $(@)
      $trigger = $($self.attr('data-next-cog'))
      
      $self.on 'ajax:before',(e) ->
        val = $self.val().toString()
        if !!val
          true
        else
          optionsCleaner($trigger).trigger('change') if $self.attr('data-trigger-blank') == 'true'
          return false
      
      $self.on 'ajax:success',(e,data) ->
        optionsAssembler(optionsCleaner($trigger),data)
        return
      
      return
  return
)(jQuery)