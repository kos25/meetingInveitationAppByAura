({
    doSend : function(component, event, helper) {
        var Email = component.get('v.email');
        var startDate = component.get('v.startDate');
        var duration = component.get('v.duration');
        var datesplit = startDate.split('-');
        var dateFormet = datesplit[0] + datesplit[1] + datesplit[2] ;
         
        var action = component.get('c.sendInvite');
         action.setParams({
            email:Email,
            startDate:  dateFormet,
            duration: duration
         });
         action.setCallback(this , function(response){
               var state = response.getState();
               alert(state);
         });
         $A.enqueueAction(action);

         
    }
})