public class MuleMemberQueueable implements Queueable, Database.AllowsCallouts {

    private String memberId;

    public MuleMemberQueueable(String memberId) {
        this.memberId = memberId;
    }

    public void execute(QueueableContext context) {

        try {

            String response =
                MuleMemberService.getMemberDetails(memberId);

            System.debug('Mule API Response: ' + response);

        } catch(Exception ex) {

            System.debug(
                'Queueable Integration Failure: ' +
                ex.getMessage()
            );
        }
    }
}