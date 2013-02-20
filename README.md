easy-chain
==========
###Ugly enough,but easy enough
It's a jQuery plugin for [Select] tag that make chain reaction,for the Simple demand.

Usage
---------------

###AJAX behavior
1. Send a *GET* request to server
2. The ajax request with jQuery.ajax look like:
  ```
  $.ajax({
          dataType: 'JSON',
          method: 'GET',
          url: 'remote-server-url',
          data: {
            value: 'selected value'
          }
        })
  ```
3. get the **data** from server,your **data** must look like a **Array** `[ [key1,value1], [key2,value2]... ]`

###Html render
######You should render select tags with attributes:
- data-url: get the data from remote
- data-next-cog: the object that trigger event from *this*,syntax is jQuery selector like `'#cog'`
- data-trigger-blank: when you need to trigger event by blank-selected,set to 'true'

######Then the output look like:
```
<select data-url='remote-url' data-next-cog='#select2' data-trigger-blank='true'>
  <option value=''>Select a Cog</option>
  <option value='value'>Key</option>
  ...
</select>
```

######In Rails version,you must add these at all:
- data-remote: true
- data-type: 'JSON'
- data-method: 'GET' by default
- name:for ajax request's query parameter's key(like from's element)

######Then the output look like:
```
<select name='qper' data-remote='true' data-type='json' data-url='remote-url' data-next-cog='#select2' data-trigger-blank='true'>
  <option value=''>Select a Cog</option>
  <option value='value'>Key</option>
  ...
</select>
```

###In Front
`$('selects.needed-select-tags').easyChain();`

or

`$('selects.needed-select-tags').easyChain({include_blank:true});`
- options `include_blank` means your prompt demand,`true` as default.

TODO
---------------
- Local data is needed
- Simple Features