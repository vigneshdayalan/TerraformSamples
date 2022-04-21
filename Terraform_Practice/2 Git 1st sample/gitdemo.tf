terraform {
  required_providers {
    github = {
      source = "integrations/github"

    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "viki_repo" {
  name        = "git-terraform-try"
  description = "My awesome codebase"

  visibility = "public"
}
