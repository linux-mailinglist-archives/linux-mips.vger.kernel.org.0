Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BEC3B996F
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 01:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234226AbhGAXfx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 19:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbhGAXfw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jul 2021 19:35:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B1EC061762
        for <linux-mips@vger.kernel.org>; Thu,  1 Jul 2021 16:33:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t17so14929670lfq.0
        for <linux-mips@vger.kernel.org>; Thu, 01 Jul 2021 16:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=wSSSPY+fOInubov3s8wrb1TdoenQo1V+VQz34P1PA9k=;
        b=rEKnzOBy2hKon+33ZuswJQ4s1uFgYEtbPuf7vHqnji/vQ0JGEFURmbLrfrrMAEoy74
         Unz9SLoKbCJwKS+eGHkc09/ddihlZCVvYBBHYhsiHWXoz+CjoEpXdM0hLFDwYVUyEZQ3
         sdUDt0InyabPQ2GeY4xUOBQ5pAeDlEC7ibgUMg/Pm83RJHR8XoyAIyG/CVlhmBl6bKm8
         oDkocF1b1HWdpjvUXAOcG7B6ZLYBEvNflN0O6tFVzg/W6jCoyf/7XP8RtXiZjdM2Jcrq
         /4g7sAgrxNGc0LqseR5tFB27rZsim5/LXaZ04B2R+U2wJMP8IoMhjrF+4unhUbW67Esu
         aKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=wSSSPY+fOInubov3s8wrb1TdoenQo1V+VQz34P1PA9k=;
        b=o4Gw0xF1xuXIXss9ql+2O2tI1g1+AuzIkrV+kmLVmSMMey7WBKnb14NRXf3Uqa6mgH
         0w5LtuQn+fCeMphNdY+HqpIj7WcqqCFI6+xi6HedE/tXZNa6uti22nzTNDLoMnfJUiVX
         /UVMCna8kQNjjUhRoFJROpOKGN3OjkXR60dDNkM64lrQdiari62mecwJsw2aXca20VqP
         eGiLQwQ+PD+DwgvZH3kx10reA7OWq45MX9BoVawKKrkYw0bgf5UhuN2lXiVE5s1L6UId
         UIgNJ50T74+FY3iggQ1WY1EeWETvQ6XpfeWOiP8HoIoMaA/YkP3vF4hmWaSHpEBbg9S+
         OzTQ==
X-Gm-Message-State: AOAM533rt6kKf6D56gdB7oEI7Ph/nOxnMc2uGdv41L6E2ESvxNapCMWF
        p/kccPh1ew1GNZbyfrkCThNUO6Ke5Fq+eSQ25cU3PQ==
X-Google-Smtp-Source: ABdhPJzXlSgPQs6WeeSsZgaBkkqRaRjtnk87rG3H+c1G7+Fcsta7tPq7x970v12eVpPFJqwfu7Bor2nkXgcVHtfO/1c=
X-Received: by 2002:ac2:5237:: with SMTP id i23mr1592162lfl.29.1625182398230;
 Thu, 01 Jul 2021 16:33:18 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jul 2021 01:33:07 +0200
Message-ID: <CACRpkdadLCD=LEkq7jj6gu_XyDH5qvfoq3ABAyLU0hk+qPzsAQ@mail.gmail.com>
Subject: [GIT PULL] bulk pin control changes for v5.14
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

here is the pin control pull request for v5.14.

Not so much going on. No core changes, just drivers. The
details in the signed tag. The most interesting would be that
MIPS Ralink is migrating to pin control and we have some
bindings but not yet code for the Apple M1 pin controller.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5=
:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.14-1

for you to fetch changes up to bfa50166cd9d5d190b20dc33d1ec7ae19ced7022:

  pinctrl: ralink: rt305x: add missing include (2021-06-30 02:38:56 +0200)

----------------------------------------------------------------
This is the bulk of pin control changes for the v5.14 kernel:

New drivers:

- Last merge window we created a driver for the Ralink RT2880.
  We are now moving the Ralink SoC pin control drivers out of the MIPS
  architecture code and into the pin control subsystem. This concerns
  RT288X, MT7620, RT305X, RT3883 and MT7621.

- Qualcomm SM6125 SoC pin control driver.

- Qualcomm spmi-gpio support for PM7325.

- Qualcomm spmi-mpp also handles PMI8994 (just a compatible string)

- Mediatek MT8365 SoC pin controller.

- New device HID for the AMD GPIO controller.

Improvements:

- Pin bias config support for a slew of Renesas pin controllers.

- Incremental improvements and non-urgent bug fixes to the Renesas
  SoC drivers.

- Implement irq_set_wake on the AMD pin controller so we can wake
  up from external pin events.

Misc:

- Devicetree bindings for the Apple M1 pin controller, we will probably
  see a proper driver for this soon as well.

----------------------------------------------------------------
Andreas Kaessens (2):
      pinctrl: mcp23s08: Add optional reset GPIO
      dt-bindings: pinctrl: mcp23s08: add documentation for reset-gpios

Andy Shevchenko (2):
      pinctrl: Keep enum pin_config_param ordered by name (part 2)
      pinctrl: tigerlake: Add Alder Lake-M ACPI ID

Bixuan Cui (1):
      pinctrl: equilibrium: Add missing MODULE_DEVICE_TABLE

Bjorn Andersson (1):
      pinctrl: qcom: spmi-mpp: Add compatible for pmi8994

Dario Binacchi (2):
      docs/pinctrl: fix the reference to the u300 platform
      pinctrl: single: config: enable the pin's input

Fabien Dessenne (1):
      pinctrl: stm32: check for IRQ MUX validity during alloc()

Fabien Parent (3):
      dt-bindings: pinctrl: mt65xx: add mt8365 SoC binding
      pinctrl: mediatek: don't hardcode mode encoding in common code
      pinctrl: mediatek: add support for mt8365 SoC

Geert Uytterhoeven (11):
      pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
      pinctrl: renesas: r8a77990: JTAG pins do not have pull-down capabilit=
ies
      pinctrl: renesas: r8a77990: Drop bogus PUEN_ prefixes in comments
      pinctrl: renesas: r8a7778: Remove unused PORT_GP_PUP_1() macro
      pinctrl: renesas: r8a779{51,6,65}: Reduce non-functional differences
      pinctrl: renesas: r8a77470: Add bias pinconf support
      pinctrl: renesas: r8a7790: Add bias pinconf support
      pinctrl: renesas: r8a7792: Add bias pinconf support
      pinctrl: renesas: r8a7794: Add bias pinconf support
      pinctrl: renesas: r8a77970: Add bias pinconf support
      pinctrl: renesas: r8a77980: Add bias pinconf support

Jonathan Neusch=C3=A4fer (1):
      pinctrl: npcm: Align a few entries in the pin function table

Linus Walleij (5):
      pinctrl: mediatek: move bit assignment
      Merge tag 'renesas-pinctrl-for-v5.14-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      pinctrl: mtk: Fix mt8365 Kconfig dependency
      Merge tag 'intel-pinctrl-v5.14-1' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into devel
      Merge tag 'renesas-pinctrl-for-v5.14-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel

Mark Kettenis (1):
      dt-bindings: pinctrl: Add DT bindings for apple, pinctrl

Martin Botka (2):
      dt-bindings: pinctrl: qcom: sm6125: Document SM6125 pinctrl driver
      drivers: qcom: pinctrl: Add pinctrl driver for sm6125

Matthias Brugger (1):
      pinctrl: mediatek: fix mode encoding

Maximilian Luz (1):
      pinctrl/amd: Add device HID for new AMD GPIO controller

Phil Elwell (1):
      pinctrl: bcm2835: Accept fewer than expected IRQs

Radim Pavlik (1):
      pinctrl: mcp23s08: fix race condition in irq handler

Rafa=C5=82 Mi=C5=82ecki (1):
      dt-bindings: pinctrl: convert Broadcom Northstar to the json-schema

Raul E Rangel (1):
      pinctrl: amd: Implement irq_set_wake

Rikard Falkeborn (3):
      pinctrl: at91: Constify struct at91_pinctrl_mux_ops
      pinctrl: bcm: Constify static pinctrl_ops
      pinctrl: bcm: Constify static pinmux_ops

Sai Krishna Potthuri (1):
      pinctrl: zynqmp: some code cleanups

Sergio Paracuellos (7):
      pinctrl: ralink: move ralink architecture pinmux header into the driv=
er
      pinctrl: ralink: move MT7621 SoC pinmux config into a new
'pinctrl-mt7621.c' file
      pinctrl: ralink: move RT3883 SoC pinmux config into a new
'pinctrl-rt3883.c' file
      pinctrl: ralink: move RT305X SoC pinmux config into a new
'pinctrl-rt305x.c' file
      pinctrl: ralink: move MT7620 SoC pinmux config into a new
'pinctrl-mt7620.c' file
      pinctrl: ralink: move RT288X SoC pinmux config into a new
'pinctrl-rt288x.c' file
      pinctrl: ralink: rt305x: add missing include

Steven Lee (2):
      dt-bindings: pinctrl: Update enum for adding SGPM2 and SGPS2
      pinctrl: pinctrl-aspeed-g6: Add sgpio pinctrl settings

Yang Li (1):
      pinctrl: Fix kernel-doc

Zhen Lei (2):
      pinctrl: ocelot: Remove redundant error printing in ocelot_pinctrl_pr=
obe()
      pinctrl: iproc-gpio: Remove redundant error printing in iproc_gpio_pr=
obe()

Zou Wei (1):
      pinctrl: mcp23s08: Fix missing unlock on error in mcp23s08_irq()

satya priya (2):
      pinctrl: qcom: spmi-gpio: Add support for pm7325
      dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7325 support

 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |  106 ++
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |   10 +-
 .../bindings/pinctrl/brcm,bcm4708-pinmux.txt       |   55 -
 .../bindings/pinctrl/brcm,ns-pinmux.yaml           |   94 ++
 .../bindings/pinctrl/pinctrl-mcp23s08.txt          |    2 +
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |    2 +
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |    1 +
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml      |  132 ++
 Documentation/driver-api/pin-control.rst           |    2 +-
 MAINTAINERS                                        |    2 +
 arch/mips/include/asm/mach-ralink/mt7620.h         |   53 +-
 arch/mips/include/asm/mach-ralink/rt288x.h         |    9 -
 arch/mips/include/asm/mach-ralink/rt305x.h         |   24 -
 arch/mips/include/asm/mach-ralink/rt3883.h         |   34 -
 arch/mips/ralink/mt7620.c                          |  320 -----
 arch/mips/ralink/mt7621.c                          |   88 --
 arch/mips/ralink/prom.c                            |    1 -
 arch/mips/ralink/rt288x.c                          |   21 -
 arch/mips/ralink/rt305x.c                          |   77 -
 arch/mips/ralink/rt3883.c                          |   45 -
 drivers/pinctrl/Kconfig                            |    2 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |   24 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |    9 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    8 +-
 drivers/pinctrl/bcm/pinctrl-bcm6318.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm63268.c             |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm6328.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm6358.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm6362.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm6368.c              |    4 +-
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h              |    4 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    4 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |    1 +
 drivers/pinctrl/mediatek/Kconfig                   |    7 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8167.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mt8365.c          |  502 +++++++
 drivers/pinctrl/mediatek/pinctrl-mt8516.c          |    3 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   21 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |    3 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h      | 1511 ++++++++++++++++=
++++
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |    4 +-
 drivers/pinctrl/pinctrl-amd.c                      |   33 +-
 drivers/pinctrl/pinctrl-at91.c                     |   14 +-
 drivers/pinctrl/pinctrl-equilibrium.c              |    1 +
 drivers/pinctrl/pinctrl-mcp23s08.c                 |   13 +-
 drivers/pinctrl/pinctrl-mcp23s08.h                 |    1 +
 drivers/pinctrl/pinctrl-ocelot.c                   |    4 +-
 drivers/pinctrl/pinctrl-single.c                   |    5 +-
 drivers/pinctrl/pinctrl-zynqmp.c                   |   50 +-
 drivers/pinctrl/qcom/Kconfig                       |    9 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-sm6125.c              | 1277 ++++++++++++++++=
+
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    1 +
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    1 +
 drivers/pinctrl/ralink/Kconfig                     |   25 +
 drivers/pinctrl/ralink/Makefile                    |    6 +
 drivers/pinctrl/ralink/pinctrl-mt7620.c            |  390 +++++
 drivers/pinctrl/ralink/pinctrl-mt7621.c            |  116 ++
 drivers/pinctrl/ralink/pinctrl-rt2880.c            |   30 +-
 drivers/pinctrl/ralink/pinctrl-rt288x.c            |   60 +
 drivers/pinctrl/ralink/pinctrl-rt305x.c            |  137 ++
 drivers/pinctrl/ralink/pinctrl-rt3883.c            |  107 ++
 .../pinctrl/ralink}/pinmux.h                       |    3 +-
 drivers/pinctrl/renesas/pfc-r8a77470.c             |  346 ++++-
 drivers/pinctrl/renesas/pfc-r8a7778.c              |    3 -
 drivers/pinctrl/renesas/pfc-r8a7790.c              |  301 +++-
 drivers/pinctrl/renesas/pfc-r8a7792.c              |  533 ++++++-
 drivers/pinctrl/renesas/pfc-r8a7794.c              |  360 ++++-
 drivers/pinctrl/renesas/pfc-r8a77951.c             |    4 +-
 drivers/pinctrl/renesas/pfc-r8a7796.c              |   10 +-
 drivers/pinctrl/renesas/pfc-r8a77965.c             |   79 +-
 drivers/pinctrl/renesas/pfc-r8a77970.c             |  175 ++-
 drivers/pinctrl/renesas/pfc-r8a77980.c             |  209 ++-
 drivers/pinctrl/renesas/pfc-r8a77990.c             |   16 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   79 +-
 include/dt-bindings/pinctrl/apple.h                |   13 +
 include/dt-bindings/pinctrl/mt8365-pinfunc.h       |  858 +++++++++++
 include/linux/pinctrl/pinconf-generic.h            |   20 +-
 86 files changed, 7498 insertions(+), 1020 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl=
.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8365.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6125.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-mt7620.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-mt7621.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt288x.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt305x.c
 create mode 100644 drivers/pinctrl/ralink/pinctrl-rt3883.c
 rename {arch/mips/include/asm/mach-ralink =3D>
drivers/pinctrl/ralink}/pinmux.h (91%)
 create mode 100644 include/dt-bindings/pinctrl/apple.h
 create mode 100644 include/dt-bindings/pinctrl/mt8365-pinfunc.h
