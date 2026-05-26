public with sharing class MuleMemberService {

    @AuraEnabled
    public static String getMemberDetails(String memberId) {

        HttpRequest request = new HttpRequest();

        request.setEndpoint('callout:Mule_API/members/' + memberId);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');

        Http http = new Http();

        try {

            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 200) {
                return response.getBody();
            }

            throw new CalloutException(
                'Mule API failed with status code: ' +
                response.getStatusCode()
            );

        } catch(Exception ex) {

            System.debug('Integration Error: ' + ex.getMessage());

            throw ex;
        }
    }
}