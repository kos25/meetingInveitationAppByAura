public class SendInvites {

    public SendInvites() {}
    @AuraEnabled
     public static void   sendInvite( String email , String startDate , String duration ) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Meeting Invitation');
        mail.setPlainTextBody('');
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.filename = 'meeting.ics';
        attach.ContentType = 'text/calendar;';
        attach.inline = true;
        attach.body = invite(startDate , duration );
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {attach});
        Messaging.SendEmailResult[] er = Messaging.sendEmail(new Messaging.Email[] {mail});
      
    }
    
   public static  Blob invite(String startDate , String duration  ) {
       system.debug('duration' +duration);  
        String txtInvite = '';
        txtInvite += 'BEGIN:VCALENDAR\n';
        txtInvite += 'PRODID:-//Microsoft Corporation//Outlook 12.0 MIMEDIR//EN\n';
        txtInvite += 'VERSION:2.0\n';  
        txtInvite += 'METHOD:PUBLISH\n';
        txtInvite += 'X-MS-OLK-FORCEINSPECTOROPEN:TRUE\n';
        txtInvite += 'BEGIN:VEVENT\n';   
        txtInvite += 'CLASS:PUBLIC\n';
        txtInvite += 'CREATED:20091026T203709Z\n';
        txtInvite += 'DTEND:'+startDate +'T0'+duration+'0000Z\n';
        txtInvite += 'DTSTAMP:20091026T203709Z\n';
        txtInvite += 'DTSTART:'+ startDate+'T000000Z\n'; 
        txtInvite += 'LAST-MODIFIED:20091026T203709Z\n';
        txtInvite += 'LOCATION:Online\n';
        txtInvite += 'PRIORITY:5\n';
        txtInvite += 'SEQUENCE:0\n';
        txtInvite += 'SUMMARY;';
        txtInvite += 'LANGUAGE=en-us:Meeting\n';
        txtInvite += 'TRANSP:OPAQUE\n';
        txtInvite += 'UID:4036587160834EA4AE7848CBD028D1D200000000000000000000000000000000\n';
        txtInvite += 'X-ALT-DESC;FMTTYPE=text/html:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN"><HTML><HEAD><META NAME="Generator" CONTENT="MS Exchange Server version 08.00.0681.000"><TITLE></TITLE></HEAD><BODY><!-- Converted from text/plain format --></BODY></HTML>\n';
        txtInvite += 'X-MICROSOFT-CDO-BUSYSTATUS:BUSY\n';
        txtInvite += 'X-MICROSOFT-CDO-IMPORTANCE:1\n';
        txtInvite += 'END:VEVENT\n';
        txtInvite += 'END:VCALENDAR';
        return Blob.valueOf(txtInvite);
    }
}
