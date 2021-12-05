\name{translate}
\alias{translate}
\title{Translating text}
\description{
\sQuote{translate} is translating text with deepl api (www.deepl.com).
}
\usage{
translate(text, target_lang)
}
\arguments{
\tabular{rll}{
\tab \code{text} \tab text which should be translated.\cr\cr
\tab \code{target_lang} \tab to which language the text should be translated.\cr
\tab \tab \code{BG} for Bulgarian.\cr
\tab \tab \code{CS} for Czech.\cr
\tab \tab \code{DA} for Danish.\cr
\tab \tab \code{DE} for German.\cr
\tab \tab \code{EL} for Greek.\cr
\tab \tab \code{EN} for English.\cr
\tab \tab \code{ES} for Spanish.\cr
\tab \tab \code{ET} for Estonian.\cr
\tab \tab \code{FI} for Finnish.\cr
\tab \tab \code{FR} for French.\cr
\tab \tab \code{HU} for Hungarian.\cr
\tab \tab \code{IT} for Italian.\cr
\tab \tab \code{JA} for Japanese.\cr
\tab \tab \code{LT} for Lithuanian.\cr
\tab \tab \code{LV} for Latvian.\cr
\tab \tab \code{NL} for Dutch.\cr
\tab \tab \code{PL} for Polish.\cr
\tab \tab \code{PT} for Portuguese.\cr
\tab \tab \code{RO} for Romanian.\cr\
\tab \tab \code{RU} for Russian.\cr
\tab \tab \code{SK} for Slovak.\cr
\tab \tab \code{SL} for Slovenian.\cr
\tab \tab \code{SV} for Swedish.\cr\
\tab \tab \code{ZH} for Chinese.\cr\cr
}
}
\source{
Some code was used from the github project \sQuote{paulcbauer/deeplr}, you find it here: \url{https://github.com/paulcbauer/deeplr}
}
\examples{
library(ourdata)

# From German to English
translate(text = "Dies ist ein Test.", target_lang = "EN")

# Short form
translate("Dies ist ein Test.", "EN")
}
