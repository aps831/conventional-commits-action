# Conventional Commits action

This action calculate the next version number based on conventional commits. It is a wrapper around
[conventional_commits_next_version](https://gitlab.com/DeveloperC/conventional_commits_next_version).

## Inputs

## `calculation-mode`

**Optional** The calculation mode

## `from-version`

**Required** The from version

## `from-reference`

**Required** The from reference

## Outputs

## `next-version`

The next version

## Example usage

```yaml
uses: aps831/conventional-commits-action@${TAG}
with:
    from-version: 0.3.0
    from-reference: v0.3.0
```
