## terraform-aws-tardigrade-config Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### [4.2.1](https://github.com/plus3it/terraform-aws-tardigrade-config/releases/tag/4.2.1)

**Released**: 2025.03.24

**Summary**:

*   Fixes delivery_frequency parameter usage and updates test to verify

### [4.2.0](https://github.com/plus3it/terraform-aws-tardigrade-config/releases/tag/4.2.0)

**Released**: 2024.11.07

**Summary**:

*   Supports configuring recording_mode for continuous vs periodic recording

### [4.1.0](https://github.com/plus3it/terraform-aws-tardigrade-config/releases/tag/4.1.0)

**Released**: 2024.09.04

**Summary**:

*   Allows user to specify role_arn for config recorder

### [4.0.0](https://github.com/plus3it/terraform-aws-tardigrade-config/releases/tag/4.0.0)

**Released**: 2023.12.26

**Summary**:

*   Adds native support for excluded or included resource types
*   Supports all features available as of terraform-provider-aws v5.31.0
*   Uses service-linked-role exclusively, removing custom IAM role

### 3.0.2

**Released**: 2022.06.03

**Commit Delta**: [Change from 3.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/3.0.1...3.0.2)

**Summary**:

*   Uses newer service role policy as prior policy is being deprecated

### 3.0.1

**Released**: 2021.08.05

**Commit Delta**: [Change from 3.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/3.0.0...3.0.1)

**Summary**:

*   Updates list of all resource types with new types.

### 3.0.0

**Released**: 2020.11.18

**Commit Delta**: [Change from 2.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/2.0.0...3.0.0)

**Summary**:

*   Removes `account_id` variable; instead using a data source to lookup the value.

### 2.0.0

**Released**: 2020.10.08

**Commit Delta**: [Change from 1.0.7 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.7...2.0.0)

**Summary**:

*   Removes module-wide "create/enable" variable. Insttead, use module-level count/for_each
    to disable the entire module.

### 1.0.7

**Released**: 2020.05.28

**Commit Delta**: [Change from 1.0.6 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.6...1.0.7)

**Summary**:

*   Revert naming scheme

### 1.0.6

**Released**: 2020.05.26

**Commit Delta**: [Change from 1.0.5 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.5...1.0.6)

**Summary**:

*   Add support for excluding specific resource types

### 1.0.5

**Released**: 2020.05.22

**Commit Delta**: [Change from 1.0.4 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.4...1.0.5)

**Summary**:

*   Add support for recording specific resource types

### 1.0.4

**Released**: 2019.10.28

**Commit Delta**: [Change from 1.0.3 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.3...1.0.4)

**Summary**:

*   Pins tfdocs-awk version
*   Updates Make targets for documentation generation and linting
*   Adds documentation to test modules
*   Minor changelog fixup

### 1.0.3

**Released**: 2019.10.17

**Commit Delta**: [Change from 1.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.2...1.0.3)

**Summary**:

*   Adds ability to auto approve and merge Dependabot PRs

### 1.0.2

**Released**: 2019.10.02

**Commit Delta**: [Change from 1.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.1...1.0.2)

**Summary**:

*   Update testing harness to have a more user-friendly output
*   Update terratest dependencies

### 1.0.1

**Released**: 2019.09.19

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/1.0.0...1.0.1)

**Summary**:

*   Fix terratest/install in makefile to reference the correct directory

### 1.0.0

**Released**: 2019.09.11

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-config/compare/0.0.0...1.0.0)

**Summary**:

*   Upgrade to terraform 0.12.x
*   Add test cases

### 0.0.0

**Commit Delta**: N/A

**Released**: 2019.08.13

**Summary**:

*   Initial release!
