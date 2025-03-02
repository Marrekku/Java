#!/bin/bash

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_BASE_NAME="gradle"
APP_HOME="$(dirname "$(readlink -f "$0")")"
APP_NAME="gradle"
APP_PATH="$APP_HOME/gradlew"

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$APP_NAME: $*"
}

die () {
    echo "$APP_NAME: $*"
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "$OSTYPE" in
  msys*)
    msys=true
    ;;
  cygwin*)
    cygwin=true
    ;;
  darwin*)
    darwin=true
    ;;
  bsd*)
    nonstop=true
    ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched.
if [ "$cygwin" = "true" ]; then
  APP_HOME=$(cygpath --unix "$APP_HOME")
fi

# Attempt to set APP_HOME to an absolute path, resolving any symlinks where the wrapper is located.
APP_HOME=$(cd "$(dirname "$0")"; pwd)

# Check that target executable exists.
if [ ! -x "$APP_HOME/gradle/wrapper/gradle-wrapper.properties" ]; then
    die "Gradle wrapper properties file has not been generated."
fi

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ]; then
    if [ "$cygwin" = "true" ]; then
        JAVA_EXE=$(cygpath --unix "$JAVA_HOME/bin/java")
    else
        JAVA_EXE="$JAVA_HOME/bin/java"
    fi
else
    JAVA_EXE="java"
fi

# By default we specify that if the --add-exports option is supported, we should
# add the necessary exports to make Gradle work with Java 9+.
if [ "$JAVA_EXE" = "java" ] && [ "$darwin" = "true" ]; then
  # Add some extra JVM options to help customize the JVM for Gradle use
  GRADLE_OPTS="$GRADLE_OPTS --add-exports=java.base/sun.nio.ch=ALL-UNNAMED --add-exports=jdk.internal.vm=ALL-UNNAMED --add-exports=jdk.internal.vm.annotation=ALL-UNNAMED --add-exports=jdk.internal.vm.ci=ALL-UNNAMED"
fi

# Collect JVM input arguments.
JVM_OPTS=()

# Add JVM options from the GRADLE_OPTS environment variable.
if [ ! -z "$GRADLE_OPTS" ]; then
    JVM_OPTS+=("$GRADLE_OPTS")
fi

# Add JVM options from the JAVA_OPTS environment variable.
if [ ! -z "$JAVA_OPTS" ]; then
    JVM_OPTS+=("$JAVA_OPTS")
fi

# Add default JVM options from environment variable DEFAULT_JVM_OPTS, if any.
if [ ! -z "$DEFAULT_JVM_OPTS" ]; then
    JVM_OPTS+=("$DEFAULT_JVM_OPTS")
fi

# For Cygwin, switch paths to Windows format before running java under the shell.
if [ "$cygwin" = "true" ]; then
  APP_HOME=$(cygpath --path --windows "$APP_HOME")
fi

# Start the JVM.
exec "$JAVA_EXE" "${JVM_OPTS[@]}" -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.properties" org.gradle.wrapper.GradleWrapperMain "$@"
