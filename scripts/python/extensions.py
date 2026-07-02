from pathlib import Path
from base import *
import zipfile
import json
import urllib.request
import urllib.parse

def _check_extension_exists(extension_id: str) -> bool:
    encoded_id = urllib.parse.quote(extension_id)
    api_url = f"https://extensions.gnome.org/extension-query/?search={encoded_id}"
    
    try:
        with urllib.request.urlopen(api_url) as response:
            data = json.loads(response.read().decode())
            
        plugins = data.get("plugins", [])
        matched = next((p for p in plugins if p.get("uuid") == extension_id), None)
        
        if matched:
            return True
        else:
            return False
            
    except Exception as e:
        return False

def _download_extension(extension_id: str, version: str) -> tuple[bool,Path | None]:
    print(f"Resolving extension: {extension_id} version {version}")
    
    try:
        full_url = f"https://extensions.gnome.org/extension-data/{extension_id.replace("@","")}.v{version}.shell-extension.zip"
        target_zip = gnome_extension_dir / f"{extension_id}.zip"

        print(f"Downloading from: {full_url}")
        print(f"Saving to:       {target_zip}")
        
        urllib.request.urlretrieve(full_url, target_zip)
        print(f"Successfully downloaded {extension_id}!")
        return True, target_zip

    except Exception as e:
        print(f"An exception occurred while processing {extension_id}: {e}")
        return False, None

def _extract_extension_zip_file(extension_id: str) -> None:
    print(f"Extracting extension: {extension_id}")
    target_zip = gnome_extension_dir / f"{extension_id}.zip"
    extract_dir = gnome_extension_install_dir / extension_id
    extract_dir.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(target_zip, 'r') as zip_ref:
        zip_ref.extractall(extract_dir)
    

def setup_gnome_extensions() -> None:
    for metadata in gnome_extensions:
        id =  metadata.get("id")
        version = metadata.get("version")
        if not id or not version:  continue
        is_success, target = _download_extension(
            id,
            version,
        )

        if not is_success:
            continue

        is_success = _extract_extension_zip_file(id)
