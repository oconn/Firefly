$(document).on('ready page:load', function(){
  $('#calendar').fullCalendar({
    events: {
        url: $("#cal-path").text(),
        className: 'gcal-event',           // an option!
        currentTimezone: 'America/New_York', // an option!
        defaultDate: new Date()
    }
  });
});