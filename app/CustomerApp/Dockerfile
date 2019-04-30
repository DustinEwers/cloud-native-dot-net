FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["CustomerApp/CustomerApp.csproj", "CustomerApp/"]
RUN dotnet restore "CustomerApp/CustomerApp.csproj"
COPY . .
WORKDIR "/src/CustomerApp"
RUN dotnet build "CustomerApp.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "CustomerApp.csproj" -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS final
EXPOSE 80
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CustomerApp.dll"]