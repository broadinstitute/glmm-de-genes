FROM jupyter/datascience-notebook
MAINTAINER kdgosik@gmail.com
VOLUME /home/jovyan/work
USER root

#########
### Install Utilities
#########
RUN apt-get update && apt-get install -y gcc g++ perl automake make cmake less vim nano fort77 \
                                        wget git curl bsdtar bzip2 gfortran unzip ftp \
                                        libpng-dev libjpeg-dev libgsl0-dev bzip2 \
                                        libbz2-dev liblzma-dev libcurl4-openssl-dev \
                                        texlive-latex-base default-jre build-essential


## Get fastlmm ##################
RUN pip install mkl==2019.0 
RUN pip install pysnptools --no-use-pep517 
RUN pip install fastlmm --no-use-pep517
RUN pip install pyannotables pegasuspy
RUN pip install bokeh --upgrade


## Get Bcftools ##################
RUN git clone git://github.com/samtools/htslib.git /usr/local/src/htslib && \
  git clone git://github.com/samtools/bcftools.git /usr/local/src/bcftools && \
  cd /usr/local/src/bcftools && \
  make && make install && \
  cd /


## Get Samtools ##################
RUN wget -O /usr/local/src/samtools-1.10.tar.bz2 https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 && \
  cd /usr/local/src && \
  tar xvjf samtools-1.10.tar.bz2 && \
  cd samtools-1.10 && \
  ./configure --without-curses && \
  make && make install && \
  cd /


## Get Plink and Plink2 ####################
COPY plink /usr/local/bin/
COPY plink2 /usr/local/bin/


## Get BOLT-LMM ##################
COPY bolt /usr/local/bin/
ENV LD_LIBRARY_PATH=/opt/conda/lib/


## Switch Back to Notebook User
USER $NB_USER
WORKDIR /home/jovyan/work

