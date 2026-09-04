# Zabumba · Pandeiro — build helpers

SCORES_DIR := scores
PUBLIC_DIR  := static/scores

STEMS        := $(patsubst $(SCORES_DIR)/%.ly,%,$(wildcard $(SCORES_DIR)/*.ly))
SVG_TARGETS  := $(addprefix $(PUBLIC_DIR)/,$(addsuffix .cropped.svg,$(STEMS)))

.PHONY: all scores clean serve

all: scores

scores: $(SVG_TARGETS)

# LilyPond generates .cropped.svg (midi is a side-effect, removed after)
$(PUBLIC_DIR)/%.cropped.svg: $(SCORES_DIR)/%.ly
	@mkdir -p $(PUBLIC_DIR)
	lilypond -dbackend=svg -dcrop=#t -dno-point-and-click -o $(PUBLIC_DIR)/$* $<
	@rm -f $(PUBLIC_DIR)/$*.midi

clean:
	rm -f $(PUBLIC_DIR)/*.svg

serve:
	hugo server --buildDrafts --disableFastRender
