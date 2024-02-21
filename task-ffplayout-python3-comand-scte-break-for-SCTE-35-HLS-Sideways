#!/usr/bin/python3

import json
import sys
import os
import subprocess
from datetime import datetime, timedelta
import pathlib

def execute_shell_command(command, success_file, error_file, current_user, current_clip, duration):
    try:
        # Substitui o marcador de posição {duration} no comando pelo valor correto
        command = command.format(duration=duration)

        # Executa o comando shell e captura a saída
        result = subprocess.run(command, shell=True, check=True, capture_output=True, text=True)

        # Adiciona a data, hora, nome do clipe e saída do comando à mensagem de sucesso
        success_content = f"Usuário: {current_user}\nData e Hora: {datetime.now()}\nNome do Clipe: {current_clip}\nComando Executado: {command}\nSaída do comando: {result.stdout}\n\n"

        # Salva a mensagem de sucesso em um arquivo
        save_to_txt('/usr/share/ffplayout', success_file, success_content)

    except subprocess.CalledProcessError as e:
        # Adiciona a data, hora, nome do clipe, comando executado e saída de erro à mensagem de erro
        error_content = f"Usuário: {current_user}\nData e Hora: {datetime.now()}\nNome do Clipe: {current_clip}\nComando Executado: {command}\nErro: {e.stderr}\nSaída de erro: {result.stderr}\n\n"

        # Salva a mensagem de erro em um arquivo
        save_to_txt('/usr/share/ffplayout', error_file, error_content)

def clean_old_files(directory, file_prefix, max_age_days):
    now = datetime.now()
    for file_path in pathlib.Path(directory).glob(f'{file_prefix}*.txt'):
        file_last_modified = datetime.fromtimestamp(file_path.stat().st_mtime)
        if now - file_last_modified > timedelta(days=max_age_days):
            # Apaga o arquivo se ele tiver mais de max_age_days dias
            file_path.unlink()

def save_to_txt(directory, filename, content):
    path = os.path.join(directory, filename)
    with open(path, 'a') as file:
        file.write(content)

if __name__ == '__main__':
    # Obter nome do usuário
    current_user = os.getenv('USER') or os.getenv('LOGNAME') or os.getenv('USERNAME')

    # Limpar arquivos antigos (mais de 30 dias) específicos para success_command e error_command
    clean_old_files('/usr/share/ffplayout', file_prefix='success_command_', max_age_days=30)
    clean_old_files('/usr/share/ffplayout', file_prefix='error_command_', max_age_days=30)

    # Verifica se há argumentos na linha de comando
    if len(sys.argv) > 1:
        try:
            input_data = json.loads(sys.argv[1]).get('current_media')
            if input_data is not None:
                media_source = input_data.get('source', '')
                duration_seconds = int(input_data.get('duration', 30))  # Se não houver 'duration', assume 30 segundos
                # Verifica se a palavra "break" está no nome da mídia
                if 'break' in media_source.lower():
                    # Substitua o comando abaixo pelo seu comando shell desejado
                    execute_shell_command('adbreak --pts 0 --duration {duration} --sidecar /usr/share/ffplayout/sidecar.txt', 'success_command.txt', 'error_command.txt', current_user, media_source, duration_seconds)
        except (json.JSONDecodeError, KeyError):
            pass  # Lidar com erros de decodificação JSON ou chaves ausentes
    else:
        pass  # Lidar com a situação de ausência de argumentos
