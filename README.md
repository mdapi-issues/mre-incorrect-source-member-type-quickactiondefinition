# mre-incorrect-source-member-type-quickactiondefinition

> Minimal reproducible example to demonstrate when deleting a Global Action `SourceMember.MemberType` is incorrectly reported as `QuickActionDefinition` instead of `QuickAction`.

```console
$ sf project retrieve preview
```

Modify or create a Global Action:

Delete a Global Action:

No conflicts found.

No files will be deleted.

Will Retrieve [1] files.
Type Fullname Path
─────────────────────────── ──────── ────
StandardValueSetTranslation 38-en_US

````

```console
sf project retrieve -m StandardValueSetTranslation:AccountContactRole-en_US
````
