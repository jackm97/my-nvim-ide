FROM public.ecr.aws/docker/library/rockylinux:9 as dev-tools-rocky

# This will provide clipboard integration in neovim
RUN dnf install epel-release -y
RUN dnf install wl-clipboard xclip -y

RUN dnf group install "Development Tools" -y
RUN dnf install llvm-toolset gcc-fortran -y

# ----------------------------------

FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable as dev-tools-ubu

RUN apt update && apt install wl-clipboard xclip wget curl -y

# ----------------------------------

FROM dev-tools-rocky as user-init-scripts

COPY user-init-scripts /etc/user-init-scripts
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/*" | xargs chmod +x
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/profile.d/*" | xargs -I'{}' ln -s '{}' /etc/profile.d
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/bin/*" | xargs -I'{}' ln -s '{}' /usr/bin

# ----------------------------------

FROM user-init-scripts as my-nvim-ide:rocky9
ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]

# ----------------------------------

FROM dev-tools-ubu as my-nvim-ide:ubu22.04
COPY --from=user-init-scripts /etc/user-init-scripts /etc/user-init-scripts
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/*" | xargs chmod +x
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/profile.d/*" | xargs -I'{}' ln -s '{}' /etc/profile.d
RUN find /etc/user-init-scripts -type f -wholename "/etc/user-init-scripts/bin/*" | xargs -I'{}' ln -s '{}' /usr/bin

ENTRYPOINT ["/etc/user-init-scripts/entrypoint.sh"]
