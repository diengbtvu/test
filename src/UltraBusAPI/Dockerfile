# Dockerfile for UltraBusAPI
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["UltraBusAPI/UltraBusAPI.csproj", "UltraBusAPI/"]
RUN dotnet restore "./UltraBusAPI/UltraBusAPI.csproj"
COPY . .
WORKDIR "/src/UltraBusAPI"
RUN dotnet build "./UltraBusAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./UltraBusAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "UltraBusAPI.dll"]
