# 🥋 Aniverse Karate - API Testing Suite

Bienvenido al dojo de testing para **Aniverse**, un sistema donde los usuarios pueden registrarse, iniciar sesión y gestionar su colección de animes favoritos.  
Este repositorio contiene las pruebas automatizadas de API usando el framework **Karate**.

---

## 🚀 ¿Qué contiene este proyecto?

- 🔨 Proyecto generado con **Maven** usando el archetype oficial de Karate
- 🧪 Estructura de pruebas listas para expandir
- 🗂️ Organización basada en **MVC y buenas prácticas**
- 🧠 Pruebas orientadas a escenarios reales con **Cucumber-like syntax**

---

## ⚙️ Setup del entorno

### Requisitos previos

- Java 17 o superior (Se utilizó JDK 23)
- Apache Maven (Instalado desde [maven.apache.org](https://maven.apache.org/download.cgi))
- Git (opcional para control de versiones)
- Visual Studio Code con las extensiones:
  - 🌿 Java Extension Pack
  - 🥒 Cucumber (Gherkin) Syntax
  - 🥋 Karate Runner

---

## 🏗️ Crear el proyecto

```bash
mvn archetype:generate \
  -DarchetypeGroupId=io.karatelabs \
  -DarchetypeArtifactId=karate-archetype \
  -DarchetypeVersion=1.5.1 \
  -DgroupId=com.mycompany \
  -DartifactId=Aniverse-karate