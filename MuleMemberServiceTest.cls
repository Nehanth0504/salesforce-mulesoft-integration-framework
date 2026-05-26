@IsTest
private class MuleMemberServiceTest {

    @IsTest
    static void testMockCallout() {

        Test.setMock(
            HttpCalloutMock.class,
            new MuleMemberMock()
        );

        Test.startTest();

        String response =
            MuleMemberService.getMemberDetails('M001');

        Test.stopTest();

        System.assert(response.contains('John Smith'));
    }
}