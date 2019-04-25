@IsTest
class XC_PostSandboxCopyTest {

    @IsTest
    static void testMySandboxPrep() {
        Test.startTest();

        Test.testSandboxPostCopyScript(
            new XC_PostSandboxCopy(), UserInfo.getOrganizationId(),
                UserInfo.getOrganizationId(), UserInfo.getOrganizationName());

        Test.stopTest();

		for(User u : [
			SELECT Id, EMail 
			FROM User 
			WHERE Profile.Name = 'System Administrator' AND IsActive = TRUE
		]) {
			System.assert(!u.Email.endsWith('@example.com') && !u.Email.endsWith('.invalid'));
		}
    }
}