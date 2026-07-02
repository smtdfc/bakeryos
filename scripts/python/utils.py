import subprocess
import sys


def run_command_and_stream(command: str | list[str], cwd:str | None = None) -> int:
    print("--------------------------------------------------")

    try:
        # Launch the subprocess
        # stdout=subprocess.PIPE allows us to capture the standard output
        # stderr=subprocess.STDOUT redirects error stream into the stdout stream so we catch both
        process = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True, # Automatically decodes bytes to string (no need for .decode())
            shell=True if isinstance(command, str) else False,
            cwd=cwd
        )

        for chunk in iter(lambda: process.stdout.read(1), ''):
            sys.stdout.write(chunk)
            sys.stdout.flush()

        return process.wait()

    except Exception as e:
        print(f"An error occurred while executing command: {e}")
        return -1

