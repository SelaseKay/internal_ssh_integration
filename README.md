# internal_ssh_integration

Help developers generate ssh keys and directions on how to use them to interact with internal sdk's

## What It does?
- [x] Generates ssh key using `ssh-keygen` command
- [x] Provides a link with instructions on how to use the generated ssh key to interact with internal sdk's

## How to Use?

Add Internal SSH Integration to your `pubspec.yaml` in `dev_dependencies:` section.
```yaml
dev_dependencies:
  internal_ssh_integration:
  git:
    url: https://github.com/hubtel/internal_ssh_integration.git
    ref: v1.0.6
```


Update dependencies
```
flutter pub get
```
Run this command to get your ssh key and a link on what to do next.

```
flutter pub run internal_ssh_integration:main
```
