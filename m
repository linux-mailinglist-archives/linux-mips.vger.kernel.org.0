Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437F1AEBFF
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 15:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733265AbfIJNsk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Sep 2019 09:48:40 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:50594 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729173AbfIJNsk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Sep 2019 09:48:40 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: WvoLGrVoxjslM87EDFMb9g86ApmanbguCNUE5A2YbhQIImBRyDer1lqnauMyNS1gL5mTYHvqgN
 j7kHWfmb7I0RcDrnrrDy7+HL+RCMeWEZB5hSixr1urMOa23Rd3Oj0oIt2s1y+lo+qSDlWGR/Tg
 Q4MHn2pZIXIMBnjaT8GptZgxiKRLUaiC6g0KRekADZdLL1D7PZiEo0Ww6OO+kSaTYJqoy3Qn3U
 MHrLbhvLg5Mrc3QcxM00sABdbO2lAI+c/P1xzPcdH3v+G38wz4YO6MvSOJQ/O/Phe7s0xcaWXy
 TxM=
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="48355799"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Sep 2019 06:48:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Sep 2019 06:48:36 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 10 Sep 2019 06:48:15 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <daniel.lezcano@linaro.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux@armlinux.org.uk>, <nsekhar@ti.com>,
        <bgolaszewski@baylibre.com>, <monstr@monstr.eu>,
        <john@phrozen.org>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
        <jhogan@kernel.org>, <lftan@altera.com>, <tglx@linutronix.de>,
        <vgupta@synopsys.com>, <marc.zyngier@arm.com>,
        <patrice.chotard@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <linus.walleij@linaro.org>, <shc_work@mail.ru>, <kgene@kernel.org>,
        <krzk@kernel.org>, <ysato@users.sourceforge.jp>,
        <liviu.dudau@arm.com>, <sudeep.holla@arm.com>,
        <lorenzo.pieralisi@arm.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <baohua@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <baruch@tkos.co.il>,
        <u.kleine-koenig@pengutronix.de>, <guoren@kernel.org>,
        <kaloz@openwrt.org>, <khalasa@piap.pl>, <ssantosh@kernel.org>,
        <vz@mleia.com>, <slemieux.tyco@gmail.com>, <khilman@baylibre.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <afaerber@suse.de>,
        <manivannan.sadhasivam@linaro.org>, <narmstrong@baylibre.com>,
        <agross@kernel.org>, <palmer@sifive.com>, <aou@eecs.berkeley.edu>,
        <heiko@sntech.de>, <orsonzhai@gmail.com>, <baolin.wang@linaro.org>,
        <zhang.lyra@gmail.com>, <maxime.ripard@bootlin.com>,
        <wens@csie.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux@prisktech.co.nz>,
        <john.stultz@linaro.org>, <sboyd@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <nios2-dev@lists.rocketboards.org>,
        <linux-snps-arc@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <uclinux-h8-devel@lists.sourceforge.jp>,
        <linux-amlogic@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
        <linux-oxnas@groups.io>, <linux-arm-msm@vger.kernel.org>,
        <linux-unisoc@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        "Claudiu Beznea" <claudiu.beznea@microchip.com>
Subject: [PATCH 2/7] clocksource: change timer registration macros
Date:   Tue, 10 Sep 2019 16:47:11 +0300
Message-ID: <1568123236-767-3-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change timer registration macros (TIMER_OF_DECLARE() and
CLOCKSOURCE_OF_DECLARE()) by adding a new argument. This new argument
is a pointer to an object of type struct timer_of and is used in
timer_probe(). Based on the flags filled in the struct timer_of object
the probing process will parse different DT bindings. Later on the
drivers will use the result of this parsing. Even at the moment only
few drivers are using this functionality there are other that could
be converted to use it.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/kernel/smp_twd.c                 | 10 ++--
 arch/arm/mach-davinci/time.c              |  2 +-
 arch/microblaze/kernel/timer.c            |  2 +-
 arch/mips/ralink/cevt-rt3352.c            |  2 +-
 arch/nios2/kernel/time.c                  |  2 +-
 drivers/clocksource/arc_timer.c           |  6 +--
 drivers/clocksource/arm_arch_timer.c      |  6 +--
 drivers/clocksource/arm_global_timer.c    |  2 +-
 drivers/clocksource/armv7m_systick.c      |  2 +-
 drivers/clocksource/asm9260_timer.c       |  2 +-
 drivers/clocksource/bcm2835_timer.c       |  2 +-
 drivers/clocksource/bcm_kona_timer.c      |  4 +-
 drivers/clocksource/clksrc-dbx500-prcmu.c |  2 +-
 drivers/clocksource/clksrc_st_lpc.c       |  2 +-
 drivers/clocksource/clps711x-timer.c      |  2 +-
 drivers/clocksource/dw_apb_timer_of.c     |  9 ++--
 drivers/clocksource/exynos_mct.c          |  4 +-
 drivers/clocksource/h8300_timer16.c       |  2 +-
 drivers/clocksource/h8300_timer8.c        |  2 +-
 drivers/clocksource/h8300_tpu.c           |  2 +-
 drivers/clocksource/jcore-pit.c           |  2 +-
 drivers/clocksource/mips-gic-timer.c      |  2 +-
 drivers/clocksource/mps2-timer.c          |  2 +-
 drivers/clocksource/mxs_timer.c           |  2 +-
 drivers/clocksource/nomadik-mtu.c         |  2 +-
 drivers/clocksource/renesas-ostm.c        |  2 +-
 drivers/clocksource/samsung_pwm_timer.c   | 12 +++--
 drivers/clocksource/timer-armada-370-xp.c |  6 +--
 drivers/clocksource/timer-atcpit100.c     |  6 +--
 drivers/clocksource/timer-atlas7.c        |  3 +-
 drivers/clocksource/timer-atmel-pit.c     |  2 +-
 drivers/clocksource/timer-atmel-st.c      |  2 +-
 drivers/clocksource/timer-atmel-tcb.c     |  2 +-
 drivers/clocksource/timer-cadence-ttc.c   |  2 +-
 drivers/clocksource/timer-davinci.c       |  3 +-
 drivers/clocksource/timer-digicolor.c     |  2 +-
 drivers/clocksource/timer-efm32.c         |  4 +-
 drivers/clocksource/timer-fsl-ftm.c       |  2 +-
 drivers/clocksource/timer-fttmr010.c      | 10 ++--
 drivers/clocksource/timer-gx6605s.c       |  7 +--
 drivers/clocksource/timer-imx-gpt.c       | 24 ++++-----
 drivers/clocksource/timer-imx-sysctr.c    |  9 +---
 drivers/clocksource/timer-imx-tpm.c       |  6 +--
 drivers/clocksource/timer-integrator-ap.c |  2 +-
 drivers/clocksource/timer-ixp4xx.c        |  2 +-
 drivers/clocksource/timer-keystone.c      |  2 +-
 drivers/clocksource/timer-lpc32xx.c       |  2 +-
 drivers/clocksource/timer-mediatek.c      | 84 ++++++++++++++++---------------
 drivers/clocksource/timer-meson6.c        |  2 +-
 drivers/clocksource/timer-milbeaut.c      |  7 +--
 drivers/clocksource/timer-mp-csky.c       | 15 ++----
 drivers/clocksource/timer-npcm7xx.c       |  9 +---
 drivers/clocksource/timer-nps.c           |  6 +--
 drivers/clocksource/timer-of.c            |  8 ++-
 drivers/clocksource/timer-of.h            | 11 ++++
 drivers/clocksource/timer-orion.c         |  2 +-
 drivers/clocksource/timer-owl.c           |  6 +--
 drivers/clocksource/timer-oxnas-rps.c     |  4 +-
 drivers/clocksource/timer-pistachio.c     |  2 +-
 drivers/clocksource/timer-prima2.c        |  2 +-
 drivers/clocksource/timer-probe.c         | 17 ++++++-
 drivers/clocksource/timer-pxa.c           |  2 +-
 drivers/clocksource/timer-qcom.c          |  4 +-
 drivers/clocksource/timer-rda.c           |  8 +--
 drivers/clocksource/timer-riscv.c         |  2 +-
 drivers/clocksource/timer-rockchip.c      |  4 +-
 drivers/clocksource/timer-sp804.c         |  4 +-
 drivers/clocksource/timer-sprd.c          | 16 +-----
 drivers/clocksource/timer-stm32.c         | 44 +++++++---------
 drivers/clocksource/timer-sun4i.c         | 12 ++---
 drivers/clocksource/timer-sun5i.c         |  4 +-
 drivers/clocksource/timer-tango-xtal.c    |  2 +-
 drivers/clocksource/timer-tegra.c         | 20 +++-----
 drivers/clocksource/timer-ti-32k.c        |  2 +-
 drivers/clocksource/timer-u300.c          |  2 +-
 drivers/clocksource/timer-versatile.c     |  4 +-
 drivers/clocksource/timer-vf-pit.c        |  2 +-
 drivers/clocksource/timer-vt8500.c        |  2 +-
 drivers/clocksource/timer-zevio.c         |  2 +-
 include/linux/clocksource.h               | 30 ++++++++++-
 80 files changed, 266 insertions(+), 264 deletions(-)

diff --git a/arch/arm/kernel/smp_twd.c b/arch/arm/kernel/smp_twd.c
index 9a14f721a2b0..02ea5ac511ff 100644
--- a/arch/arm/kernel/smp_twd.c
+++ b/arch/arm/kernel/smp_twd.c
@@ -335,6 +335,10 @@ static int __init twd_local_timer_of_register(struct device_node *np)
 	WARN(err, "twd_local_timer_of_register failed (%d)\n", err);
 	return err;
 }
-TIMER_OF_DECLARE(arm_twd_a9, "arm,cortex-a9-twd-timer", twd_local_timer_of_register);
-TIMER_OF_DECLARE(arm_twd_a5, "arm,cortex-a5-twd-timer", twd_local_timer_of_register);
-TIMER_OF_DECLARE(arm_twd_11mp, "arm,arm11mp-twd-timer", twd_local_timer_of_register);
+TIMER_OF_DECLARE(arm_twd_a9, "arm,cortex-a9-twd-timer",
+		 twd_local_timer_of_register, NULL);
+TIMER_OF_DECLARE(arm_twd_a5, "arm,cortex-a5-twd-timer",
+		 twd_local_timer_of_register, NULL);
+TIMER_OF_DECLARE(arm_twd_11mp, "arm,arm11mp-twd-timer",
+		 twd_local_timer_of_register, NULL);
+#endif
diff --git a/arch/arm/mach-davinci/time.c b/arch/arm/mach-davinci/time.c
index 5a6de5368ab0..ac36b29ef6bc 100644
--- a/arch/arm/mach-davinci/time.c
+++ b/arch/arm/mach-davinci/time.c
@@ -411,4 +411,4 @@ static int __init of_davinci_timer_init(struct device_node *np)
 
 	return 0;
 }
-TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_init);
+TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_init, NULL);
diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index a6683484b3a1..21c4a3717d73 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -329,4 +329,4 @@ static int __init xilinx_timer_init(struct device_node *timer)
 }
 
 TIMER_OF_DECLARE(xilinx_timer, "xlnx,xps-timer-1.00.a",
-		       xilinx_timer_init);
+		       xilinx_timer_init, NULL);
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
index 61a08943eb2f..ad7cd4e228ce 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/arch/mips/ralink/cevt-rt3352.c
@@ -152,4 +152,4 @@ static int __init ralink_systick_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init);
+TIMER_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init, NULL);
diff --git a/arch/nios2/kernel/time.c b/arch/nios2/kernel/time.c
index 54467d0085a1..37c74196dc8b 100644
--- a/arch/nios2/kernel/time.c
+++ b/arch/nios2/kernel/time.c
@@ -356,4 +356,4 @@ void __init time_init(void)
 	timer_probe();
 }
 
-TIMER_OF_DECLARE(nios2_timer, ALTR_TIMER_COMPATIBLE, nios2_time_init);
+TIMER_OF_DECLARE(nios2_timer, ALTR_TIMER_COMPATIBLE, nios2_time_init, NULL);
diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
index b29b5a75333e..0178315c37e7 100644
--- a/drivers/clocksource/arc_timer.c
+++ b/drivers/clocksource/arc_timer.c
@@ -119,7 +119,7 @@ static int __init arc_cs_setup_gfrc(struct device_node *node)
 
 	return clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
 }
-TIMER_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
+TIMER_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc, NULL);
 
 #define AUX_RTC_CTRL	0x103
 #define AUX_RTC_LOW	0x104
@@ -185,7 +185,7 @@ static int __init arc_cs_setup_rtc(struct device_node *node)
 
 	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
 }
-TIMER_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
+TIMER_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc, NULL);
 
 #endif
 
@@ -372,4 +372,4 @@ static int __init arc_of_timer_init(struct device_node *np)
 
 	return ret;
 }
-TIMER_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
+TIMER_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init, NULL);
diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 9a5464c625b4..553ef338cec7 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1295,8 +1295,8 @@ static int __init arch_timer_of_init(struct device_node *np)
 
 	return arch_timer_common_init();
 }
-TIMER_OF_DECLARE(armv7_arch_timer, "arm,armv7-timer", arch_timer_of_init);
-TIMER_OF_DECLARE(armv8_arch_timer, "arm,armv8-timer", arch_timer_of_init);
+TIMER_OF_DECLARE(armv7_arch_timer, "arm,armv7-timer", arch_timer_of_init, NULL);
+TIMER_OF_DECLARE(armv8_arch_timer, "arm,armv8-timer", arch_timer_of_init, NULL);
 
 static u32 __init
 arch_timer_mem_frame_get_cntfrq(struct arch_timer_mem_frame *frame)
@@ -1482,7 +1482,7 @@ static int __init arch_timer_mem_of_init(struct device_node *np)
 	return ret;
 }
 TIMER_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem",
-		       arch_timer_mem_of_init);
+		       arch_timer_mem_of_init, NULL);
 
 #ifdef CONFIG_ACPI_GTDT
 static int __init
diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 88b2d38a7a61..7f65c9ea0ffb 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -337,4 +337,4 @@ static int __init global_timer_of_register(struct device_node *np)
 
 /* Only tested on r2p2 and r3p0  */
 TIMER_OF_DECLARE(arm_gt, "arm,cortex-a9-global-timer",
-			global_timer_of_register);
+			global_timer_of_register, NULL);
diff --git a/drivers/clocksource/armv7m_systick.c b/drivers/clocksource/armv7m_systick.c
index 7e78074480e4..e74a53e218be 100644
--- a/drivers/clocksource/armv7m_systick.c
+++ b/drivers/clocksource/armv7m_systick.c
@@ -83,4 +83,4 @@ static int __init system_timer_of_register(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(arm_systick, "arm,armv7m-systick",
-			system_timer_of_register);
+			system_timer_of_register, NULL);
diff --git a/drivers/clocksource/asm9260_timer.c b/drivers/clocksource/asm9260_timer.c
index 9f09a59161e7..05a264337ef3 100644
--- a/drivers/clocksource/asm9260_timer.c
+++ b/drivers/clocksource/asm9260_timer.c
@@ -235,4 +235,4 @@ static int __init asm9260_timer_init(struct device_node *np)
 	return 0;
 }
 TIMER_OF_DECLARE(asm9260_timer, "alphascale,asm9260-timer",
-		asm9260_timer_init);
+		asm9260_timer_init, NULL);
diff --git a/drivers/clocksource/bcm2835_timer.c b/drivers/clocksource/bcm2835_timer.c
index 2b196cbfadb6..55ad32fe6088 100644
--- a/drivers/clocksource/bcm2835_timer.c
+++ b/drivers/clocksource/bcm2835_timer.c
@@ -135,4 +135,4 @@ static int __init bcm2835_timer_init(struct device_node *node)
 	return ret;
 }
 TIMER_OF_DECLARE(bcm2835, "brcm,bcm2835-system-timer",
-			bcm2835_timer_init);
+			bcm2835_timer_init, NULL);
diff --git a/drivers/clocksource/bcm_kona_timer.c b/drivers/clocksource/bcm_kona_timer.c
index 5c40be9880f5..5d850ac27268 100644
--- a/drivers/clocksource/bcm_kona_timer.c
+++ b/drivers/clocksource/bcm_kona_timer.c
@@ -198,9 +198,9 @@ static int __init kona_timer_init(struct device_node *node)
 	return 0;
 }
 
-TIMER_OF_DECLARE(brcm_kona, "brcm,kona-timer", kona_timer_init);
+TIMER_OF_DECLARE(brcm_kona, "brcm,kona-timer", kona_timer_init, NULL);
 /*
  * bcm,kona-timer is deprecated by brcm,kona-timer
  * being kept here for driver compatibility
  */
-TIMER_OF_DECLARE(bcm_kona, "bcm,kona-timer", kona_timer_init);
+TIMER_OF_DECLARE(bcm_kona, "bcm,kona-timer", kona_timer_init, NULL);
diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/clksrc-dbx500-prcmu.c
index 996900d017c6..953e92ab6ec4 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -69,4 +69,4 @@ static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 	return clocksource_register_hz(&clocksource_dbx500_prcmu, RATE_32K);
 }
 TIMER_OF_DECLARE(dbx500_prcmu, "stericsson,db8500-prcmu-timer-4",
-		       clksrc_dbx500_prcmu_init);
+		       clksrc_dbx500_prcmu_init, NULL);
diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/clksrc_st_lpc.c
index 419a886876e4..be09e9bee98a 100644
--- a/drivers/clocksource/clksrc_st_lpc.c
+++ b/drivers/clocksource/clksrc_st_lpc.c
@@ -128,4 +128,4 @@ static int __init st_clksrc_of_register(struct device_node *np)
 
 	return ret;
 }
-TIMER_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);
+TIMER_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register, NULL);
diff --git a/drivers/clocksource/clps711x-timer.c b/drivers/clocksource/clps711x-timer.c
index e95fdc49c226..9017215246ff 100644
--- a/drivers/clocksource/clps711x-timer.c
+++ b/drivers/clocksource/clps711x-timer.c
@@ -98,4 +98,4 @@ static int __init clps711x_timer_init(struct device_node *np)
 
 	return 0;
 }
-TIMER_OF_DECLARE(clps711x, "cirrus,ep7209-timer", clps711x_timer_init);
+TIMER_OF_DECLARE(clps711x, "cirrus,ep7209-timer", clps711x_timer_init, NULL);
diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/dw_apb_timer_of.c
index 8c28b127759f..a7d61712677c 100644
--- a/drivers/clocksource/dw_apb_timer_of.c
+++ b/drivers/clocksource/dw_apb_timer_of.c
@@ -168,7 +168,8 @@ static int __init dw_apb_timer_init(struct device_node *timer)
 
 	return 0;
 }
-TIMER_OF_DECLARE(pc3x2_timer, "picochip,pc3x2-timer", dw_apb_timer_init);
-TIMER_OF_DECLARE(apb_timer_osc, "snps,dw-apb-timer-osc", dw_apb_timer_init);
-TIMER_OF_DECLARE(apb_timer_sp, "snps,dw-apb-timer-sp", dw_apb_timer_init);
-TIMER_OF_DECLARE(apb_timer, "snps,dw-apb-timer", dw_apb_timer_init);
+TIMER_OF_DECLARE(pc3x2_timer, "picochip,pc3x2-timer", dw_apb_timer_init, NULL);
+TIMER_OF_DECLARE(apb_timer_osc, "snps,dw-apb-timer-osc", dw_apb_timer_init,
+		 NULL);
+TIMER_OF_DECLARE(apb_timer_sp, "snps,dw-apb-timer-sp", dw_apb_timer_init, NULL);
+TIMER_OF_DECLARE(apb_timer, "snps,dw-apb-timer", dw_apb_timer_init, NULL);
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 74cb299f5089..0c7abbe50b38 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -613,5 +613,5 @@ static int __init mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
-TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi, NULL);
+TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi, NULL);
diff --git a/drivers/clocksource/h8300_timer16.c b/drivers/clocksource/h8300_timer16.c
index 86ca91451b2e..0c217e590348 100644
--- a/drivers/clocksource/h8300_timer16.c
+++ b/drivers/clocksource/h8300_timer16.c
@@ -189,4 +189,4 @@ static int __init h8300_16timer_init(struct device_node *node)
 }
 
 TIMER_OF_DECLARE(h8300_16bit, "renesas,16bit-timer",
-			   h8300_16timer_init);
+			   h8300_16timer_init, NULL);
diff --git a/drivers/clocksource/h8300_timer8.c b/drivers/clocksource/h8300_timer8.c
index 1d740a8c42ab..99896b40758a 100644
--- a/drivers/clocksource/h8300_timer8.c
+++ b/drivers/clocksource/h8300_timer8.c
@@ -208,4 +208,4 @@ static int __init h8300_8timer_init(struct device_node *node)
 	return ret;
 }
 
-TIMER_OF_DECLARE(h8300_8bit, "renesas,8bit-timer", h8300_8timer_init);
+TIMER_OF_DECLARE(h8300_8bit, "renesas,8bit-timer", h8300_8timer_init, NULL);
diff --git a/drivers/clocksource/h8300_tpu.c b/drivers/clocksource/h8300_tpu.c
index 17d4ab0f6ad1..4b937d67e1d6 100644
--- a/drivers/clocksource/h8300_tpu.c
+++ b/drivers/clocksource/h8300_tpu.c
@@ -155,4 +155,4 @@ static int __init h8300_tpu_init(struct device_node *node)
 	return ret;
 }
 
-TIMER_OF_DECLARE(h8300_tpu, "renesas,tpu", h8300_tpu_init);
+TIMER_OF_DECLARE(h8300_tpu, "renesas,tpu", h8300_tpu_init, NULL);
diff --git a/drivers/clocksource/jcore-pit.c b/drivers/clocksource/jcore-pit.c
index 5d3d88e0fc8c..8d346fcf2b78 100644
--- a/drivers/clocksource/jcore-pit.c
+++ b/drivers/clocksource/jcore-pit.c
@@ -246,4 +246,4 @@ static int __init jcore_pit_init(struct device_node *node)
 	return 0;
 }
 
-TIMER_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
+TIMER_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init, NULL);
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 37671a5d4ed9..2313cdcec182 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -231,4 +231,4 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
-		       gic_clocksource_of_init);
+		       gic_clocksource_of_init, NULL);
diff --git a/drivers/clocksource/mps2-timer.c b/drivers/clocksource/mps2-timer.c
index 2e64d984c83a..30a17dca5608 100644
--- a/drivers/clocksource/mps2-timer.c
+++ b/drivers/clocksource/mps2-timer.c
@@ -270,4 +270,4 @@ static int __init mps2_timer_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(mps2_timer, "arm,mps2-timer", mps2_timer_init);
+TIMER_OF_DECLARE(mps2_timer, "arm,mps2-timer", mps2_timer_init, NULL);
diff --git a/drivers/clocksource/mxs_timer.c b/drivers/clocksource/mxs_timer.c
index f6ddae30933f..e9c956343b1b 100644
--- a/drivers/clocksource/mxs_timer.c
+++ b/drivers/clocksource/mxs_timer.c
@@ -279,4 +279,4 @@ static int __init mxs_timer_init(struct device_node *np)
 
 	return setup_irq(irq, &mxs_timer_irq);
 }
-TIMER_OF_DECLARE(mxs, "fsl,timrot", mxs_timer_init);
+TIMER_OF_DECLARE(mxs, "fsl,timrot", mxs_timer_init, NULL);
diff --git a/drivers/clocksource/nomadik-mtu.c b/drivers/clocksource/nomadik-mtu.c
index 3f7fa8c01367..20f936d82cf2 100644
--- a/drivers/clocksource/nomadik-mtu.c
+++ b/drivers/clocksource/nomadik-mtu.c
@@ -278,4 +278,4 @@ static int __init nmdk_timer_of_init(struct device_node *node)
 	return nmdk_timer_init(base, irq, pclk, clk);
 }
 TIMER_OF_DECLARE(nomadik_mtu, "st,nomadik-mtu",
-		       nmdk_timer_of_init);
+		       nmdk_timer_of_init, NULL);
diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 37c39b901bb1..3f1ce12c08b1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -253,4 +253,4 @@ static int __init ostm_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
+TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init, NULL);
diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 895f53eb5771..c11efae14130 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -463,7 +463,8 @@ static int __init s3c2410_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s3c24xx_variant);
 }
-TIMER_OF_DECLARE(s3c2410_pwm, "samsung,s3c2410-pwm", s3c2410_pwm_clocksource_init);
+TIMER_OF_DECLARE(s3c2410_pwm, "samsung,s3c2410-pwm",
+		 s3c2410_pwm_clocksource_init, NULL);
 
 static const struct samsung_pwm_variant s3c64xx_variant = {
 	.bits		= 32,
@@ -476,7 +477,8 @@ static int __init s3c64xx_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s3c64xx_variant);
 }
-TIMER_OF_DECLARE(s3c6400_pwm, "samsung,s3c6400-pwm", s3c64xx_pwm_clocksource_init);
+TIMER_OF_DECLARE(s3c6400_pwm, "samsung,s3c6400-pwm",
+		 s3c64xx_pwm_clocksource_init, NULL);
 
 static const struct samsung_pwm_variant s5p64x0_variant = {
 	.bits		= 32,
@@ -489,7 +491,8 @@ static int __init s5p64x0_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s5p64x0_variant);
 }
-TIMER_OF_DECLARE(s5p6440_pwm, "samsung,s5p6440-pwm", s5p64x0_pwm_clocksource_init);
+TIMER_OF_DECLARE(s5p6440_pwm, "samsung,s5p6440-pwm",
+		 s5p64x0_pwm_clocksource_init, NULL);
 
 static const struct samsung_pwm_variant s5p_variant = {
 	.bits		= 32,
@@ -502,5 +505,6 @@ static int __init s5p_pwm_clocksource_init(struct device_node *np)
 {
 	return samsung_pwm_alloc(np, &s5p_variant);
 }
-TIMER_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm", s5p_pwm_clocksource_init);
+TIMER_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm",
+		 s5p_pwm_clocksource_init, NULL);
 #endif
diff --git a/drivers/clocksource/timer-armada-370-xp.c b/drivers/clocksource/timer-armada-370-xp.c
index edf1a46269f1..377158491bf0 100644
--- a/drivers/clocksource/timer-armada-370-xp.c
+++ b/drivers/clocksource/timer-armada-370-xp.c
@@ -352,7 +352,7 @@ static int __init armada_xp_timer_init(struct device_node *np)
 	return armada_370_xp_timer_common_init(np);
 }
 TIMER_OF_DECLARE(armada_xp, "marvell,armada-xp-timer",
-		       armada_xp_timer_init);
+		       armada_xp_timer_init, NULL);
 
 static int __init armada_375_timer_init(struct device_node *np)
 {
@@ -390,7 +390,7 @@ static int __init armada_375_timer_init(struct device_node *np)
 	return armada_370_xp_timer_common_init(np);
 }
 TIMER_OF_DECLARE(armada_375, "marvell,armada-375-timer",
-		       armada_375_timer_init);
+		       armada_375_timer_init, NULL);
 
 static int __init armada_370_timer_init(struct device_node *np)
 {
@@ -413,4 +413,4 @@ static int __init armada_370_timer_init(struct device_node *np)
 	return armada_370_xp_timer_common_init(np);
 }
 TIMER_OF_DECLARE(armada_370, "marvell,armada-370-timer",
-		       armada_370_timer_init);
+		       armada_370_timer_init, NULL);
diff --git a/drivers/clocksource/timer-atcpit100.c b/drivers/clocksource/timer-atcpit100.c
index b4bd2f5b801d..111f722bf76a 100644
--- a/drivers/clocksource/timer-atcpit100.c
+++ b/drivers/clocksource/timer-atcpit100.c
@@ -224,10 +224,6 @@ static int __init atcpit100_timer_init(struct device_node *node)
 	u32 val;
 	void __iomem *base;
 
-	ret = timer_of_init(node, &to);
-	if (ret)
-		return ret;
-
 	base = timer_of_base(&to);
 
 	sched_clock_register(atcpit100_timer_sched_read, 32,
@@ -263,4 +259,4 @@ static int __init atcpit100_timer_init(struct device_node *node)
 	return ret;
 }
 
-TIMER_OF_DECLARE(atcpit100, "andestech,atcpit100", atcpit100_timer_init);
+TIMER_OF_DECLARE(atcpit100, "andestech,atcpit100", atcpit100_timer_init, &to);
diff --git a/drivers/clocksource/timer-atlas7.c b/drivers/clocksource/timer-atlas7.c
index 93c3ac6d72bd..a352fa0c8827 100644
--- a/drivers/clocksource/timer-atlas7.c
+++ b/drivers/clocksource/timer-atlas7.c
@@ -282,4 +282,5 @@ static int __init sirfsoc_of_timer_init(struct device_node *np)
 
 	return sirfsoc_atlas7_timer_init(np);
 }
-TIMER_OF_DECLARE(sirfsoc_atlas7_timer, "sirf,atlas7-tick", sirfsoc_of_timer_init);
+TIMER_OF_DECLARE(sirfsoc_atlas7_timer, "sirf,atlas7-tick",
+		 sirfsoc_of_timer_init, NULL);
diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
index b4f264ed1937..8937cdcd2fb3 100644
--- a/drivers/clocksource/timer-atmel-pit.c
+++ b/drivers/clocksource/timer-atmel-pit.c
@@ -261,4 +261,4 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
 	return ret;
 }
 TIMER_OF_DECLARE(at91sam926x_pit, "atmel,at91sam9260-pit",
-		       at91sam926x_pit_dt_init);
+		       at91sam926x_pit_dt_init, NULL);
diff --git a/drivers/clocksource/timer-atmel-st.c b/drivers/clocksource/timer-atmel-st.c
index ab0aabfae5f0..a538e1820f29 100644
--- a/drivers/clocksource/timer-atmel-st.c
+++ b/drivers/clocksource/timer-atmel-st.c
@@ -248,4 +248,4 @@ static int __init atmel_st_timer_init(struct device_node *node)
 	return clocksource_register_hz(&clk32k, sclk_rate);
 }
 TIMER_OF_DECLARE(atmel_st_timer, "atmel,at91rm9200-st",
-		       atmel_st_timer_init);
+		       atmel_st_timer_init, NULL);
diff --git a/drivers/clocksource/timer-atmel-tcb.c b/drivers/clocksource/timer-atmel-tcb.c
index 7427b07495a8..f551a5bd6421 100644
--- a/drivers/clocksource/timer-atmel-tcb.c
+++ b/drivers/clocksource/timer-atmel-tcb.c
@@ -492,4 +492,4 @@ static int __init tcb_clksrc_init(struct device_node *node)
 
 	return ret;
 }
-TIMER_OF_DECLARE(atmel_tcb_clksrc, "atmel,tcb-timer", tcb_clksrc_init);
+TIMER_OF_DECLARE(atmel_tcb_clksrc, "atmel,tcb-timer", tcb_clksrc_init, NULL);
diff --git a/drivers/clocksource/timer-cadence-ttc.c b/drivers/clocksource/timer-cadence-ttc.c
index 88fe2e9ba9a3..8762fd1b807c 100644
--- a/drivers/clocksource/timer-cadence-ttc.c
+++ b/drivers/clocksource/timer-cadence-ttc.c
@@ -532,4 +532,4 @@ static int __init ttc_timer_init(struct device_node *timer)
 	return 0;
 }
 
-TIMER_OF_DECLARE(ttc, "cdns,ttc", ttc_timer_init);
+TIMER_OF_DECLARE(ttc, "cdns,ttc", ttc_timer_init, NULL);
diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
index 62745c962049..3c16f14c01f0 100644
--- a/drivers/clocksource/timer-davinci.c
+++ b/drivers/clocksource/timer-davinci.c
@@ -366,4 +366,5 @@ static int __init of_davinci_timer_register(struct device_node *np)
 
 	return rv;
 }
-TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_register);
+TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_register,
+		 NULL);
diff --git a/drivers/clocksource/timer-digicolor.c b/drivers/clocksource/timer-digicolor.c
index 1e984a4d8ad0..e292c1331d49 100644
--- a/drivers/clocksource/timer-digicolor.c
+++ b/drivers/clocksource/timer-digicolor.c
@@ -204,4 +204,4 @@ static int __init digicolor_timer_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(conexant_digicolor, "cnxt,cx92755-timer",
-		       digicolor_timer_init);
+		       digicolor_timer_init, NULL);
diff --git a/drivers/clocksource/timer-efm32.c b/drivers/clocksource/timer-efm32.c
index 5a22cb079ad3..75ec67a085f4 100644
--- a/drivers/clocksource/timer-efm32.c
+++ b/drivers/clocksource/timer-efm32.c
@@ -280,5 +280,5 @@ static int __init efm32_timer_init(struct device_node *np)
 
 	return ret;
 }
-TIMER_OF_DECLARE(efm32compat, "efm32,timer", efm32_timer_init);
-TIMER_OF_DECLARE(efm32, "energymicro,efm32-timer", efm32_timer_init);
+TIMER_OF_DECLARE(efm32compat, "efm32,timer", efm32_timer_init, NULL);
+TIMER_OF_DECLARE(efm32, "energymicro,efm32-timer", efm32_timer_init, NULL);
diff --git a/drivers/clocksource/timer-fsl-ftm.c b/drivers/clocksource/timer-fsl-ftm.c
index a9d9a3ca5996..8b97a777a39e 100644
--- a/drivers/clocksource/timer-fsl-ftm.c
+++ b/drivers/clocksource/timer-fsl-ftm.c
@@ -358,4 +358,4 @@ static int __init ftm_timer_init(struct device_node *np)
 	kfree(priv);
 	return ret;
 }
-TIMER_OF_DECLARE(flextimer, "fsl,ftm-timer", ftm_timer_init);
+TIMER_OF_DECLARE(flextimer, "fsl,ftm-timer", ftm_timer_init, NULL);
diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index fadff7915dd9..d1e4dbe3c494 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -414,8 +414,8 @@ static __init int fttmr010_timer_init(struct device_node *np)
 	return fttmr010_common_init(np, false);
 }
 
-TIMER_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
-TIMER_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
-TIMER_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
-TIMER_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init);
-TIMER_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init);
+TIMER_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init, NULL);
+TIMER_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init, NULL);
+TIMER_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init, NULL);
+TIMER_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init, NULL);
+TIMER_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init, NULL);
diff --git a/drivers/clocksource/timer-gx6605s.c b/drivers/clocksource/timer-gx6605s.c
index 80d0939d040b..e92822cde2a1 100644
--- a/drivers/clocksource/timer-gx6605s.c
+++ b/drivers/clocksource/timer-gx6605s.c
@@ -143,12 +143,9 @@ static int __init gx6605s_timer_init(struct device_node *np)
 	 * The counter at 0x40 offset is clock source.
 	 * They are the same in hardware, just different used by driver.
 	 */
-	ret = timer_of_init(np, &to);
-	if (ret)
-		return ret;
-
 	gx6605s_clkevt_init(timer_of_base(&to));
 
 	return gx6605s_clksrc_init(timer_of_base(&to) + CLKSRC_OFFSET);
 }
-TIMER_OF_DECLARE(csky_gx6605s_timer, "csky,gx6605s-timer", gx6605s_timer_init);
+TIMER_OF_DECLARE(csky_gx6605s_timer, "csky,gx6605s-timer", gx6605s_timer_init,
+		 &to);
diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 706c0d0ff56c..c7ff0c6b5208 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -516,15 +516,15 @@ static int __init imx6dl_timer_init_dt(struct device_node *np)
 	return mxc_timer_init_dt(np, GPT_TYPE_IMX6DL);
 }
 
-TIMER_OF_DECLARE(imx1_timer, "fsl,imx1-gpt", imx1_timer_init_dt);
-TIMER_OF_DECLARE(imx21_timer, "fsl,imx21-gpt", imx21_timer_init_dt);
-TIMER_OF_DECLARE(imx27_timer, "fsl,imx27-gpt", imx21_timer_init_dt);
-TIMER_OF_DECLARE(imx31_timer, "fsl,imx31-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx25_timer, "fsl,imx25-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx50_timer, "fsl,imx50-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx51_timer, "fsl,imx51-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx53_timer, "fsl,imx53-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt);
-TIMER_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt);
-TIMER_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt);
-TIMER_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);
+TIMER_OF_DECLARE(imx1_timer, "fsl,imx1-gpt", imx1_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx21_timer, "fsl,imx21-gpt", imx21_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx27_timer, "fsl,imx27-gpt", imx21_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx31_timer, "fsl,imx31-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx25_timer, "fsl,imx25-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx50_timer, "fsl,imx50-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx51_timer, "fsl,imx51-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx53_timer, "fsl,imx53-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt, NULL);
+TIMER_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt, NULL);
diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/timer-imx-sysctr.c
index b7c80a368a1b..bf6b13e9037a 100644
--- a/drivers/clocksource/timer-imx-sysctr.c
+++ b/drivers/clocksource/timer-imx-sysctr.c
@@ -130,12 +130,6 @@ static void __init sysctr_clockevent_init(void)
 
 static int __init sysctr_timer_init(struct device_node *np)
 {
-	int ret = 0;
-
-	ret = timer_of_init(np, &to_sysctr);
-	if (ret)
-		return ret;
-
 	/* system counter clock is divided by 3 internally */
 	to_sysctr.of_clk.rate /= SYS_CTR_CLK_DIV;
 
@@ -147,4 +141,5 @@ static int __init sysctr_timer_init(struct device_node *np)
 
 	return 0;
 }
-TIMER_OF_DECLARE(sysctr_timer, "nxp,sysctr-timer", sysctr_timer_init);
+TIMER_OF_DECLARE(sysctr_timer, "nxp,sysctr-timer", sysctr_timer_init,
+		 &to_sysctr);
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index c1d52d5264c2..208a6281bd90 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -188,10 +188,6 @@ static int __init tpm_timer_init(struct device_node *np)
 		return ret;
 	}
 
-	ret = timer_of_init(np, &to_tpm);
-	if (ret)
-		return ret;
-
 	timer_base = timer_of_base(&to_tpm);
 
 	counter_width = (readl(timer_base + TPM_PARAM)
@@ -231,4 +227,4 @@ static int __init tpm_timer_init(struct device_node *np)
 
 	return tpm_clocksource_init();
 }
-TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init);
+TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init, &to_tpm);
diff --git a/drivers/clocksource/timer-integrator-ap.c b/drivers/clocksource/timer-integrator-ap.c
index c90a69c7b5fa..8d6f814ace36 100644
--- a/drivers/clocksource/timer-integrator-ap.c
+++ b/drivers/clocksource/timer-integrator-ap.c
@@ -227,4 +227,4 @@ static int __init integrator_ap_timer_init_of(struct device_node *node)
 }
 
 TIMER_OF_DECLARE(integrator_ap_timer, "arm,integrator-timer",
-		       integrator_ap_timer_init_of);
+		       integrator_ap_timer_init_of, NULL);
diff --git a/drivers/clocksource/timer-ixp4xx.c b/drivers/clocksource/timer-ixp4xx.c
index 9396745e1c17..dc38f714183b 100644
--- a/drivers/clocksource/timer-ixp4xx.c
+++ b/drivers/clocksource/timer-ixp4xx.c
@@ -290,5 +290,5 @@ static __init int ixp4xx_of_timer_init(struct device_node *np)
 	iounmap(base);
 	return ret;
 }
-TIMER_OF_DECLARE(ixp4xx, "intel,ixp4xx-timer", ixp4xx_of_timer_init);
+TIMER_OF_DECLARE(ixp4xx, "intel,ixp4xx-timer", ixp4xx_of_timer_init, NULL);
 #endif
diff --git a/drivers/clocksource/timer-keystone.c b/drivers/clocksource/timer-keystone.c
index fea8a4f85669..bcae8ba40cba 100644
--- a/drivers/clocksource/timer-keystone.c
+++ b/drivers/clocksource/timer-keystone.c
@@ -223,4 +223,4 @@ static int __init keystone_timer_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(keystone_timer, "ti,keystone-timer",
-			   keystone_timer_init);
+			   keystone_timer_init, NULL);
diff --git a/drivers/clocksource/timer-lpc32xx.c b/drivers/clocksource/timer-lpc32xx.c
index d51a62a79ef7..e1b979a3a95d 100644
--- a/drivers/clocksource/timer-lpc32xx.c
+++ b/drivers/clocksource/timer-lpc32xx.c
@@ -311,4 +311,4 @@ static int __init lpc32xx_timer_init(struct device_node *np)
 
 	return ret;
 }
-TIMER_OF_DECLARE(lpc32xx_timer, "nxp,lpc3220-timer", lpc32xx_timer_init);
+TIMER_OF_DECLARE(lpc32xx_timer, "nxp,lpc3220-timer", lpc32xx_timer_init, NULL);
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index a562f491b0f8..f9532c9cee41 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -241,7 +241,7 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
 	       timer_of_base(to) + GPT_IRQ_EN_REG);
 }
 
-static struct timer_of to = {
+static struct timer_of mtk_syst_to = {
 	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
 
 	.clkevt = {
@@ -251,69 +251,71 @@ static struct timer_of to = {
 	},
 
 	.of_irq = {
+		.handler = mtk_syst_handler,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+	},
+};
+
+static struct timer_of mtk_gpt_to = {
+	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
+
+	.clkevt = {
+		.name = "mtk-clkevt",
+		.rating = 300,
+		.cpumask = cpu_possible_mask,
+	},
+
+	.of_irq = {
+		.handler = mtk_gpt_interrupt,
 		.flags = IRQF_TIMER | IRQF_IRQPOLL,
 	},
 };
 
 static int __init mtk_syst_init(struct device_node *node)
 {
-	int ret;
-
-	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
-	to.clkevt.set_state_shutdown = mtk_syst_clkevt_shutdown;
-	to.clkevt.set_state_oneshot = mtk_syst_clkevt_oneshot;
-	to.clkevt.tick_resume = mtk_syst_clkevt_resume;
-	to.clkevt.set_next_event = mtk_syst_clkevt_next_event;
-	to.of_irq.handler = mtk_syst_handler;
+	struct timer_of *to = &mtk_syst_to;
 
-	ret = timer_of_init(node, &to);
-	if (ret)
-		goto err;
+	to->clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
+	to->clkevt.set_state_shutdown = mtk_syst_clkevt_shutdown;
+	to->clkevt.set_state_oneshot = mtk_syst_clkevt_oneshot;
+	to->clkevt.tick_resume = mtk_syst_clkevt_resume;
+	to->clkevt.set_next_event = mtk_syst_clkevt_next_event;
 
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
 	return 0;
-err:
-	timer_of_cleanup(&to);
-	return ret;
 }
 
 static int __init mtk_gpt_init(struct device_node *node)
 {
-	int ret;
-
-	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
-	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
-	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
-	to.clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
-	to.clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
-	to.clkevt.set_next_event = mtk_gpt_clkevt_next_event;
-	to.of_irq.handler = mtk_gpt_interrupt;
+	struct timer_of *to = &mtk_gpt_to;
 
-	ret = timer_of_init(node, &to);
-	if (ret)
-		goto err;
+	to->clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	to->clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
+	to->clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
+	to->clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
+	to->clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
+	to->clkevt.set_next_event = mtk_gpt_clkevt_next_event;
 
 	/* Configure clock source */
-	mtk_gpt_setup(&to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
-	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
-			      node->name, timer_of_rate(&to), 300, 32,
+	mtk_gpt_setup(to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
+	clocksource_mmio_init(timer_of_base(to) + GPT_CNT_REG(TIMER_CLK_SRC),
+			      node->name, timer_of_rate(to), 300, 32,
 			      clocksource_mmio_readl_up);
-	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
-	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
+	gpt_sched_reg = timer_of_base(to) + GPT_CNT_REG(TIMER_CLK_SRC);
+	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(to));
 
 	/* Configure clock event */
-	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+	mtk_gpt_setup(to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	mtk_gpt_enable_irq(to, TIMER_CLK_EVT);
 
 	return 0;
-err:
-	timer_of_cleanup(&to);
-	return ret;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init,
+		 &mtk_gpt_to);
+TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init,
+		 &mtk_syst_to);
diff --git a/drivers/clocksource/timer-meson6.c b/drivers/clocksource/timer-meson6.c
index 9e8b467c71da..2cb0bfcc56d7 100644
--- a/drivers/clocksource/timer-meson6.c
+++ b/drivers/clocksource/timer-meson6.c
@@ -214,4 +214,4 @@ static int __init meson6_timer_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(meson6, "amlogic,meson6-timer",
-		       meson6_timer_init);
+		       meson6_timer_init, NULL);
diff --git a/drivers/clocksource/timer-milbeaut.c b/drivers/clocksource/timer-milbeaut.c
index fa9fb4eacade..f601ac905751 100644
--- a/drivers/clocksource/timer-milbeaut.c
+++ b/drivers/clocksource/timer-milbeaut.c
@@ -167,13 +167,8 @@ static u64 notrace mlb_timer_sched_read(void)
 
 static int __init mlb_timer_init(struct device_node *node)
 {
-	int ret;
 	unsigned long rate;
 
-	ret = timer_of_init(node, &to);
-	if (ret)
-		return ret;
-
 	rate = timer_of_rate(&to) / MLB_TMR_DIV_CNT;
 	mlb_config_clock_source(&to);
 	clocksource_mmio_init(timer_of_base(&to) + MLB_TMR_SRC_TMR_OFS,
@@ -186,4 +181,4 @@ static int __init mlb_timer_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(mlb_peritimer, "socionext,milbeaut-timer",
-		mlb_timer_init);
+		mlb_timer_init, &to);
diff --git a/drivers/clocksource/timer-mp-csky.c b/drivers/clocksource/timer-mp-csky.c
index dd263c8de580..0ac315597571 100644
--- a/drivers/clocksource/timer-mp-csky.c
+++ b/drivers/clocksource/timer-mp-csky.c
@@ -48,6 +48,7 @@ static int csky_mptimer_oneshot_stopped(struct clock_event_device *ce)
 
 static DEFINE_PER_CPU(struct timer_of, csky_to) = {
 	.flags					= TIMER_OF_CLOCK | TIMER_OF_IRQ,
+	.percpu					= true,
 	.clkevt = {
 		.rating				= 300,
 		.features			= CLOCK_EVT_FEAT_PERCPU |
@@ -138,11 +139,6 @@ static int __init csky_mptimer_init(struct device_node *np)
 	 * We use private irq for the mptimer and irq number is the same
 	 * for every core. So we use request_percpu_irq() in timer_of_init.
 	 */
-
-	ret = timer_of_init(np, to);
-	if (ret)
-		return -EINVAL;
-
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&csky_to, cpu);
 
@@ -162,13 +158,8 @@ static int __init csky_mptimer_init(struct device_node *np)
 				csky_mptimer_starting_cpu,
 				csky_mptimer_dying_cpu);
 	if (ret)
-		goto rollback;
+		return -EINVAL;
 
 	return 0;
-
-rollback:
-	timer_of_cleanup(to);
-
-	return -EINVAL;
 }
-TIMER_OF_DECLARE(csky_mptimer, "csky,mptimer", csky_mptimer_init);
+TIMER_OF_DECLARE(csky_mptimer, "csky,mptimer", csky_mptimer_init, &csky_to);
diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 9780ffd8010e..031d1ad2f54d 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -188,12 +188,6 @@ static void __init npcm7xx_clocksource_init(void)
 
 static int __init npcm7xx_timer_init(struct device_node *np)
 {
-	int ret;
-
-	ret = timer_of_init(np, &npcm7xx_to);
-	if (ret)
-		return ret;
-
 	/* Clock input is divided by PRESCALE + 1 before it is fed */
 	/* to the counter */
 	npcm7xx_to.of_clk.rate = npcm7xx_to.of_clk.rate /
@@ -208,5 +202,6 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);
+TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init,
+		 &npcm7xx_to);
 
diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
index 7b6bb0df96ae..4d6b60b9eaa7 100644
--- a/drivers/clocksource/timer-nps.c
+++ b/drivers/clocksource/timer-nps.c
@@ -111,9 +111,9 @@ static int __init nps_setup_clocksource(struct device_node *node)
 }
 
 TIMER_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
-		       nps_setup_clocksource);
+		       nps_setup_clocksource, NULL);
 TIMER_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
-		       nps_setup_clocksource);
+		       nps_setup_clocksource, NULL);
 
 #ifdef CONFIG_EZNPS_MTM_EXT
 #include <soc/nps/mtm.h>
@@ -280,5 +280,5 @@ static int __init nps_setup_clockevent(struct device_node *node)
 }
 
 TIMER_OF_DECLARE(ezchip_nps400_clk_evt, "ezchip,nps400-timer0",
-		       nps_setup_clockevent);
+		       nps_setup_clockevent, NULL);
 #endif /* CONFIG_EZNPS_MTM_EXT */
diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index d8c2bd4391d0..814276decb07 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -165,9 +165,12 @@ static __init int timer_of_base_init(struct device_node *np,
 
 int __init timer_of_init(struct device_node *np, struct timer_of *to)
 {
-	int ret = -EINVAL;
+	int ret = 0;
 	int flags = 0;
 
+	if (!to)
+		return ret;
+
 	if (to->flags & TIMER_OF_BASE) {
 		ret = timer_of_base_init(np, &to->of_base);
 		if (ret)
@@ -217,6 +220,9 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
  */
 void __init timer_of_cleanup(struct timer_of *to)
 {
+	if (!to)
+		return;
+
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
 
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index a5478f3e8589..ee467bb16ca3 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -33,6 +33,7 @@ struct of_timer_clk {
 
 struct timer_of {
 	unsigned int flags;
+	unsigned int percpu;
 	struct device_node *np;
 	struct clock_event_device clkevt;
 	struct of_timer_base of_base;
@@ -41,6 +42,7 @@ struct timer_of {
 	void *private_data;
 };
 
+#ifdef CONFIG_OF
 static inline struct timer_of *to_timer_of(struct clock_event_device *clkevt)
 {
 	return container_of(clkevt, struct timer_of, clkevt);
@@ -71,4 +73,13 @@ extern int __init timer_of_init(struct device_node *np,
 
 extern void __init timer_of_cleanup(struct timer_of *to);
 
+#else
+
+static int __init timer_of_init(struct device_node *np, struct timer_of *to)
+{
+	return 0;
+}
+
+#endif
+
 #endif
diff --git a/drivers/clocksource/timer-orion.c b/drivers/clocksource/timer-orion.c
index 7d487107e3cd..28b6ec2b99c6 100644
--- a/drivers/clocksource/timer-orion.c
+++ b/drivers/clocksource/timer-orion.c
@@ -189,4 +189,4 @@ static int __init orion_timer_init(struct device_node *np)
 
 	return 0;
 }
-TIMER_OF_DECLARE(orion_timer, "marvell,orion-timer", orion_timer_init);
+TIMER_OF_DECLARE(orion_timer, "marvell,orion-timer", orion_timer_init, NULL);
diff --git a/drivers/clocksource/timer-owl.c b/drivers/clocksource/timer-owl.c
index 900fe736145d..b7f376f13a52 100644
--- a/drivers/clocksource/timer-owl.c
+++ b/drivers/clocksource/timer-owl.c
@@ -164,6 +164,6 @@ static int __init owl_timer_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(owl_s500, "actions,s500-timer", owl_timer_init);
-TIMER_OF_DECLARE(owl_s700, "actions,s700-timer", owl_timer_init);
-TIMER_OF_DECLARE(owl_s900, "actions,s900-timer", owl_timer_init);
+TIMER_OF_DECLARE(owl_s500, "actions,s500-timer", owl_timer_init, NULL);
+TIMER_OF_DECLARE(owl_s700, "actions,s700-timer", owl_timer_init, NULL);
+TIMER_OF_DECLARE(owl_s900, "actions,s900-timer", owl_timer_init, NULL);
diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
index 56c0cc32d0ac..348c3b9ce207 100644
--- a/drivers/clocksource/timer-oxnas-rps.c
+++ b/drivers/clocksource/timer-oxnas-rps.c
@@ -283,6 +283,6 @@ static int __init oxnas_rps_timer_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(ox810se_rps,
-		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init);
+		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init, NULL);
 TIMER_OF_DECLARE(ox820_rps,
-		       "oxsemi,ox820-rps-timer", oxnas_rps_timer_init);
+		       "oxsemi,ox820-rps-timer", oxnas_rps_timer_init, NULL);
diff --git a/drivers/clocksource/timer-pistachio.c b/drivers/clocksource/timer-pistachio.c
index a2dd85d0c1d7..4bd35269a71e 100644
--- a/drivers/clocksource/timer-pistachio.c
+++ b/drivers/clocksource/timer-pistachio.c
@@ -215,4 +215,4 @@ static int __init pistachio_clksrc_of_init(struct device_node *node)
 	return clocksource_register_hz(&pcs_gpt.cs, rate);
 }
 TIMER_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
-		       pistachio_clksrc_of_init);
+		       pistachio_clksrc_of_init, NULL);
diff --git a/drivers/clocksource/timer-prima2.c b/drivers/clocksource/timer-prima2.c
index d4a9dcf5fba2..b3fa5333edbe 100644
--- a/drivers/clocksource/timer-prima2.c
+++ b/drivers/clocksource/timer-prima2.c
@@ -245,4 +245,4 @@ static int __init sirfsoc_prima2_timer_init(struct device_node *np)
 	return 0;
 }
 TIMER_OF_DECLARE(sirfsoc_prima2_timer,
-	"sirf,prima2-tick", sirfsoc_prima2_timer_init);
+	"sirf,prima2-tick", sirfsoc_prima2_timer_init, NULL);
diff --git a/drivers/clocksource/timer-probe.c b/drivers/clocksource/timer-probe.c
index ee9574da53c0..bda1875cda13 100644
--- a/drivers/clocksource/timer-probe.c
+++ b/drivers/clocksource/timer-probe.c
@@ -7,6 +7,9 @@
 #include <linux/init.h>
 #include <linux/of.h>
 #include <linux/clocksource.h>
+#include <linux/interrupt.h>
+
+#include "timer-of.h"
 
 extern struct of_device_id __timer_of_table[];
 
@@ -18,6 +21,8 @@ void __init timer_probe(void)
 	struct device_node *np;
 	const struct of_device_id *match;
 	of_init_fn_1_ret init_func_ret;
+	const struct timer_probe_data *data;
+	struct timer_of *to;
 	unsigned timers = 0;
 	int ret;
 
@@ -25,13 +30,23 @@ void __init timer_probe(void)
 		if (!of_device_is_available(np))
 			continue;
 
-		init_func_ret = match->data;
+		data = match->data;
+		to = data->timer_of;
+		if (to && to->percpu)
+			to = this_cpu_ptr(to);
+		ret = timer_of_init(np, to);
+		if (ret) {
+			pr_err("Failed to initialize timer_of: '%pOF': %d\n", np, ret);
+			continue;
+		}
 
+		init_func_ret = data->fn;
 		ret = init_func_ret(np);
 		if (ret) {
 			if (ret != -EPROBE_DEFER)
 				pr_err("Failed to initialize '%pOF': %d\n", np,
 				       ret);
+			timer_of_cleanup(to);
 			continue;
 		}
 
diff --git a/drivers/clocksource/timer-pxa.c b/drivers/clocksource/timer-pxa.c
index 913a5d354a1f..ac4bcf357f59 100644
--- a/drivers/clocksource/timer-pxa.c
+++ b/drivers/clocksource/timer-pxa.c
@@ -213,7 +213,7 @@ static int __init pxa_timer_dt_init(struct device_node *np)
 
 	return pxa_timer_common_init(irq, clk_get_rate(clk));
 }
-TIMER_OF_DECLARE(pxa_timer, "marvell,pxa-timer", pxa_timer_dt_init);
+TIMER_OF_DECLARE(pxa_timer, "marvell,pxa-timer", pxa_timer_dt_init, NULL);
 
 /*
  * Legacy timer init for non device-tree boards.
diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index b4afe3a67583..582070502810 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -245,5 +245,5 @@ static int __init msm_dt_timer_init(struct device_node *np)
 
 	return msm_timer_init(freq, 32, irq, !!percpu_offset);
 }
-TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init);
-TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init);
+TIMER_OF_DECLARE(kpss_timer, "qcom,kpss-timer", msm_dt_timer_init, NULL);
+TIMER_OF_DECLARE(scss_timer, "qcom,scss-timer", msm_dt_timer_init, NULL);
diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
index fd1199c189bf..74f4f60a3d36 100644
--- a/drivers/clocksource/timer-rda.c
+++ b/drivers/clocksource/timer-rda.c
@@ -178,11 +178,6 @@ static struct clocksource rda_hwtimer_clocksource = {
 static int __init rda_timer_init(struct device_node *np)
 {
 	unsigned long rate = 2000000;
-	int ret;
-
-	ret = timer_of_init(np, &rda_ostimer_of);
-	if (ret)
-		return ret;
 
 	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
 
@@ -192,4 +187,5 @@ static int __init rda_timer_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(rda8810pl, "rda,8810pl-timer", rda_timer_init);
+TIMER_OF_DECLARE(rda8810pl, "rda,8810pl-timer", rda_timer_init,
+		 &rda_ostimer_of);
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 5e6038fbf115..083be1d65474 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -131,4 +131,4 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	return error;
 }
 
-TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt, NULL);
diff --git a/drivers/clocksource/timer-rockchip.c b/drivers/clocksource/timer-rockchip.c
index 1f95d0aca08f..ee1861028b81 100644
--- a/drivers/clocksource/timer-rockchip.c
+++ b/drivers/clocksource/timer-rockchip.c
@@ -300,5 +300,5 @@ static int __init rk_timer_init(struct device_node *np)
 	return -EINVAL;
 }
 
-TIMER_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer", rk_timer_init);
-TIMER_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer", rk_timer_init);
+TIMER_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer", rk_timer_init, NULL);
+TIMER_OF_DECLARE(rk3399_timer, "rockchip,rk3399-timer", rk_timer_init, NULL);
diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-sp804.c
index 9c841980eed1..4091092cc285 100644
--- a/drivers/clocksource/timer-sp804.c
+++ b/drivers/clocksource/timer-sp804.c
@@ -275,7 +275,7 @@ static int __init sp804_of_init(struct device_node *np)
 	iounmap(base);
 	return ret;
 }
-TIMER_OF_DECLARE(sp804, "arm,sp804", sp804_of_init);
+TIMER_OF_DECLARE(sp804, "arm,sp804", sp804_of_init, NULL);
 
 static int __init integrator_cp_of_init(struct device_node *np)
 {
@@ -323,4 +323,4 @@ static int __init integrator_cp_of_init(struct device_node *np)
 	iounmap(base);
 	return ret;
 }
-TIMER_OF_DECLARE(intcp, "arm,integrator-cp-timer", integrator_cp_of_init);
+TIMER_OF_DECLARE(intcp, "arm,integrator-cp-timer", integrator_cp_of_init, NULL);
diff --git a/drivers/clocksource/timer-sprd.c b/drivers/clocksource/timer-sprd.c
index 430cb99d8d79..8b50fcc996ac 100644
--- a/drivers/clocksource/timer-sprd.c
+++ b/drivers/clocksource/timer-sprd.c
@@ -143,12 +143,6 @@ static struct timer_of to = {
 
 static int __init sprd_timer_init(struct device_node *np)
 {
-	int ret;
-
-	ret = timer_of_init(np, &to);
-	if (ret)
-		return ret;
-
 	sprd_timer_enable_interrupt(timer_of_base(&to));
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					1, UINT_MAX);
@@ -192,18 +186,12 @@ static struct clocksource suspend_clocksource = {
 
 static int __init sprd_suspend_timer_init(struct device_node *np)
 {
-	int ret;
-
-	ret = timer_of_init(np, &suspend_to);
-	if (ret)
-		return ret;
-
 	clocksource_register_hz(&suspend_clocksource,
 				timer_of_rate(&suspend_to));
 
 	return 0;
 }
 
-TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init);
+TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init, &to);
 TIMER_OF_DECLARE(sc9860_persistent_timer, "sprd,sc9860-suspend-timer",
-		 sprd_suspend_timer_init);
+		 sprd_suspend_timer_init, &suspend_to);
diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index c9a753f96ba1..4a07e02e7c84 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -285,52 +285,44 @@ static void __init stm32_clockevent_init(struct timer_of *to)
 		to->np, bits);
 }
 
+static struct timer_of to = {
+	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
+
+	.of_irq = {
+		.handler = stm32_clock_event_handler,
+	},
+};
+
 static int __init stm32_timer_init(struct device_node *node)
 {
 	struct reset_control *rstc;
-	struct timer_of *to;
 	int ret;
 
-	to = kzalloc(sizeof(*to), GFP_KERNEL);
-	if (!to)
+	to.private_data = kzalloc(sizeof(struct stm32_timer_private),
+				  GFP_KERNEL);
+	if (!to.private_data)
 		return -ENOMEM;
 
-	to->flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE;
-	to->of_irq.handler = stm32_clock_event_handler;
-
-	ret = timer_of_init(node, to);
-	if (ret)
-		goto err;
-
-	to->private_data = kzalloc(sizeof(struct stm32_timer_private),
-				   GFP_KERNEL);
-	if (!to->private_data) {
-		ret = -ENOMEM;
-		goto deinit;
-	}
-
 	rstc = of_reset_control_get(node, NULL);
 	if (!IS_ERR(rstc)) {
 		reset_control_assert(rstc);
 		reset_control_deassert(rstc);
 	}
 
-	stm32_timer_set_width(to);
+	stm32_timer_set_width(&to);
 
-	stm32_timer_set_prescaler(to);
+	stm32_timer_set_prescaler(&to);
 
-	ret = stm32_clocksource_init(to);
+	ret = stm32_clocksource_init(&to);
 	if (ret)
-		goto deinit;
+		goto err;
 
-	stm32_clockevent_init(to);
+	stm32_clockevent_init(&to);
 	return 0;
 
-deinit:
-	timer_of_cleanup(to);
 err:
-	kfree(to);
+	kfree(to.private_data);
 	return ret;
 }
 
-TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_timer_init);
+TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_timer_init, &to);
diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 0ba8155b8287..1443cf5ca92b 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -171,10 +171,6 @@ static int __init sun4i_timer_init(struct device_node *node)
 	int ret;
 	u32 val;
 
-	ret = timer_of_init(node, &to);
-	if (ret)
-		return ret;
-
 	writel(~0, timer_of_base(&to) + TIMER_INTVAL_REG(1));
 	writel(TIMER_CTL_ENABLE | TIMER_CTL_RELOAD |
 	       TIMER_CTL_CLK_SRC(TIMER_CTL_CLK_SRC_OSC24M),
@@ -218,10 +214,10 @@ static int __init sun4i_timer_init(struct device_node *node)
 	return ret;
 }
 TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
-		       sun4i_timer_init);
+		       sun4i_timer_init, &to);
 TIMER_OF_DECLARE(sun8i_a23, "allwinner,sun8i-a23-timer",
-		 sun4i_timer_init);
+		 sun4i_timer_init, &to);
 TIMER_OF_DECLARE(sun8i_v3s, "allwinner,sun8i-v3s-timer",
-		 sun4i_timer_init);
+		 sun4i_timer_init, &to);
 TIMER_OF_DECLARE(suniv, "allwinner,suniv-f1c100s-timer",
-		       sun4i_timer_init);
+		       sun4i_timer_init, &to);
diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 552c5254390c..78aa54474db6 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -370,6 +370,6 @@ static int __init sun5i_timer_init(struct device_node *node)
 	return sun5i_setup_clockevent(node, timer_base, clk, irq);
 }
 TIMER_OF_DECLARE(sun5i_a13, "allwinner,sun5i-a13-hstimer",
-			   sun5i_timer_init);
+			   sun5i_timer_init, NULL);
 TIMER_OF_DECLARE(sun7i_a20, "allwinner,sun7i-a20-hstimer",
-			   sun5i_timer_init);
+			   sun5i_timer_init, NULL);
diff --git a/drivers/clocksource/timer-tango-xtal.c b/drivers/clocksource/timer-tango-xtal.c
index 3f94e454ef99..9b731a29f572 100644
--- a/drivers/clocksource/timer-tango-xtal.c
+++ b/drivers/clocksource/timer-tango-xtal.c
@@ -54,4 +54,4 @@ static int __init tango_clocksource_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(tango, "sigma,tick-counter", tango_clocksource_init);
+TIMER_OF_DECLARE(tango, "sigma,tick-counter", tango_clocksource_init, NULL);
diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index e9635c25eef4..6da57c51127a 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -115,6 +115,7 @@ static void tegra_timer_resume(struct clock_event_device *evt)
 
 static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
 	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE,
+	.percpu = true,
 
 	.clkevt = {
 		.name = "tegra_timer",
@@ -255,10 +256,6 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 	int cpu, ret;
 
 	to = this_cpu_ptr(&tegra_to);
-	ret = timer_of_init(np, to);
-	if (ret)
-		goto out;
-
 	timer_reg_base = timer_of_base(to);
 
 	/*
@@ -379,7 +376,8 @@ static int __init tegra210_init_timer(struct device_node *np)
 	 */
 	return tegra_init_timer(np, false, 460);
 }
-TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
+TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer,
+		 &tegra_to);
 
 static int __init tegra20_init_timer(struct device_node *np)
 {
@@ -401,16 +399,12 @@ static int __init tegra20_init_timer(struct device_node *np)
 
 	return tegra_init_timer(np, true, rating);
 }
-TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
+TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer,
+		 &tegra_to);
 
 static int __init tegra20_init_rtc(struct device_node *np)
 {
-	int ret;
-
-	ret = timer_of_init(np, &suspend_rtc_to);
-	if (ret)
-		return ret;
-
 	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
 }
-TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc);
+TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc,
+		 &suspend_rtc_to);
diff --git a/drivers/clocksource/timer-ti-32k.c b/drivers/clocksource/timer-ti-32k.c
index abd5f158d6e2..a38d7b039b38 100644
--- a/drivers/clocksource/timer-ti-32k.c
+++ b/drivers/clocksource/timer-ti-32k.c
@@ -116,4 +116,4 @@ static int __init ti_32k_timer_init(struct device_node *np)
 	return 0;
 }
 TIMER_OF_DECLARE(ti_32k_timer, "ti,omap-counter32k",
-		ti_32k_timer_init);
+		ti_32k_timer_init, NULL);
diff --git a/drivers/clocksource/timer-u300.c b/drivers/clocksource/timer-u300.c
index 32adc3057dda..2a2d2f3b36ab 100644
--- a/drivers/clocksource/timer-u300.c
+++ b/drivers/clocksource/timer-u300.c
@@ -459,4 +459,4 @@ static int __init u300_timer_init_of(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(u300_timer, "stericsson,u300-apptimer",
-		       u300_timer_init_of);
+		       u300_timer_init_of, NULL);
diff --git a/drivers/clocksource/timer-versatile.c b/drivers/clocksource/timer-versatile.c
index e4ebb656d005..61eb16c9d1cb 100644
--- a/drivers/clocksource/timer-versatile.c
+++ b/drivers/clocksource/timer-versatile.c
@@ -32,6 +32,6 @@ static int __init versatile_sched_clock_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(vexpress, "arm,vexpress-sysreg",
-		       versatile_sched_clock_init);
+		       versatile_sched_clock_init, NULL);
 TIMER_OF_DECLARE(versatile, "arm,versatile-sysreg",
-		       versatile_sched_clock_init);
+		       versatile_sched_clock_init, NULL);
diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index fef0bb4e0c8c..2aa0f6e93820 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -197,4 +197,4 @@ static int __init pit_timer_init(struct device_node *np)
 
 	return pit_clockevent_init(clk_rate, irq);
 }
-TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init);
+TIMER_OF_DECLARE(vf610, "fsl,vf610-pit", pit_timer_init, NULL);
diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index bb424bcefbb3..57d996863d5a 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -152,4 +152,4 @@ static int __init vt8500_timer_init(struct device_node *np)
 	return 0;
 }
 
-TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init);
+TIMER_OF_DECLARE(vt8500, "via,vt8500-timer", vt8500_timer_init, NULL);
diff --git a/drivers/clocksource/timer-zevio.c b/drivers/clocksource/timer-zevio.c
index c0041561f1be..64cbb6f09dcb 100644
--- a/drivers/clocksource/timer-zevio.c
+++ b/drivers/clocksource/timer-zevio.c
@@ -211,4 +211,4 @@ static int __init zevio_timer_init(struct device_node *node)
 	return zevio_timer_add(node);
 }
 
-TIMER_OF_DECLARE(zevio_timer, "lsi,zevio-timer", zevio_timer_init);
+TIMER_OF_DECLARE(zevio_timer, "lsi,zevio-timer", zevio_timer_init, NULL);
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index b21db536fd52..0db0eb4b6576 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -259,8 +259,34 @@ extern int clocksource_mmio_init(void __iomem *, const char *,
 
 extern int clocksource_i8253_init(void);
 
-#define TIMER_OF_DECLARE(name, compat, fn) \
-	OF_DECLARE_1_RET(timer, name, compat, fn)
+#if defined(CONFIG_OF) && !defined(MODULE)
+#define TIMER_OF_DECLARE_TABLE(name, compat, probe_data)		\
+	static const struct of_device_id __timer_of_table_##name	\
+		__used __section(__timer_of_table)			\
+		= { .compatible = compat,				\
+		    .data = probe_data }
+#else
+#define TIMER_OF_DECLARE_TABLE(name, compat, probe_data)		\
+	static const struct of_device_id __timer_of_table_##name	\
+		__attribute__((unused))					\
+		= { .compatible = compat,				\
+		    .data = probe_data }
+#endif
+
+struct timer_of;
+struct timer_probe_data {
+	of_init_fn_1_ret fn;
+	struct timer_of *timer_of;
+};
+
+#define TIMER_OF_DECLARE(name, compat, handler, to)			\
+	static const struct timer_probe_data timer_probe_data_##name	\
+		= { .fn = (of_init_fn_1_ret)handler,			\
+		    .timer_of = to };					\
+	TIMER_OF_DECLARE_TABLE(name, compat, &timer_probe_data_##name)
+
+#define CLOCKSOURCE_OF_DECLARE(name, compat, fn, to) \
+	TIMER_OF_DECLARE(name, compat, fn, to)
 
 #ifdef CONFIG_TIMER_PROBE
 extern void timer_probe(void);
-- 
2.7.4

