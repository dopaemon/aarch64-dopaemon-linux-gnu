FROM fedora:latest

RUN dnf install -y \
        git-core \
        libtool \
        binutils \
        shtool \
        which \
        hostname \
        ccache \
        bc \
        gnupg \
        zip \
        curl \
        make \
        m4 \
        diffutils \
    && dnf clean all

CMD ["/bin/bash"]

RUN echo "maestroci" > /etc/hostname

RUN git clone --global user.name baalajimaestro 
RUN git clone --global user.email baalajimaestro@pixelexperience.org

RUN mkdir /build

COPY gcc_builder.sh /build

RUN git clone git://gcc.gnu.org/git/gcc.git /build/gcc --depth=1

CMD ["bash]