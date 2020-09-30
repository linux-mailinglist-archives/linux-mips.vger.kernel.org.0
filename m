Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A9327F629
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731868AbgI3Xr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:47:27 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60805 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgI3Xr1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:47:27 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTiLj-1jyIQs3sRZ-00U2pM; Thu, 01 Oct 2020 01:47:04 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNloJ-0007Ye-6b; Thu, 01 Oct 2020 01:47:00 +0200
Received: (nullmailer pid 7671 invoked by uid 2001);
        Wed, 30 Sep 2020 23:46:58 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 0/7] leds: pwm: Make automatic labels work
Date:   Thu,  1 Oct 2020 01:46:30 +0200
Message-Id: <20200930234637.7573-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: a725df07d7ef17d6c9c3b8b0b262d2c4
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:1elWBi7e5x3yI9alpARH+EzCpdRWKPCu5CRyf0GlHEX72/7ReQG
 uK+KfSK9bq2XSjeizOMOQ1aX81WAtDM6x33xXmSQR4PGyxTAFe+Gyet5tvr5SsoocF8fkI6
 wSoVyqgv448pDp8oa8pMgpO1/2adBnPHdkc6W+5jqszUFcPSeKSiuI0MNhA2Cm5ImFDpZJd
 CTEWaoq7Zs45webTwlzJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6alNuLrEGTM=:/JzZgqFL5jcymyQztVcQOq
 FjxmZcvrBOVCPqcnXy+7LRNn5FCV5x5rFniePHKClSKDklFA4XytiJHTWPmRH9scMeoS+B/64
 BlVgHSGulgI65FjtqdOjhileRqNHQIAzBZFbiqQpFNgq202+GikFCy/xaHpOVEh9vg1IajYCg
 Lt2eTnDEB6DJGd0SFFM842tbVSWrI+WNSL360BFHDKFAPPPAVI9v3d8UpyaPR7KXcb1uVYWCt
 Hau+i8KYufRR7C1yX5kkvYa5LTp0YaMb0Ve1AGNoUzRBQwJVhGlY4V3tEcZInhhVHbhgkuL6O
 fOsv227odzxhpVjJUpU/bA4Km556V1smNzzjItRCNc5HuK1IRc2nqpm8rIQC5nekctRbVWoLV
 3PiWxpx65aIICaHcYPUejEw4aeNO8l2jyzzDzJYsyZ/YYWQ+WhfvfwS6y2CfQk6ZkhJX14JcV
 /PU/XTVQaV931qWbzKdRfR/o4zTOlmBUq7NncVRTHyfAHo7CTLWk/W9RFVVl5jSMjvUgGtAt2
 SRsXkr11xKUT3BEHgNRDwtgfcIzkT1/5lykDr7NRvqX6jQEG82cb2ItZrccHXrWAIUOs8wzHL
 tBNrUqdkqhI4bqoGzIMThGTJB4Q119crVleU9q0AjRzrjwmc8sa6vWnjRXjl4SZLuMSXEaVb7
 BjoIGbdsc8iPEdoPHiSb5o/b+FnAMlKVCgRiiu8Tgr6mU24AjEduYafCSw19DqMnNp6sVjeN1
 QoSC10dCkrDX1VvK7iCze3yiqtIGW+Dyi+QDP7oAR3Dnnubg6HFlDL7Qjm4X5VOwlEL/W9uVb
 srj/mjCZd9wH4qLjLDzrwxLf52R1XcL+nIJENySPlOGCa5beS/UYs1Xpa/UA7Hff+6YMO6W
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hei hei,

for leds-gpio you can use the properties 'function' and 'color' in the
devicetree node and omit 'label', the label is constructed
automatically.  This is a common feature supposed to be working for all
LED drivers.  However it did not yet work for the 'leds-pwm' driver.

This series removes platform_data support for the leds-pwm driver and
takes the opportunity to update the leds-pwm dt-bindings accordingly.

After myself being one week on vacation patch 2/3 was already picked by
Pavel and I gathered some more feedback on the remaining issues.

v6 was compile tested and dt_bindings_check and dtbs_check were run.

Note: I added some patches to fix DT schema warnings, but I did not put
every reviewer/supporter/maintainer printed by get_maintainers in Cc to
keep that list reasonable small.

Series changelog below …

Greets
Alex

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

Alexander Dahl (7):
  leds: pwm: Remove platform_data support
  dt-bindings: leds: Convert pwm to yaml
  dt-bindings: mfd: Fix schema warnings for pwm-leds
  ARM: dts: at91: smartkiz: Reference led node directly
  ARM: dts: Fix schema warnings for pwm-leds
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


base-commit: 8fd8f94235c2c925d80b2316e0ab2bdd00af9bae
-- 
2.20.1

