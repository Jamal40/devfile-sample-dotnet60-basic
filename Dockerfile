FROM registry.access.redhat.com/ubi8/dotnet-60:6.0 AS build
WORKDIR /opt/app-root/src
COPY ["devfile-sample-dotnet60-basic/app.csproj", "devfile-sample-dotnet60-basic/"]
COPY ["Dependency/Dependency.csproj", "Dependency/"]
RUN dotnet restore "devfile-sample-dotnet60-basic/app.csproj"
COPY . .
WORKDIR "/opt/app-root/src/devfile-sample-dotnet60-basic"
RUN dotnet build "app.csproj" -c Release -o /app/build

FROM registry.access.redhat.com/ubi8/dotnet-60:6.0 as builder
WORKDIR /opt/app-root/src
COPY --chown=1001 . .
RUN dotnet publish -c Release


FROM registry.access.redhat.com/ubi8/dotnet-60:6.0
EXPOSE 8081
ENV ASPNETCORE_URLS=http://*:8081
COPY --from=builder /opt/app-root/src/bin /opt/app-root/src/bin
WORKDIR /opt/app-root/src/bin/Release/net6.0/publish
CMD ["dotnet", "app.dll"]