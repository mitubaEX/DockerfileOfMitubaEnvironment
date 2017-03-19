FROM java:8

RUN apt-get -yq update && apt-get -yq upgrade
RUN apt-get install -y zsh git wget tree vim
RUN apt-get install -y --reinstall make
RUN apt-get install -y --reinstall gcc



# java
#RUN apt-get install -y software-properties-common python-software-properties
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get -yq update
#RUN apt-get install -y oracle-java8-installer

# bash
#RUN git clone https://github.com/mitubaEX/bash_profile.git ~/bash_profile
#RUN cp ~/bash_profile/.bash* ~/.
RUN echo "alias ls='ls -G'" > ~/.bashrc
RUN echo "alias e='exit'" >> ~/.bashrc
#RUN git clone https://github.com/git/git.git ~/git
#RUN cp ~/git/contrib/completion/* ~/.
#RUN mv ~/git-completion.bash ~/.git-completion.bash


# zsh
RUN echo "exec /bin/zsh" >> ~/.bashrc
RUN git clone https://github.com/mitubaEX/zsh_list.git ~/zsh_list
RUN cp ~/zsh_list/.zsh* ~/.
RUN chsh -s /bin/zsh

# vim
#RUN mkdir -p .vim/bundle
RUN curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
RUN sh ./install.sh
RUN git clone https://github.com/mitubaEX/vim_list.git ~/vim_list
RUN cp ~/vim_list/.vimrc ~/.
RUN sed -i -e 's/Users\/mituba/\/root/g' ~/.vimrc

RUN sed -i -e "22i NeoBundle 'Shougo/vimshell.vim'" ~/.vimrc
RUN sed -i -e "22i NeoBundle 'Shougo/vimproc'" ~/.vimrc
RUN sed -i -e "22i NeoBundle 'Shougo/unite.vim'" ~/.vimrc

RUN sed -i -e "88i nnoremap \<C-n\> :tabnew\<Enter\>:VimShell\<Enter\>" ~/.vimrc
RUN sed -i -e "88i nnoremap \<C-n\> \<Nop\>" ~/.vimrc
RUN sed -i -e "88i inoremap \<tab\> gt" ~/.vimrc

# working dir
RUN git clone https://github.com/mitubaEX/AizuOnlineJudgeMituba.git ~/AizuOnlineJudgeMituba
RUN cd ~/AizuOnlineJudgeMituba
RUN git config --global user.email "g1344955@cse.kyoto-su.ac.jp"
RUN git config --global user.name "mitubaEX"


RUN echo "cd ~/.vim/bundle/vimproc" > ~/make.sh
RUN echo "make -f make_unix.mak" >> ~/make.sh
