sed -i '/RUN\ \-\-mount\=type\=cache\,target\=\/root\/\.elan.*/d' Dockerfile
sed -i '/curl\ https\:\/\/raw\.githubusercontent\.com\/leanprover.*/d' Dockerfile
sed -i '/default\-toolchain\ leanprover.*/d' Dockerfile
sed -i '/RUN\ lake\ \+leanprover\-community.*/d' Dockerfile
sed -i '/RUN\ curl\ \-L\ https\:\/\/raw\.githubusercontent\.com\/leanprover.*/d' Dockerfile
sed -i '/elan\ default.*/d' Dockerfile
sed -i '/RUN\ lake\ exe\ cache\ get.*/d' Dockerfile
sed -i '/RUN\ echo\ \"import\ Mathlib\.Data\.Real\.Basic.*/d' Dockerfile
sed -i '/RUN\ lake\ lean\ ProjectName.*/d' Dockerfile
sed -i '/RUN\ rm\ \-rf\ \/build\/new_project\/project_name.*/d' Dockerfile
sed -i '/build\/new_project\/project_name\/\.lake\/packages.*/d' Dockerfile
sed -i '/RUN\ pip\ install\ playwright.*/d' Dockerfile
sed -i '/python3\ \-m\ playwright\ install.*/d' Dockerfile
sed -i '/python3\ \-m\ playwright\ install\-deps.*/d' Dockerfile
sed -i '/from\=builder\ \/opt\/lean_installation.*/d' Dockerfile
sed -i '/from\=builder\ \/build\/new_project\/project_name.*/d' Dockerfile