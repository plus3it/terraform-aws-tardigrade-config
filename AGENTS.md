# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module sets up AWS Config recording: a configuration recorder, a delivery channel, and a recorder status resource that turns recording on or off. The main input is the `config` object, which holds `configuration_recorder` settings (name, optional role ARN, recording group, and recording mode) and `delivery_channel` settings (S3 bucket, optional key prefix, KMS key, SNS topic, and snapshot frequency); without a role ARN, the module creates the AWS Config service-linked role. It outputs the recorder and delivery channel IDs as `config_recorder_id` and `config_delivery_channel_id`.
