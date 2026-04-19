# Adoption Guide

## How to use this repository well

This project is intentionally small. The best adoption pattern is:

1. take `core/karpathy-anycoding.md` as the behavioral base
2. merge it with your repository's real engineering rules
3. use the closest adapter for your tool
4. keep the behavioral layer short so it stays influential

## Recommended merge pattern

Keep three layers separate when possible:

1. tool behavior rules
2. repository-specific engineering rules
3. task-specific instructions

This project covers layer 1.

## Good additions from your own repository

- preferred language or framework patterns
- testing requirements
- code review expectations
- security constraints
- performance constraints
- deployment rules

## What not to add here

- tool-specific plugin wiring as the primary format
- long framework tutorials
- repository-specific commands from unrelated projects
- broad style guides that drown out the core behavior
