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
        "Follow the instructions at https://hubtel10.sharepoint.com/:fl:/g/contentstorage/CSP_e4c6235f-e0bc-485a-a485-2110ee65aaff/EQfjV2Ozj81FtBfpCyah22QBV-WN5ZoLgP1VTojvhEbGMw?e=fEua2D&nav=cz0lMkZjb250ZW50c3RvcmFnZSUyRkNTUF9lNGM2MjM1Zi1lMGJjLTQ4NWEtYTQ4NS0yMTEwZWU2NWFhZmYmZD1iJTIxWHlQRzVMemdXa2lraFNFUTdtV3Ffd0FhZWlBbmRMOUdpQzdQTWVLbUE4d3gwTUJLVGJEZVQ0U1ExUUNuT3g5RiZmPTAxQ0NaRkMzQUg0TkxXSE00UFpWQzNJRjdKQk1US0RXM0UmYz0lMkYmYT1Mb29wQXBwJnA9JTQwZmx1aWR4JTJGbG9vcC1wYWdlLWNvbnRhaW5lciZ4PSU3QiUyMnclMjIlM0ElMjJUMFJUVUh4b2RXSjBaV3d4TUM1emFHRnlaWEJ2YVc1MExtTnZiWHhpSVZoNVVFYzFUSHBuVjJ0cGEyaFRSVkUzYlZkeFgzZEJZV1ZwUVc1a1REbEhhVU0zVUUxbFMyMUJPSGQ0TUUxQ1MxUmlSR1ZVTkZOUk1WRkRiazk0T1VaOE1ERkRRMXBHUXpORU5rRllUelpLUkU1Q1VEVkJNbFpGTjFsVFZFMDJVVVZHTXclM0QlM0QlMjIlMkMlMjJpJTIyJTNBJTIyZWNjNDQyNzAtMWM2Zi00OTFlLTljZDQtZjhkYTEwMDFkNzMxJTIyJTdE to add this key to your server.");
  }
}
