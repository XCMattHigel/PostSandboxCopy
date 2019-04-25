global class XC_PostSandboxCopy implements SandboxPostCopy {
    
	global void runApexClass(SandboxContext context) {
		List<User> admins = [
			SELECT Id, Email 
			FROM User 
			WHERE Profile.Name = 'System Administrator' 
			AND IsActive = TRUE
		];

		for(User admin : admins) {
			if(admin.Email.endsWith('.invalid')) {
				admin.Email = admin.Email.replace('.invalid', '');
			} else if(admin.Email.endsWith('@example.com')) {
				admin.Email = admin.Email.replace('=', '@');
				admin.Email = admin.Email.replace('@example.com', '');
			}
		}

		update admins;
    }
}