## ./py/py_deepl.py
## python script for using deepl api for translating

import deepl

def py_deepl(x, lang):
  translator = deepl.Translator("c52a9c7d-3198-063c-2bbf-8f67173820ce:fx")
  result = translator.translate_text(x, target_lang = lang) 

  return result
