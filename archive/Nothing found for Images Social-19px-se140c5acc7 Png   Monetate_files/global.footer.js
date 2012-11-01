// Extending native prototypes
(function(){
  function _trailingslashit()
  {
    if (this.substr(-1) != '/') {
      return this.valueOf() + '/';
    } else {
      return this;
    }
  }
  function _lastpathsegment()
  {
    var segs = this.split('/'),
        seg = '';
    do {
      seg = segs.pop();
    } while (seg === '');
    return seg;
  }
  String.prototype.trailingslashit = _trailingslashit;
  String.prototype.lastpathsegment = _lastpathsegment;
})();

// Global initialization
(function($){
  
  var $wistia_iframes,
      $wistia_popover_links;

  // Ready Function
  $(function(){
    
    // Initialize Subnav
    init_subnav();
    
    // Colorbox Links
    $('#wrapper').delegate('a.colorbox-request-demo', 'click', request_demo_click);
    $('#wrapper').delegate('a.colorbox-iframe-href', 'click', colorbox_iframe_click);
    $('#wrapper').delegate('a.colorbox', 'click', colorbox_link_click);
    
    // Cycle Sliders
    init_cycles();
    
    // Initialize Query Filters
    init_query_filters();
    
    // Archive Widget
    init_archive_widget();
    
    // Twitter Widget
    init_twitter_widget();

    // Wistia -> Marketo Tracking
    init_wistia_marketo_tracking();
    
  });
  
  function init_subnav()
  {
    var $parents = $('#main-menu, #utility-menu'),
        $currents = $parents.find('li.current-menu-item'),
        $submenu = $('<ul class="sub-menu"></ul>'),
        $activeroot;
        
    // Highlight active items
    $currents
      .parentsUntil('#main-menu, #utility-menu', 'li.menu-item')
      .addClass('current-menu-ancestor')
      .first().addClass('current-menu-parent');
    
    // Now find the active root menu item
    $activeroot = $parents.children('li.current-menu-parent, li.current-menu-item').first();

    // Return if no submenu
    if ($activeroot.find('ul.sub-menu').length === 0) return;
    
    // Build the submenu
    $activeroot.clone().appendTo($submenu);
    $submenu.find('ul.sub-menu').detach().children('li').appendTo($submenu);
    $submenu.appendTo('#top-subnav');
  }
  
  function colorbox_link_click(e)
  {
    $.colorbox({
      href:$(e.currentTarget).attr('href'),
      scalePhotos:false
    });
    return false;
  }
  function colorbox_iframe_click(e)
  {
    $.colorbox({
      href:$(e.currentTarget).attr('href'),
      iframe:true,
      width:380,
      height:540
    });
    return false;
  }
  function request_demo_click(e)
  {
    $.colorbox({
      href:'http://info.monetate.com/DemoRequestLightbox.html',
      iframe:true,
      width:380,
      height:540
    });
    return false;
  }
  
  function init_cycles()
  {
    $('.cycle').each(function(){
      var $cycle = $(this),
          $cycle_nav = $('#'+$cycle.data('cycle-nav'));
      $cycle.cycle({
        activePagerClass: 'active',
        fx: 'scrollLeft',
        pager: $cycle_nav,
        pause: true,
        speed: 800,
        timeout: 6000
      });
    });
  }
  
  function init_query_filters()
  {
    var $filters = $('#query-filters'),
        $type_filter = $filters.find('#filter-by-type'),
        $topic_filter = $filters.find('#filter-by-topic'),
        $market_filter = $filters.find('#filter-by-market');
    
    $filters.delegate('select', 'change', function(e){
      var $select = $(e.currentTarget);
      window.location = $select.data('base-url') + '&' + $select.attr('name') + '=' + $select.val();
    });
    
    $filters.find('select').customStyle();
  }
  
  function init_archive_widget()
  {
    var $widget = $('#sidebar aside.widget_monetate_blog_archives_widget');
    
    $widget.find('.toggle').click(function(){
      $widget.find('.list-mask').animate({
        height: $widget.find('ul').height()
      });
      $(this).remove();
      return false;
    });
  }
  
  function init_twitter_widget()
  {
    var $widget = $('#sidebar aside.widget_twitter'),
        $twitter_link = $widget.find('h3.widget-title a');
    
    // Open twitter follow-link in new window
    $twitter_link.attr('target', '_blank');
  }
  
  function init_wistia_marketo_tracking()
  {
    $wistia_iframes = $('#content iframe[src^="http://fast.wistia.com/embed/iframe"]');
    $wistia_popover_links = $('#content a[href^="http://fast.wistia.com/embed/iframe"]');

    // loop through iframes
    $wistia_iframes.each(function(){
      var video = this;

      // bind play event
      video.wistiaApi.bind('play', function(){
        console.log('Tracking: ' + 'Video:' + location.pathname.lastpathsegment());
        mktoMunchkinFunction('visitWebPage', {
          url: 'Video:' + location.pathname.lastpathsegment()
        });
      });

    });

    // loop through links
    $wistia_popover_links.each(function(){
      var $vidlink = $(this);

      // bind play event
      $vidlink.click(function(){
        console.log('Tracking: ' + 'Video:' + $vidlink.attr('id'));
        mktoMunchkinFunction('visitWebPage', {
          url: 'Video:' + $vidlink.attr('id')
        });
      });

    });
  }


  // Legacy functions
  
  var $customer_logos = $('#customer-logos');
  $customer_logos.find('a.toggle').click(function(){
    var $this = $(this),
        $logo_container = $customer_logos.find('.container');
        
    if ($logo_container.data('max_height') === null) {
      $logo_container.data('max_height', $logo_container.find('img').height());
    }
    if ($logo_container.data('min_height') === null) {
      $logo_container.data('min_height', $logo_container.height());
    }
    if ($logo_container.height() == $logo_container.data('max_height')) {
      $logo_container.animate({
        height: $logo_container.data('min_height')
      });
      $this.removeClass('up').addClass('down').html('See more Monetate customers');
    } else {
      $logo_container.animate({
        height: $logo_container.data('max_height')
      });
      $this.removeClass('down').addClass('up').html('Close');
    }
    return false;
  });
  
})(jQuery);

