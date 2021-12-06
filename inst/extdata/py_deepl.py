## inst/extdata/py_deepl.py
## python script for using DeepL API for translating

# Python Bibliothek 'DeepL' laden
import deepl

def py_deepl(x, lang):
  # Übersetzung mit DeepL API (Python)
  translator = deepl.Translator("c52a9c7d-3198-063c-2bbf-8f67173820ce:fx")
  result = translator.translate_text(x, target_lang = lang) 
  
  # Rückgabe der Daten
  return result
