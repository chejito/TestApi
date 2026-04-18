# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:10.0.202-alpine3.23-amd64@sha256:3754479711a70e8d75eb035a221c01313b4f699a24adf633cf76a5feca6dc133 AS build
WORKDIR /src

COPY ["TestApi.csproj", "./"]
RUN dotnet restore "TestApi.csproj"

COPY . .
RUN dotnet publish "TestApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:10.0-alpine3.23@sha256:1201dde897ab436b7c6b386f6dbd4f9a3ca0245f9c5a8aac8f8bcdccb4c7d484
WORKDIR /app

ENV ASPNETCORE_HTTP_PORTS=8000

COPY --from=build /app/publish .
EXPOSE 8000

ENTRYPOINT ["dotnet", "TestApi.dll"]
