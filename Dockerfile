FROM python:3.10-bookworm
RUN useradd --system --home /home/rel --create-home --user-group rel
USER rel
WORKDIR /home/rel
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY ./src .
RUN python -m REL.server --init ./data wiki_2019 --ner-model ner-fast
COPY --chown=rel:rel ./start.sh .
RUN chmod +x ./start.sh
EXPOSE 5555
CMD ["./start.sh"]
