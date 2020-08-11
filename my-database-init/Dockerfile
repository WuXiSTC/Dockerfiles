FROM mwendler/wget

WORKDIR /sql

RUN wget --no-check-certificate https://github.com/yindaheng98/TheCalendars/raw/master/CalendarsDB.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/WebSiteAnalysisKit/raw/master/MoniterData.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/WebSiteAnalysisKit/raw/master/MoniterDatabase.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/ParkingMoney/raw/master/CarsData.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/FarmstayInfoSys/raw/master/City.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/FarmstayInfoSys/raw/master/create.sql && \
    wget --no-check-certificate https://github.com/yindaheng98/iQRGenuine/raw/master/create_insert.sql

FROM mysql:8

COPY --from=0 /sql /docker-entrypoint-initdb.d
