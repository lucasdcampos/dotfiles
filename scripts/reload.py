import os
import shutil
import pwd

def get_current_user():
    """Return the current username."""
    return pwd.getpwuid(os.getuid()).pw_name

def copy_file(src, dest):
    """Copy a single file from src to dest."""
    try:
        shutil.copy2(src, dest)
        print(f"File '{os.path.basename(src)}' copied to '{dest}'")
    except Exception as e:
        print(f"Error copying file '{os.path.basename(src)}': {e}")

def copy_dotfiles_files(dotfiles_dir, home_dir):
    """Copy individual dotfiles (files starting with '.') from dotfiles_dir to home_dir."""
    for f in os.listdir(dotfiles_dir):
        file_path = os.path.join(dotfiles_dir, f)
        if os.path.isfile(file_path) and f.startswith('.'):
            home_path = os.path.join(home_dir, f)
            copy_file(file_path, home_path)

def create_directory_if_not_exists(directory):
    """Create a directory if it doesn't already exist."""
    if not os.path.exists(directory):
        os.makedirs(directory)

def copy_config_directory(dotfiles_dir, home_dir):
    """Copy the .config directory from dotfiles_dir to home_dir, preserving its structure."""
    config_dir = os.path.join(dotfiles_dir, '.config')
    if os.path.isdir(config_dir):
        home_config_dir = os.path.join(home_dir, '.config')
        
        # Ensure the home .config directory exists
        create_directory_if_not_exists(home_config_dir)

        # Walk through the .config directory and copy all files and subdirectories
        for root, dirs, files in os.walk(config_dir):
            rel_dir = os.path.relpath(root, config_dir)
            home_sub_dir = os.path.join(home_config_dir, rel_dir)
            create_directory_if_not_exists(home_sub_dir)

            # Copy all files in the current directory
            for file in files:
                file_path = os.path.join(root, file)
                home_file_path = os.path.join(home_sub_dir, file)
                copy_file(file_path, home_file_path)

def copy_dotfiles():
    """Main function to copy all dotfiles and the .config folder to the user's home directory."""
    current_user = get_current_user()
    dotfiles_dir = '.dotfiles'
    home_dir = f'/home/{current_user}'

    if not os.path.exists(dotfiles_dir):
        print(f'Directory {dotfiles_dir} not found!')
        return

    # Copy individual dotfiles
    copy_dotfiles_files(dotfiles_dir, home_dir)

    # Copy the .config directory
    copy_config_directory(dotfiles_dir, home_dir)

    print("Success! Use 'zsh' to reload your shell")

if __name__ == "__main__":
    copy_dotfiles()
