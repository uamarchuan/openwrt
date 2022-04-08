#!/usr/bin/env bash

git fetch --all
git checkout upstream/ipq807x-5.15
git branch -D ipq807x-5.15
git push origin :ipq807x-5.15
git switch -c ipq807x-5.15
git push origin ipq807x-5.15 --force

#git switch -c mybuild-new
git switch -c git switch -c mybuild-$(date +%F)

# git reset --soft HEAD~1

# git cherry-pick 

# git cherry-pick 439f3be3c02be6ac046beb9ade26e5f6bcb631b0
# git cherry-pick 4f6bedd886fed734a3d54a834b76cedaa8311893
# git cherry-pick 267ab350048b86e83f5cf4326a7e3f8eb0b19687
# git cherry-pick 4eb349e60c76fe92c3204d6a8ee98997528ce955
# git cherry-pick 05a6c4eff0c66252b7d352402ae3d928c24bfa79
# git cherry-pick 04e45182e6066495368eed7227e22ade92be231c
# git cherry-pick 30bb99c14d5b8fe49c824d47b6c9141b120d37f2