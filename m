Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8355C28414D
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgJEUgb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:31 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49119 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgJEUgT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:19 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MuDPf-1kfhXm22Jx-00uZ5G; Mon, 05 Oct 2020 22:35:43 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXCp-0004VD-EM; Mon, 05 Oct 2020 22:35:39 +0200
Received: (nullmailer pid 10292 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:35 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Subject: [PATCH v7 00/12] leds: pwm: Make automatic labels work
Date:   Mon,  5 Oct 2020 22:34:39 +0200
Message-Id: <20201005203451.9985-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 6f2c0cc924172ae0d63df639c2daa6ee
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:a5ux3XXYZajhGPOMpe5UlfXuFD6MtM8x1SXx7hRmMI2VaktPYLL
 bpOXntySTtH+Ag/ngkdXTAXTFtj/AydJNiMmujznhs04XsefLrYEM0Hq7SgdjRpFEVvurTO
 RXLWs0ib8iJCApjU+vdotQ1A9uLwBzN3w6Nihr9LfAKMMbsI/Nbh/+0ZDNESTfsCZ86T6zN
 0MMM0Xp2efP1KIMW3MpFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dDqMxTJ8D7M=:Rp8hRovn0iKwlz5TKLVy9k
 M3Yp0ahNKEJLy8xKp5zLtOssELWI0wmPV885fphX9f6nfEML3n6VJAFLPUQ6sNRZclA0c27A+
 JUMvVYROEX9PfxzJPaVyPsEhHvB8ysopfTvnOraak8dA2VPCkir5k71VLrcBtQJgBoxX4qqPp
 AuMgnvObgC1JBKW3d5MGI0COmotuKFHemsXWM7NY2zMPeWamshVdh/+INSiDi/2ewhV0F8cFA
 l2X8fhe05oCm5Wy4CFbZzxbwpdlDN/MhqIijKGMtWXjVbT1EQrYZ2Yybj90M78NTIVSswB31D
 kKAndesjQPA7/NTGGaFiGw8t7FU7pkAtKk9KVyQ4A/N05YNE94nSYGnjb8JlWavTodSFTzCnk
 mf3vTECMd1fLr0EGNZzTkQf4lQy+/8nbRGz7eZfJBHr2B35RlgFOxka1SrgCdr3btDdDu+VTe
 k2wlB9yJCW9F6zCzF7/AEm8v+B3BVj7sGItnB6feEfVWt/iijbZO20nGmWrqM/Wk+Qz0NybwE
 iELpxNkXnbSevyryNTMwYs319ut74MeinmJcCJhLYq9V5gJ/oYVw7dG8B52uJYuo8O/bWb3vT
 zIfbvx5odI5FPswZeKOTCaJu0IbofcIzE+/sf0YOdcpRS+fmwHKfZNDmbRmUQTNuKHu7In/qX
 5JKpNBQa0h4ooda5cujKLG0AhJuLnpbpLkR/c4bGe4TcaxDinFTm9L/HtEZB8Igp9+RtCzw+p
 U9pc5v8itsKIIyRgkKjOlXOtYe6Qa4Vn+7w93dmMchSYjqcNCFifqNjbXwBAmv1SW7g+N3Xkg
 i6y8UcQOBkCFounHKzYL1eOBMEEqk0tq6WQ8FZ1G5SHv/z8OM4ZaQzPPwm9V1YnPqDKzOTj
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not work until recently for the 'leds-pwm'
driver.

This series removes the no more needed platform_data support from the
leds-pwm driver, which was a precondition for the already applied patch
actually making automatic naming work.

The leds-pwm dt-bindings are converted and updated to reflect the
possibility to use led function and color for naming now.

v7 of this series is basically collecting reviewed-by tags, split old
patch 5/7 into per arm sub-arch changes for easier maintainer review,
and rewording commit messages.  See each patch for a detailed changelog.

For the bindings conversion it's now required to explicitly set a
license.  Peter, Russel, could you please acknowledge that patch?

Series changelog below …

Greets
Alex

v7:
- rebased series on recent pavel/for-next
- split up arm dts patch by arm sub arch (suggested by Krzysztof Kozlowski)
- added multiple Reviewed-by tags
- slightly reworded commit messages (suggested by Krzysztof Kozlowski)
- added actual dtbs_check warnings to commit messages
- added Russell King to Cc for binding conversion patch (because license)

v6:
- rebased series on recent pavel/for-next
- added Reviewed-by from Marek to patch 1
- patch 2 from v5 was picked by Pavel and is already in his for-next
  branch
- previous patch 3/3 (now 2/7) was reworked based on feedback by Rob
- added more dt patches fixing warnings after binding conversion to yaml

v5:
- replaced patch 1/3 by a new patch removing platform_data support for
  the leds-pwm driver
- little rewording of commit message in patch 2/3
- updated patch 3/3 based on feedback by Rob Herring
- added Marek Behún to Cc, because he also works on removing
  platform_data support
- rebased series on pavel/for-next

v4:
- added led-class patch handling fwnode passing differently (patch 1/3)
- adapted leds-pwm patch to new led-class (patch 2/3)
- contacted original author of leds-pwm dt binding on license issue
  (patch 3/3)

v3:
- series rebased on v5.9-rc4
- changed license of .yaml file to recommended one (patch 2/2)
- added Acked-by to both patches

v2:
- series rebased on v5.9-rc3
- added the dt-bindings update patch (2/2)

v1:
- based on v5.9-rc2
- backport on v5.4.59 tested and working

Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-amlogic@lists.infradead.org
Cc: linux-mips@vger.kernel.org

Alexander Dahl (12):
  leds: pwm: Remove platform_data support
  dt-bindings: leds: Convert pwm to yaml
  dt-bindings: mfd: Fix schema warnings for pwm-leds
  ARM: dts: at91: smartkiz: Reference led node directly
  ARM: dts: at91: Fix schema warnings for pwm-leds
  ARM: dts: berlin: Fix schema warnings for pwm-leds
  ARM: dts: exynos: Fix schema warnings for pwm-leds
  ARM: dts: imx: Fix schema warnings for pwm-leds
  ARM: dts: omap: Fix schema warnings for pwm-leds
  ARM: dts: stm32: Fix schema warnings for pwm-leds
  arm64: dts: meson: Fix schema warnings for pwm-leds
  MIPS: DTS: img: Fix schema warnings for pwm-leds

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
 .../devicetree/bindings/mfd/iqs62x.yaml       |  5 +-
 arch/arm/boot/dts/at91-kizbox.dts             | 10 +--
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 +--
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++---
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +--
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 +--
 arch/arm/boot/dts/at91-smartkiz.dts           |  6 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +--
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +--
 .../boot/dts/berlin2cd-google-chromecast.dts  |  6 +-
 arch/arm/boot/dts/exynos5422-odroidhc1.dts    |  4 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts    |  4 +-
 .../boot/dts/exynos54xx-odroidxu-leds.dtsi    | 11 +--
 arch/arm/boot/dts/imx53-ppd.dts               | 15 ++--
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi        |  4 +-
 .../boot/dts/imx6sx-softing-vining-2000.dts   |  8 +--
 arch/arm/boot/dts/omap3-beagle-xm.dts         | 10 +--
 arch/arm/boot/dts/omap3-overo-base.dtsi       |  4 +-
 arch/arm/boot/dts/omap4-kc1.dts               |  6 +-
 arch/arm/boot/dts/omap4-sdp.dts               | 26 +++----
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts     | 12 ++--
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  4 +-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 +-
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  8 +--
 arch/mips/boot/dts/img/pistachio_marduk.dts   |  5 +-
 drivers/leds/leds-pwm.c                       | 30 ++------
 28 files changed, 184 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml


base-commit: 4f69e17c87e90f9508f498fa4771a9b77db1174b
-- 
2.20.1

