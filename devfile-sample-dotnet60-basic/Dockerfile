#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["devfile-sample-dotnet60-basic/app.csproj", "devfile-sample-dotnet60-basic/"]
COPY ["Dependency/Dependency.csproj", "Dependency/"]
RUN dotnet restore "devfile-sample-dotnet60-basic/app.csproj"
COPY . .
WORKDIR "/src/devfile-sample-dotnet60-basic"
RUN dotnet build "app.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "app.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "app.dll"]