FROM public.ecr.aws/docker/library/rockylinux:9 as user-init-scripts

COPY user-init-scripts /etc/user-init-scripts
COPY project-manifests /etc/project-manifests
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/*" | xargs chmod +x
RUN mkdir /etc/profile.d.links -p
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/profile.d/*" | xargs -I'{}' ln -s '{}' /etc/profile.d.links



FROM scratch as base
COPY --from=user-init-scripts /etc/user-init-scripts /etc/user-init-scripts
COPY --from=user-init-scripts /etc/project-manifests /etc/project-manifests
COPY --from=user-init-scripts /etc/profile.d.links /etc/profile.d

ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]


FROM public.ecr.aws/docker/library/rockylinux:9 as rocky-base
RUN dnf group install "Development Tools" -y
RUN dnf install llvm-toolset gcc-fortran -y
RUN dnf install which -y

FROM base as my-nvim-ide:rocky9
COPY --from=rocky-base / /


FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable as ubu-base
RUN apt update && apt install wget curl -y
RUN apt install build-essential clang llvm-dev -y

FROM base as my-nvim-ide:ubu22.04
COPY --from=ubu-base / /

