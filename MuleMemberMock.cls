@IsTest
global class MuleMemberMock implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest request) {

        HttpResponse response = new HttpResponse();

        response.setHeader(
            'Content-Type',
            'application/json'
        );

        response.setBody(
            '{"memberId":"M001","name":"John Smith","status":"Active"}'
        );

        response.setStatusCode(200);

        return response;
    }
}