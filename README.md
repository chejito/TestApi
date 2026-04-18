# Test API for GitHub Actions

This is a test API project for GitHub Actions.

## Build

```bash
dotnet build TestApi.sln
```

## Run

```bash
dotnet run --project TestApi.csproj
```

## Test

```bash
dotnet test TestApi.sln --disable-build-servers
```

## Docker

```bash
docker build -t test-api:latest .
docker run -p 8000:8000 test-api:latest
```
