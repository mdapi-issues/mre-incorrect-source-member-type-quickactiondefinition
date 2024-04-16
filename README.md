# mre-incorrect-source-member-type-quickactiondefinition

> Minimal reproducible example to demonstrate a bug in Source Tracking:
>
> When deleting a Global Action, `SourceMember.MemberType` is incorrectly reported as `QuickActionDefinition` instead of `QuickAction`.

[![Actions Status](https://github.com/mdapi-issues/mre-incorrect-source-member-type-quickactiondefinition/actions/workflows/default.yml/badge.svg?branch=main)](https://github.com/mdapi-issues/mre-incorrect-source-member-type-quickactiondefinition/actions?query=branch:main)

> [!IMPORTANT]
> A green status badge means the issue was successfully reproduced.

## Instructions

In a Scratch Org, delete the Global Action "New Group".
Then try to retrieve the change:

```console
$ sf project retrieve preview
Warning: Unable to find type QuickActionDefinition in registry

No conflicts found.

No files will be deleted.

No files will be retrieved.

No files were ignored. Update your .forceignore file if you want to ignore certain files.
```

> [!NOTE] `QuickActionDefinition` is not a valid Metadata Type and so it cannot be retrieved/deleted.

For comparison, when modifiying or creating a Global Action, the `SourceMember.MemberType` correctly shows up as `QuickAction` and the change can be retrieved:

```console
$ sf project retrieve preview
No conflicts found.

No files will be deleted.

Will Retrieve [1] files.
 Type        Fullname Path
 ─────────── ──────── ────────────────────────────────────────────────────────────────
 QuickAction NewNote  force-app/main/default/quickActions/NewNote.quickAction-meta.xml

No files were ignored. Update your .forceignore file if you want to ignore certain files.
```

The SourceMember records look like this:

```console
$ sf data query -t -q "SELECT MemberType, MemberName, IsNameObsolete, IsNewMember, Id, RevisionCounter FROM SourceMember ORDER BY RevisionCounter"
 MEMBERTYPE            MEMBERNAME ISNAMEOBSOLETE ISNEWMEMBER ID                 REVISIONCOUNTER
 ───────────────────── ────────── ────────────── ─────────── ────────────────── ───────────────
 QuickActionDefinition NewGroup   true           true        0MZ1w000006TfqUGAS 2
 QuickAction           NewNote    false          false       0MZ1w000006TfqZGAS 3
Total number of records retrieved: 2.
Querying Data... done
```
