library internal_ssh_integration;

import 'dart:io';

class SSHKeyGenerator {
  static Future<void> generateSSHKey() async {
    print("\nRunning SSH key generation...\n");

    // Define the path to the SSH key
    var homeDir = Platform.environment['HOME'];
    var sshKeyPath = '$homeDir/.ssh/id_rsa';

    // Check if the SSH key already exists
    if (!await File(sshKeyPath).exists()) {
      print("SSH key not found, generating one...");

      // Generate the SSH key
      await Process.run('ssh-keygen',
          ['-t', 'rsa', '-b', '2048', '-f', sshKeyPath, '-N', '']);
    } else {
      print("SSH key already exists.");
    }

    print("");

    // Read and print the public key
    print("Your public SSH key is:");
    print((await File("$sshKeyPath.pub").readAsString()).trim());

    // Print instructions for the user
    print("\nCopy the public key above to your clipboard.\n"
        "Follow the instructions at http://bit.ly/3SotbOH to add this key to your server.");
  }
}
