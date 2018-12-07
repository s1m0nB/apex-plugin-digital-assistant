function addChatBotWidget(  p_region              in apex_plugin.t_region
                         ,  p_plugin              in apex_plugin.t_plugin
                         ,  p_is_printer_friendly in boolean )
return apex_plugin.t_region_render_result
is
    -- constants
    l_dir_name     varchar2(100)  := 'bots-apex-18.4.3.0/';
    -- plugin attributes
    l_app_id       varchar2(100)  := p_region.attribute_01;
    l_locale       varchar2(100)  := nvl(p_region.attribute_02,'');
    l_bot_name     varchar2(256)  := p_region.attribute_03;
    l_bot_logo     varchar2(256)  := nvl(p_region.attribute_04,'');
    l_user_name    varchar2(256)  := nvl(p_region.attribute_05,'');
    l_sound        varchar2(1)    := p_region.attribute_06;
    l_buttonIcon   varchar2(256)  := nvl(p_region.attribute_07,'');
    l_custom_text  varchar2(4000) := nvl(p_region.attribute_08,'');
    l_custom_color varchar2(4000) := nvl(p_region.attribute_09,'');
    l_clear_cache  varchar2(1)    := p_region.attribute_10;
    l_image_upload varchar2(1)    := p_region.attribute_11;
    l_user_props   varchar2(4000) := nvl(p_region.attribute_12,'');
    -- dummy result
    l_result      apex_plugin.t_region_render_result;
begin
    -- render the html
    htp.prn('<script> window.pluginJSFiles = "'||p_plugin.file_prefix || l_dir_name||'"; </script>');
  if l_clear_cache = 'Y'
  then
    -- clear cache
    htp.prn('<script> 
    var keys = Object.keys(localStorage);
    for(var i = 0; i < keys.length; i++){
        if(keys[i] === "appId"){
            continue;
        }
        localStorage.removeItem(keys[i]);
    }
</script>');
end if;
    htp.prn('<script> 
      !function(e,t,n,r){ 
    function s(){
     try{
       var e;
        if((e="string"==typeof this.response?JSON.parse(this.response):this.response).url){
        var n=t.getElementsByTagName("script")[0],r=t.createElement("script");
        r.async=!0,r.src=pluginJSFiles+e.url,n.parentNode.insertBefore(r,n)
      }
     }
     catch(e){}}var o,p,a,i=[],c=[];e[n]={init:function(){o=arguments;
      var e={then:function(t){
        return c.push({type:"t",next:t}),e
        } ,catch:function(t){return c.push({type:"c",next:t}),e}};
        return e},on:function(){
         i.push(arguments)},render:function(){p=arguments},destroy:function(){a=arguments}
        } ,e.__onWebMessengerHostReady__=function(t){
         if(delete e.__onWebMessengerHostReady__,e[n]=t,o)for(var r=t.init.apply(t,o),s=0;s<c.length;s++){
          var u=c[s];
           r="t"===u.type?r.then(u.next):r.catch(u.next)
           } p&&t.render.apply(t,p),a&&t.destroy.apply(t,a);
         for(s=0;s<i.length;s++)t.on.apply(t,i[s])};
         var u=new XMLHttpRequest;u.addEventListener("load",s),u.open("GET",r+"/loader.json",!0),u.responseType="json",u.send() 
        }
    (window,document,"Bots", "'||p_plugin.file_prefix ||l_dir_name||'"); 

</script>');
    htp.prn('<script> 
    console.log ( "Attribute 12 : '|| nvl(length (l_user_props ),0)  ||' " );
  Bots.init({ appId: "'||l_app_id||'"');
  if  nvl(length (l_locale ),0) > 0
  then
    htp.prn(' , locale: "'||l_locale||'"');
  end if;
  if l_sound = 'Y'
  then
    htp.prn(' , soundNotificationEnabled: true ');
  else
      htp.prn(' , soundNotificationEnabled: false ');
  end if;
  if  nvl(length (l_buttonIcon ),0) > 0
  then
    htp.prn(' , buttonIconUrl: "'||l_buttonIcon||'"');
  end if;
  if l_image_upload = 'Y'
  then
    htp.prn(' , imageUploadEnabled: true ');
  else
      htp.prn(' , imageUploadEnabled: false ');
  end if;
  htp.prn(' , businessName : "'||l_bot_name||'" '); 
    htp.prn(' , businessIconUrl: "'||l_bot_logo||'" ');
  if  nvl(length (l_custom_text ),0) > 0
  then
    htp.prn(' , customText: '||l_custom_text||' ');
  end if;
  if  nvl(length (l_custom_color ),0) > 0
  then
    htp.prn(' , customColors: '||l_custom_color||' ');
  end if;
  htp.prn('   })
      .then(function (res){
            Bots.updateUser({
                givenName: "'||l_user_name||'" ');
  if  nvl(length (l_user_props ),0) > 0
  then
    htp.prn(' , properties: '||l_user_props );
  end if;
  htp.prn('
            
            });
  })
  
</script> ');
    return l_result;
    --
end addChatBotWidget;
