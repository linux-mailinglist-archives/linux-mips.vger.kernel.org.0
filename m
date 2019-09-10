Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E145AEC28
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 15:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbfIJNtr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Sep 2019 09:49:47 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:50799 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfIJNtr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Sep 2019 09:49:47 -0400
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
IronPort-SDR: zyHfnB06nCg+geFme7VfLt5wnHKcDDkhj/IEdWHrCQoLn9L127NVdYqM2PkP2pObvKn8ZHf7+t
 Bkiej9Fs080VbiF+h3hFRdZLzw/4F3jmfE3tYXSB7uvXGy08JSoVDlpmOPpCcFEXzFqv3N83JF
 rhuS33uP+l8ZDpJBUSlPB9aLbIwcipxTsc4wXhVL+bPkJBnGlmDHN0bhxYk0nLysMg1F13H+Rx
 xU209k35gxrgOCQoyETZCTBG1XFfftb3JH0GR/Y0h94l0/3gY1KVAbJBFSpUnzYhSYGJeEHCln
 ZcY=
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="48356035"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Sep 2019 06:49:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Sep 2019 06:49:42 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 10 Sep 2019 06:49:20 -0700
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
Subject: [PATCH 5/7] clocksource/drivers/timer-of: add support support for timer's functionalities
Date:   Tue, 10 Sep 2019 16:47:14 +0300
Message-ID: <1568123236-767-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Timers could feed clocksource and clockevent devices. Even so, there are
timers that could work as clocksource only, clockevent only or both. For
timers that could work only as clocksource or as clockevent there were
used different mechanisms to register one hardware resource to feed a
clocksource device and one hardware resource to feed a clockevent
device.
One of this is: first probed hardware works as clockevent, 2nd probed
hardware works as clocksource device. Another one is to have different
DT compatible for the same hardware but one to register a clocksource
device, another to register a clockevent device. To avoid this, in [1]
it was proposed a chosen node mechanism in DT. The changes in this patch
integrate the proposals in [1] and goes further. It uses TIMER_OF
library
and adapt it. It passes to the probing macro arrays of objects of type
struct timer_of. We need arrays here to cover the following scenario:
One timer driver could be probe 2 times: 1st time to register a physical
device to feed a clocksource device, 2nd timer to register another
physical device (of the same type with the 1st one registered) but that
will feed a clockevent device. If these are 2 different physical devices
they are mapped to a different address, they use different clocks and
also
different IRQ numbers. So for every probe we need a different struct
timer_of object. New flags were introduced in this patch to specify
the functionality that timer drivers support:
- TIMER_OF_TYPE_CE
- TIMER_OF_TYPE_CS
- TIMER_OF_TYPE_CE_AND_CS.

Drivers that could work only as a clocksource could register a
minimum struct timer_of array as follows:

static struct timer_of to[] = {
	{ .flags = TIMER_OF_TYPE_CS },
	{ /* sentinel */ }
};

drivers that could work only as a clockevent could register a minimum
struct timer_of array as follows:

static struct timer_of to[] = {
	{ .flags = TIMER_OF_TYPE_CE },
	{ /* sentinel */ }
};

drivers that could work as both	clocksource and clockevent at the same
time could register a minimum struct timer_of array as follows:

static struct timer_of to[] = {
	{ .flags = TIMER_OF_TYPE_CE_AND_CS },
	{ /* sentinel*/ }
};

And these arrays are passed to the probing system via:
TIMER_OF_DECLARE() or CLOCKSOURCE_OF_DECLARE() macros.

For backward compatibility all the current drivers that are using
TIMER_OF library are registered with TIMER_OF_TYPE_CE_AND_CS flag.

At the probing time, the probing CPU will call timer_of_probe() ->
timer_of_init(). timer_of_init() parses the DT bindings looking for
"linux,clocksource" and "linux,clockevent" chosen DT bindings,
and is looking into the to[] array, passed via TIMER_OF_DELCARE()/
CLOCKSOURCE_OF_DECLARE(), for a unused entry which matches with
the DT bindings (this is done by comparing TIMER_OF_TYPE* probing
flags with TIMER_OF_TYPE* flags retrieved from DT). If there is a
match the to[] entry will be used for the current probing and the
entry is marked as used. to[] entry is considered to be used
if to->np is set. Also the used to[] entry is saved into the data
field of struct device_node used in the probe. In this way the
probing functions of the timer drivers would retrieve the struct
timer_of object to be used in the current probe.

In case of timers which are registering percpu struct timer_of
objects for probing only the percpu timer_of object is used in
the probe time. Currently, these kind of drivers are using only
the struct timer_of object corresponding to the probing CPU to
retrieve DT bindings and then replicate/adapt this information
for the other CPUs.

All the drivers were adapted to this mechanism using
TIMER_OF_TYPE_CE_AND_CS flag for backward compatibility.

[1] https://lore.kernel.org/lkml/20171213185313.20017-3-alexandre.belloni@free-electrons.com/

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clocksource/timer-atcpit100.c  | 70 +++++++++++++++-------------
 drivers/clocksource/timer-gx6605s.c    | 53 ++++++++++++---------
 drivers/clocksource/timer-imx-sysctr.c | 56 ++++++++++++----------
 drivers/clocksource/timer-imx-tpm.c    | 65 ++++++++++++++------------
 drivers/clocksource/timer-mediatek.c   | 64 ++++++++++++++-----------
 drivers/clocksource/timer-milbeaut.c   | 54 +++++++++++----------
 drivers/clocksource/timer-mp-csky.c    |  4 +-
 drivers/clocksource/timer-npcm7xx.c    | 82 ++++++++++++++++----------------
 drivers/clocksource/timer-of.c         | 85 ++++++++++++++++++++++++++++++++--
 drivers/clocksource/timer-of.h         | 16 +++++++
 drivers/clocksource/timer-rda.c        | 60 +++++++++++++-----------
 drivers/clocksource/timer-sprd.c       | 67 +++++++++++++++------------
 drivers/clocksource/timer-stm32.c      | 33 +++++++------
 drivers/clocksource/timer-sun4i.c      | 74 +++++++++++++++--------------
 drivers/clocksource/timer-tegra.c      | 13 +++---
 15 files changed, 479 insertions(+), 317 deletions(-)

diff --git a/drivers/clocksource/timer-atcpit100.c b/drivers/clocksource/timer-atcpit100.c
index 111f722bf76a..586199b6eeda 100644
--- a/drivers/clocksource/timer-atcpit100.c
+++ b/drivers/clocksource/timer-atcpit100.c
@@ -173,38 +173,43 @@ static irqreturn_t atcpit100_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
-
-	.clkevt = {
-		.name = "atcpit100_tick",
-		.rating = 300,
-		.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_shutdown = atcpit100_clkevt_shutdown,
-		.set_state_periodic = atcpit100_clkevt_set_periodic,
-		.set_state_oneshot = atcpit100_clkevt_set_oneshot,
-		.tick_resume = atcpit100_clkevt_shutdown,
-		.set_next_event = atcpit100_clkevt_next_event,
-		.cpumask = cpu_possible_mask,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "atcpit100_tick",
+			.rating = 300,
+			.features = CLOCK_EVT_FEAT_PERIODIC |
+				    CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_shutdown = atcpit100_clkevt_shutdown,
+			.set_state_periodic = atcpit100_clkevt_set_periodic,
+			.set_state_oneshot = atcpit100_clkevt_set_oneshot,
+			.tick_resume = atcpit100_clkevt_shutdown,
+			.set_next_event = atcpit100_clkevt_next_event,
+			.cpumask = cpu_possible_mask,
+		},
+
+		.of_irq = {
+			.handler = atcpit100_timer_interrupt,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
+
+		/*
+		 * FIXME: we currently only support clocking using PCLK
+		 * and using EXTCLK is not supported in the driver.
+		 */
+		.of_clk = {
+			.name = "PCLK",
+		}
 	},
-
-	.of_irq = {
-		.handler = atcpit100_timer_interrupt,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
-	},
-
-	/*
-	 * FIXME: we currently only support clocking using PCLK
-	 * and using EXTCLK is not supported in the driver.
-	 */
-	.of_clk = {
-		.name = "PCLK",
-	}
+	{ /* sentinel. */ }
 };
 
 static u64 notrace atcpit100_timer_sched_read(void)
 {
-	return ~readl(timer_of_base(&to) + CH1_CNT);
+	return ~readl(timer_of_base(to) + CH1_CNT);
 }
 
 #ifdef CONFIG_NDS32
@@ -223,14 +228,15 @@ static int __init atcpit100_timer_init(struct device_node *node)
 	int ret;
 	u32 val;
 	void __iomem *base;
+	struct timer_of *to = node->data;
 
-	base = timer_of_base(&to);
+	base = timer_of_base(to);
 
 	sched_clock_register(atcpit100_timer_sched_read, 32,
-		timer_of_rate(&to));
+		timer_of_rate(to));
 
 	ret = clocksource_mmio_init(base + CH1_CNT,
-		node->name, timer_of_rate(&to), 300, 32,
+		node->name, timer_of_rate(to), 300, 32,
 		clocksource_mmio_readl_down);
 
 	if (ret) {
@@ -241,7 +247,7 @@ static int __init atcpit100_timer_init(struct device_node *node)
 	/* clear channel 0 timer0 interrupt */
 	atcpit100_timer_clear_interrupt(base);
 
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 	atcpit100_ch0_tmr0_en(base);
 	atcpit100_ch1_tmr0_en(base);
@@ -259,4 +265,4 @@ static int __init atcpit100_timer_init(struct device_node *node)
 	return ret;
 }
 
-TIMER_OF_DECLARE(atcpit100, "andestech,atcpit100", atcpit100_timer_init, &to);
+TIMER_OF_DECLARE(atcpit100, "andestech,atcpit100", atcpit100_timer_init, to);
diff --git a/drivers/clocksource/timer-gx6605s.c b/drivers/clocksource/timer-gx6605s.c
index e92822cde2a1..ed39aecf4feb 100644
--- a/drivers/clocksource/timer-gx6605s.c
+++ b/drivers/clocksource/timer-gx6605s.c
@@ -73,21 +73,25 @@ static int gx6605s_timer_shutdown(struct clock_event_device *ce)
 	return 0;
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-	.clkevt = {
-		.rating			= 300,
-		.features		= CLOCK_EVT_FEAT_DYNIRQ |
-					  CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_shutdown	= gx6605s_timer_shutdown,
-		.set_state_oneshot	= gx6605s_timer_set_oneshot,
-		.set_next_event		= gx6605s_timer_set_next_event,
-		.cpumask		= cpu_possible_mask,
-	},
-	.of_irq = {
-		.handler		= gx6605s_timer_interrupt,
-		.flags			= IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+		.clkevt = {
+			.rating			= 300,
+			.features		= CLOCK_EVT_FEAT_DYNIRQ |
+						  CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_shutdown	= gx6605s_timer_shutdown,
+			.set_state_oneshot	= gx6605s_timer_set_oneshot,
+			.set_next_event		= gx6605s_timer_set_next_event,
+			.cpumask		= cpu_possible_mask,
+		},
+		.of_irq = {
+			.handler		= gx6605s_timer_interrupt,
+			.flags			= IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel. */ }
 };
 
 static u64 notrace gx6605s_sched_clock_read(void)
@@ -99,17 +103,19 @@ static u64 notrace gx6605s_sched_clock_read(void)
 	return (u64)readl_relaxed(base + TIMER_VALUE);
 }
 
-static void gx6605s_clkevt_init(void __iomem *base)
+static void gx6605s_clkevt_init(struct timer_of *to)
 {
-	writel_relaxed(0, base + TIMER_DIV);
-	writel_relaxed(0, base + TIMER_CONFIG);
+	writel_relaxed(0, timer_of_base(to) + TIMER_DIV);
+	writel_relaxed(0, timer_of_base(to) + TIMER_CONFIG);
 
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to), 2,
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to), 2,
 					ULONG_MAX);
 }
 
-static int gx6605s_clksrc_init(void __iomem *base)
+static int gx6605s_clksrc_init(struct timer_of *to)
 {
+	void __iomem *base = timer_of_base(to) + CLKSRC_OFFSET;
+
 	writel_relaxed(0, base + TIMER_DIV);
 	writel_relaxed(0, base + TIMER_INI);
 
@@ -119,7 +125,7 @@ static int gx6605s_clksrc_init(void __iomem *base)
 
 	writel_relaxed(GX6605S_CONTRL_START, base + TIMER_CONTRL);
 
-	sched_clock_register(gx6605s_sched_clock_read, 32, timer_of_rate(&to));
+	sched_clock_register(gx6605s_sched_clock_read, 32, timer_of_rate(to));
 
 	return clocksource_mmio_init(base + TIMER_VALUE, "gx6605s",
 			timer_of_rate(&to), 200, 32, clocksource_mmio_readl_up);
@@ -127,6 +133,7 @@ static int gx6605s_clksrc_init(void __iomem *base)
 
 static int __init gx6605s_timer_init(struct device_node *np)
 {
+	struct timer_of *to = np->data;
 	int ret;
 
 	/*
@@ -143,9 +150,9 @@ static int __init gx6605s_timer_init(struct device_node *np)
 	 * The counter at 0x40 offset is clock source.
 	 * They are the same in hardware, just different used by driver.
 	 */
-	gx6605s_clkevt_init(timer_of_base(&to));
+	gx6605s_clkevt_init(to);
 
-	return gx6605s_clksrc_init(timer_of_base(&to) + CLKSRC_OFFSET);
+	return gx6605s_clksrc_init(to);
 }
 TIMER_OF_DECLARE(csky_gx6605s_timer, "csky,gx6605s-timer", gx6605s_timer_init,
-		 &to);
+		 to);
diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/timer-imx-sysctr.c
index bf6b13e9037a..680f4af1acc0 100644
--- a/drivers/clocksource/timer-imx-sysctr.c
+++ b/drivers/clocksource/timer-imx-sysctr.c
@@ -99,47 +99,53 @@ static irqreturn_t sysctr_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of to_sysctr = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
-	.clkevt = {
-		.name			= "i.MX system counter timer",
-		.features		= CLOCK_EVT_FEAT_ONESHOT |
-						CLOCK_EVT_FEAT_DYNIRQ,
-		.set_state_oneshot	= sysctr_set_state_oneshot,
-		.set_next_event		= sysctr_set_next_event,
-		.set_state_shutdown	= sysctr_set_state_shutdown,
-		.rating			= 200,
-	},
-	.of_irq = {
-		.handler		= sysctr_timer_interrupt,
-		.flags			= IRQF_TIMER | IRQF_IRQPOLL,
-	},
-	.of_clk = {
-		.name = "per",
+static struct timer_of to_sysctr[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE |
+			 TIMER_OF_TYPE_CE_AND_CS,
+		.clkevt = {
+			.name			= "i.MX system counter timer",
+			.features		= CLOCK_EVT_FEAT_ONESHOT |
+						  CLOCK_EVT_FEAT_DYNIRQ,
+			.set_state_oneshot	= sysctr_set_state_oneshot,
+			.set_next_event		= sysctr_set_next_event,
+			.set_state_shutdown	= sysctr_set_state_shutdown,
+			.rating			= 200,
+		},
+		.of_irq = {
+			.handler		= sysctr_timer_interrupt,
+			.flags			= IRQF_TIMER | IRQF_IRQPOLL,
+		},
+		.of_clk = {
+			.name = "per",
+		},
 	},
+	{ /* sentinel */ },
 };
 
-static void __init sysctr_clockevent_init(void)
+static void __init sysctr_clockevent_init(struct timer_of *to)
 {
-	to_sysctr.clkevt.cpumask = cpumask_of(0);
+	to->clkevt.cpumask = cpumask_of(0);
 
-	clockevents_config_and_register(&to_sysctr.clkevt,
-					timer_of_rate(&to_sysctr),
+	clockevents_config_and_register(&to->clkevt,
+					timer_of_rate(to),
 					0xff, 0x7fffffff);
 }
 
 static int __init sysctr_timer_init(struct device_node *np)
 {
+	struct timer_of *to = np->data;
+
 	/* system counter clock is divided by 3 internally */
-	to_sysctr.of_clk.rate /= SYS_CTR_CLK_DIV;
+	to->of_clk.rate /= SYS_CTR_CLK_DIV;
 
-	sys_ctr_base = timer_of_base(&to_sysctr);
+	sys_ctr_base = timer_of_base(to);
 	cmpcr = readl(sys_ctr_base + CMPCR);
 	cmpcr &= ~SYS_CTR_EN;
 
-	sysctr_clockevent_init();
+	sysctr_clockevent_init(to);
 
 	return 0;
 }
 TIMER_OF_DECLARE(sysctr_timer, "nxp,sysctr-timer", sysctr_timer_init,
-		 &to_sysctr);
+		 to_sysctr);
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 208a6281bd90..c0512d21e0cb 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -124,47 +124,51 @@ static irqreturn_t tpm_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of to_tpm = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-	.clkevt = {
-		.name			= "i.MX7ULP TPM Timer",
-		.rating			= 200,
-		.features		= CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_shutdown	= tpm_set_state_shutdown,
-		.set_state_oneshot	= tpm_set_state_oneshot,
-		.set_next_event		= tpm_set_next_event,
-		.cpumask		= cpu_possible_mask,
-	},
-	.of_irq = {
-		.handler		= tpm_timer_interrupt,
-		.flags			= IRQF_TIMER | IRQF_IRQPOLL,
-	},
-	.of_clk = {
-		.name = "per",
+static struct timer_of to_tpm[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+		.clkevt = {
+			.name			= "i.MX7ULP TPM Timer",
+			.rating			= 200,
+			.features		= CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_shutdown	= tpm_set_state_shutdown,
+			.set_state_oneshot	= tpm_set_state_oneshot,
+			.set_next_event		= tpm_set_next_event,
+			.cpumask		= cpu_possible_mask,
+		},
+		.of_irq = {
+			.handler		= tpm_timer_interrupt,
+			.flags			= IRQF_TIMER | IRQF_IRQPOLL,
+		},
+		.of_clk = {
+			.name = "per",
+		},
 	},
+	{ /* sentinel */ }
 };
 
-static int __init tpm_clocksource_init(void)
+static int __init tpm_clocksource_init(struct timer_of *to)
 {
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
-	tpm_delay_timer.freq = timer_of_rate(&to_tpm) >> 3;
+	tpm_delay_timer.freq = timer_of_rate(to) >> 3;
 	register_current_timer_delay(&tpm_delay_timer);
 
 	sched_clock_register(tpm_read_sched_clock, counter_width,
-			     timer_of_rate(&to_tpm) >> 3);
+			     timer_of_rate(to) >> 3);
 
 	return clocksource_mmio_init(timer_base + TPM_CNT,
 				     "imx-tpm",
-				     timer_of_rate(&to_tpm) >> 3,
-				     to_tpm.clkevt.rating,
+				     timer_of_rate(to) >> 3,
+				     to->clkevt.rating,
 				     counter_width,
 				     clocksource_mmio_readl_up);
 }
 
-static void __init tpm_clockevent_init(void)
+static void __init tpm_clockevent_init(struct timer_of *to)
 {
-	clockevents_config_and_register(&to_tpm.clkevt,
-					timer_of_rate(&to_tpm) >> 3,
+	clockevents_config_and_register(&to->clkevt,
+					timer_of_rate(to) >> 3,
 					300,
 					GENMASK(counter_width - 1,
 					1));
@@ -172,6 +176,7 @@ static void __init tpm_clockevent_init(void)
 
 static int __init tpm_timer_init(struct device_node *np)
 {
+	struct timer_of *to = np->data;
 	struct clk *ipg;
 	int ret;
 
@@ -188,12 +193,12 @@ static int __init tpm_timer_init(struct device_node *np)
 		return ret;
 	}
 
-	timer_base = timer_of_base(&to_tpm);
+	timer_base = timer_of_base(to);
 
 	counter_width = (readl(timer_base + TPM_PARAM)
 		& TPM_PARAM_WIDTH_MASK) >> TPM_PARAM_WIDTH_SHIFT;
 	/* use rating 200 for 32-bit counter and 150 for 16-bit counter */
-	to_tpm.clkevt.rating = counter_width == 0x20 ? 200 : 150;
+	to->clkevt.rating = counter_width == 0x20 ? 200 : 150;
 
 	/*
 	 * Initialize tpm module to a known state
@@ -223,8 +228,8 @@ static int __init tpm_timer_init(struct device_node *np)
 	/* set MOD register to maximum for free running mode */
 	writel(GENMASK(counter_width - 1, 0), timer_base + TPM_MOD);
 
-	tpm_clockevent_init();
+	tpm_clockevent_init(to);
 
-	return tpm_clocksource_init();
+	return tpm_clocksource_init(to);
 }
-TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init, &to_tpm);
+TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init, to_tpm);
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index f9532c9cee41..fcffbefdebb6 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -241,39 +241,47 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
 	       timer_of_base(to) + GPT_IRQ_EN_REG);
 }
 
-static struct timer_of mtk_syst_to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-
-	.clkevt = {
-		.name = "mtk-clkevt",
-		.rating = 300,
-		.cpumask = cpu_possible_mask,
-	},
-
-	.of_irq = {
-		.handler = mtk_syst_handler,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of mtk_syst_to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "mtk-clkevt",
+			.rating = 300,
+			.cpumask = cpu_possible_mask,
+		},
+
+		.of_irq = {
+			.handler = mtk_syst_handler,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel */ }
 };
 
-static struct timer_of mtk_gpt_to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-
-	.clkevt = {
-		.name = "mtk-clkevt",
-		.rating = 300,
-		.cpumask = cpu_possible_mask,
-	},
-
-	.of_irq = {
-		.handler = mtk_gpt_interrupt,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of mtk_gpt_to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "mtk-clkevt",
+			.rating = 300,
+			.cpumask = cpu_possible_mask,
+		},
+
+		.of_irq = {
+			.handler = mtk_gpt_interrupt,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static int __init mtk_syst_init(struct device_node *node)
 {
-	struct timer_of *to = &mtk_syst_to;
+	struct timer_of *to = node->data;
 
 	to->clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
 	to->clkevt.set_state_shutdown = mtk_syst_clkevt_shutdown;
@@ -289,7 +297,7 @@ static int __init mtk_syst_init(struct device_node *node)
 
 static int __init mtk_gpt_init(struct device_node *node)
 {
-	struct timer_of *to = &mtk_gpt_to;
+	struct timer_of *to = node->data;
 
 	to->clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to->clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
@@ -316,6 +324,6 @@ static int __init mtk_gpt_init(struct device_node *node)
 	return 0;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init,
-		 &mtk_gpt_to);
+		 mtk_gpt_to);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init,
-		 &mtk_syst_to);
+		 mtk_syst_to);
diff --git a/drivers/clocksource/timer-milbeaut.c b/drivers/clocksource/timer-milbeaut.c
index f601ac905751..96a2a1a4eee0 100644
--- a/drivers/clocksource/timer-milbeaut.c
+++ b/drivers/clocksource/timer-milbeaut.c
@@ -140,45 +140,51 @@ static int mlb_config_clock_event(struct timer_of *to)
 	return 0;
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-
-	.clkevt = {
-		.name = "mlb-clkevt",
-		.rating = MLB_TIMER_RATING,
-		.cpumask = cpu_possible_mask,
-		.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_oneshot = mlb_set_state_oneshot,
-		.set_state_periodic = mlb_set_state_periodic,
-		.set_state_shutdown = mlb_set_state_shutdown,
-		.set_next_event = mlb_clkevt_next_event,
-	},
-
-	.of_irq = {
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
-		.handler = mlb_timer_interrupt,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "mlb-clkevt",
+			.rating = MLB_TIMER_RATING,
+			.cpumask = cpu_possible_mask,
+			.features = CLOCK_EVT_FEAT_DYNIRQ |
+				    CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_oneshot = mlb_set_state_oneshot,
+			.set_state_periodic = mlb_set_state_periodic,
+			.set_state_shutdown = mlb_set_state_shutdown,
+			.set_next_event = mlb_clkevt_next_event,
+		},
+
+		.of_irq = {
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+			.handler = mlb_timer_interrupt,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static u64 notrace mlb_timer_sched_read(void)
 {
-	return ~readl_relaxed(timer_of_base(&to) + MLB_TMR_SRC_TMR_OFS);
+	return ~readl_relaxed(timer_of_base(to) + MLB_TMR_SRC_TMR_OFS);
 }
 
 static int __init mlb_timer_init(struct device_node *node)
 {
+	struct timer_of *to = node->data;
 	unsigned long rate;
 
-	rate = timer_of_rate(&to) / MLB_TMR_DIV_CNT;
-	mlb_config_clock_source(&to);
-	clocksource_mmio_init(timer_of_base(&to) + MLB_TMR_SRC_TMR_OFS,
+	rate = timer_of_rate(to) / MLB_TMR_DIV_CNT;
+	mlb_config_clock_source(to);
+	clocksource_mmio_init(timer_of_base(to) + MLB_TMR_SRC_TMR_OFS,
 		node->name, rate, MLB_TIMER_RATING, 32,
 		clocksource_mmio_readl_down);
 	sched_clock_register(mlb_timer_sched_read, 32, rate);
-	mlb_config_clock_event(&to);
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to), 15,
+	mlb_config_clock_event(to);
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to), 15,
 		0xffffffff);
 	return 0;
 }
 TIMER_OF_DECLARE(mlb_peritimer, "socionext,milbeaut-timer",
-		mlb_timer_init, &to);
+		mlb_timer_init, to);
diff --git a/drivers/clocksource/timer-mp-csky.c b/drivers/clocksource/timer-mp-csky.c
index 0ac315597571..566c741c228c 100644
--- a/drivers/clocksource/timer-mp-csky.c
+++ b/drivers/clocksource/timer-mp-csky.c
@@ -47,7 +47,9 @@ static int csky_mptimer_oneshot_stopped(struct clock_event_device *ce)
 }
 
 static DEFINE_PER_CPU(struct timer_of, csky_to) = {
-	.flags					= TIMER_OF_CLOCK | TIMER_OF_IRQ,
+	.flags					= TIMER_OF_CLOCK |
+						  TIMER_OF_IRQ |
+						  TIMER_OF_TYPE_CE_AND_CS,
 	.percpu					= true,
 	.clkevt = {
 		.rating				= 300,
diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 031d1ad2f54d..f55a7c519faa 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -131,77 +131,79 @@ static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of npcm7xx_to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-
-	.clkevt = {
-		.name		    = "npcm7xx-timer0",
-		.features	    = CLOCK_EVT_FEAT_PERIODIC |
-				      CLOCK_EVT_FEAT_ONESHOT,
-		.set_next_event	    = npcm7xx_clockevent_set_next_event,
-		.set_state_shutdown = npcm7xx_timer_shutdown,
-		.set_state_periodic = npcm7xx_timer_periodic,
-		.set_state_oneshot  = npcm7xx_timer_oneshot,
-		.tick_resume	    = npcm7xx_timer_resume,
-		.rating		    = 300,
-	},
-
-	.of_irq = {
-		.handler = npcm7xx_timer0_interrupt,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of npcm7xx_to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name		    = "npcm7xx-timer0",
+			.features	    = CLOCK_EVT_FEAT_PERIODIC |
+					      CLOCK_EVT_FEAT_ONESHOT,
+			.set_next_event	    = npcm7xx_clockevent_set_next_event,
+			.set_state_shutdown = npcm7xx_timer_shutdown,
+			.set_state_periodic = npcm7xx_timer_periodic,
+			.set_state_oneshot  = npcm7xx_timer_oneshot,
+			.tick_resume	    = npcm7xx_timer_resume,
+			.rating		    = 300,
+		},
+
+		.of_irq = {
+			.handler = npcm7xx_timer0_interrupt,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel */ }
 };
 
-static void __init npcm7xx_clockevents_init(void)
+static void __init npcm7xx_clockevents_init(struct timer_of *to)
 {
-	writel(NPCM7XX_DEFAULT_CSR,
-		timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TCSR0);
+	writel(NPCM7XX_DEFAULT_CSR, timer_of_base(to) + NPCM7XX_REG_TCSR0);
 
-	writel(NPCM7XX_Tx_RESETINT,
-		timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TISR);
+	writel(NPCM7XX_Tx_RESETINT, timer_of_base(to) + NPCM7XX_REG_TISR);
 
-	npcm7xx_to.clkevt.cpumask = cpumask_of(0);
-	clockevents_config_and_register(&npcm7xx_to.clkevt,
-					timer_of_rate(&npcm7xx_to),
-					0x1, NPCM7XX_Tx_MAX_CNT);
+	to->clkevt.cpumask = cpumask_of(0);
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to), 0x1,
+					NPCM7XX_Tx_MAX_CNT);
 }
 
-static void __init npcm7xx_clocksource_init(void)
+static void __init npcm7xx_clocksource_init(struct timer_of *to)
 {
 	u32 val;
 
 	writel(NPCM7XX_DEFAULT_CSR,
-		timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TCSR1);
+		timer_of_base(to) + NPCM7XX_REG_TCSR1);
 	writel(NPCM7XX_Tx_MAX_CNT,
-		timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TICR1);
+		timer_of_base(to) + NPCM7XX_REG_TICR1);
 
-	val = readl(timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TCSR1);
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR1);
 	val |= NPCM7XX_START_Tx;
-	writel(val, timer_of_base(&npcm7xx_to) + NPCM7XX_REG_TCSR1);
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR1);
 
-	clocksource_mmio_init(timer_of_base(&npcm7xx_to) +
+	clocksource_mmio_init(timer_of_base(to) +
 				NPCM7XX_REG_TDR1,
-				"npcm7xx-timer1", timer_of_rate(&npcm7xx_to),
+				"npcm7xx-timer1", timer_of_rate(to),
 				200, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
 				clocksource_mmio_readl_down);
 }
 
 static int __init npcm7xx_timer_init(struct device_node *np)
 {
+	struct timer_of *to = np->data;
+
 	/* Clock input is divided by PRESCALE + 1 before it is fed */
 	/* to the counter */
-	npcm7xx_to.of_clk.rate = npcm7xx_to.of_clk.rate /
-		(NPCM7XX_Tx_MIN_PRESCALE + 1);
+	to->of_clk.rate = to->of_clk.rate / (NPCM7XX_Tx_MIN_PRESCALE + 1);
 
-	npcm7xx_clocksource_init();
-	npcm7xx_clockevents_init();
+	npcm7xx_clocksource_init(to);
+	npcm7xx_clockevents_init(to);
 
 	pr_info("Enabling NPCM7xx clocksource timer base: %px, IRQ: %d ",
-		timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));
+		timer_of_base(to), timer_of_irq(to));
 
 	return 0;
 }
 
 TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init,
-		 &npcm7xx_to);
+		 npcm7xx_to);
 
diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 814276decb07..3d4ebda7e365 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -163,14 +163,84 @@ static __init int timer_of_base_init(struct device_node *np,
 	return 0;
 }
 
-int __init timer_of_init(struct device_node *np, struct timer_of *to)
+static unsigned int __init timer_of_is_type(struct device_node *np,
+					    const char *type)
 {
+	struct device_node *node, *timer;
+
+	if (!of_chosen)
+		return 0;
+
+	node = of_get_child_by_name(of_chosen, type);
+	if (!node)
+		return 0;
+
+	timer = of_parse_phandle(node, "timer", 0);
+	of_node_put(node);
+	if (!timer)
+		return 0;
+
+	if (timer == np)
+		return 1;
+
+	return 0;
+}
+
+static unsigned int __init timer_of_type_get(struct device_node *np)
+{
+	unsigned int type = 0;
+
+	if (timer_of_is_type(np, "linux,clocksource"))
+		type |= TIMER_OF_TYPE_CS;
+	if (timer_of_is_type(np, "linux,clockevent"))
+		type |= TIMER_OF_TYPE_CE;
+
+	if (!type || /* For backward compatibility. */
+	    ((type & (TIMER_OF_TYPE_CS | TIMER_OF_TYPE_CE)) ==
+		     (TIMER_OF_TYPE_CS | TIMER_OF_TYPE_CE)))
+		type = TIMER_OF_TYPE_CE_AND_CS;
+
+	return type;
+}
+
+static struct timer_of __init *timer_of_type_match(unsigned int dt_type,
+						   struct timer_of *probe_to)
+{
+	struct timer_of *to;
+
+	for (to = probe_to; to && to->flags; to++) {
+		/* Resource already used. */
+		if (to->np)
+			continue;
+
+		if ((dt_type & to->flags) == dt_type)
+			return to;
+
+		/* At the moment percpu struct timer_of objects are probed only
+		 * by the probing CPU. No need to go further.
+		 */
+		if (probe_to->percpu)
+			return NULL;
+	}
+
+	return NULL;
+}
+
+int __init timer_of_init(struct device_node *np, struct timer_of *probe_to)
+{
+	unsigned int dt_type;
+	struct timer_of *to;
 	int ret = 0;
 	int flags = 0;
 
-	if (!to)
+	if (!probe_to)
 		return ret;
 
+	dt_type = timer_of_type_get(np);
+	to = timer_of_type_match(dt_type, probe_to);
+	if (!to)
+		return -EBUSY;
+
 	if (to->flags & TIMER_OF_BASE) {
 		ret = timer_of_base_init(np, &to->of_base);
 		if (ret)
@@ -192,10 +262,14 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 		flags |= TIMER_OF_IRQ;
 	}
 
-	if (!to->clkevt.name)
+	flags |= to->of_type = dt_type;
+
+	if (!to->clkevt.name &&
+	    (to->of_type & (TIMER_OF_TYPE_CE | TIMER_OF_TYPE_CE_AND_CS)))
 		to->clkevt.name = np->name;
 
 	to->np = np;
+	np->data = to;
 
 	return ret;
 
@@ -208,6 +282,9 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 
 	if (flags & TIMER_OF_BASE)
 		timer_of_base_exit(&to->of_base);
+
+	to->of_type = 0;
+
 	return ret;
 }
 
@@ -223,6 +300,8 @@ void __init timer_of_cleanup(struct timer_of *to)
 	if (!to)
 		return;
 
+	to->of_type = 0;
+
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
 
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index df861ea2ec42..9fb8c5523150 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -7,6 +7,9 @@
 #define TIMER_OF_BASE		BIT(0)
 #define TIMER_OF_CLOCK		BIT(1)
 #define TIMER_OF_IRQ		BIT(2)
+#define TIMER_OF_TYPE_CE	BIT(3)
+#define TIMER_OF_TYPE_CS	BIT(4)
+#define TIMER_OF_TYPE_CE_AND_CS	BIT(5)
 
 struct of_timer_irq {
 	int irq;
@@ -39,6 +42,7 @@ struct timer_of {
 	struct of_timer_base of_base;
 	struct of_timer_irq  of_irq;
 	struct of_timer_clk  of_clk;
+	unsigned int	     of_type;
 	void *private_data;
 };
 
@@ -68,6 +72,18 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 	return to->of_clk.period;
 }
 
+static inline unsigned int timer_of_is_clocksource(struct timer_of *to)
+{
+	return !!(to && to->of_type &
+		 (TIMER_OF_TYPE_CS | TIMER_OF_TYPE_CE_AND_CS));
+}
+
+static inline unsigned int timer_of_is_clockevent(struct timer_of *to)
+{
+	return !!(to && to->of_type &
+		 (TIMER_OF_TYPE_CE | TIMER_OF_TYPE_CE_AND_CS));
+}
+
 extern int __init timer_of_init(struct device_node *np,
 				struct timer_of *to);
 
diff --git a/drivers/clocksource/timer-rda.c b/drivers/clocksource/timer-rda.c
index 74f4f60a3d36..132fbb1eaa5f 100644
--- a/drivers/clocksource/timer-rda.c
+++ b/drivers/clocksource/timer-rda.c
@@ -126,36 +126,40 @@ static irqreturn_t rda_ostimer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of rda_ostimer_of = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE,
-
-	.clkevt = {
-		.name = "rda-ostimer",
-		.rating = 250,
-		.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
-			    CLOCK_EVT_FEAT_DYNIRQ,
-		.set_state_shutdown = rda_ostimer_set_state_shutdown,
-		.set_state_oneshot = rda_ostimer_set_state_oneshot,
-		.set_state_periodic = rda_ostimer_set_state_periodic,
-		.tick_resume = rda_ostimer_tick_resume,
-		.set_next_event	= rda_ostimer_set_next_event,
-	},
-
-	.of_base = {
-		.name = "rda-timer",
-		.index = 0,
-	},
-
-	.of_irq = {
-		.name = "ostimer",
-		.handler = rda_ostimer_interrupt,
-		.flags = IRQF_TIMER,
+static struct timer_of rda_ostimer_of[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "rda-ostimer",
+			.rating = 250,
+			.features = CLOCK_EVT_FEAT_PERIODIC |
+				    CLOCK_EVT_FEAT_ONESHOT |
+				    CLOCK_EVT_FEAT_DYNIRQ,
+			.set_state_shutdown = rda_ostimer_set_state_shutdown,
+			.set_state_oneshot = rda_ostimer_set_state_oneshot,
+			.set_state_periodic = rda_ostimer_set_state_periodic,
+			.tick_resume = rda_ostimer_tick_resume,
+			.set_next_event	= rda_ostimer_set_next_event,
+		},
+
+		.of_base = {
+			.name = "rda-timer",
+			.index = 0,
+		},
+
+		.of_irq = {
+			.name = "ostimer",
+			.handler = rda_ostimer_interrupt,
+			.flags = IRQF_TIMER,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static u64 rda_hwtimer_read(struct clocksource *cs)
 {
-	void __iomem *base = timer_of_base(&rda_ostimer_of);
+	void __iomem *base = timer_of_base(&rda_ostimer_of[0]);
 	u32 lo, hi;
 
 	/* Always read low 32 bits first */
@@ -177,15 +181,15 @@ static struct clocksource rda_hwtimer_clocksource = {
 
 static int __init rda_timer_init(struct device_node *np)
 {
+	struct timer_of *to = np->data;
 	unsigned long rate = 2000000;
 
 	clocksource_register_hz(&rda_hwtimer_clocksource, rate);
 
-	clockevents_config_and_register(&rda_ostimer_of.clkevt, rate,
-					0x2, UINT_MAX);
+	clockevents_config_and_register(&to->clkevt, rate, 0x2, UINT_MAX);
 
 	return 0;
 }
 
 TIMER_OF_DECLARE(rda8810pl, "rda,8810pl-timer", rda_timer_init,
-		 &rda_ostimer_of);
+		 rda_ostimer_of);
diff --git a/drivers/clocksource/timer-sprd.c b/drivers/clocksource/timer-sprd.c
index 8b50fcc996ac..8a6a591ea9c2 100644
--- a/drivers/clocksource/timer-sprd.c
+++ b/drivers/clocksource/timer-sprd.c
@@ -121,57 +121,65 @@ static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
-
-	.clkevt = {
-		.name = TIMER_NAME,
-		.rating = 300,
-		.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_PERIODIC |
-			CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_shutdown = sprd_timer_shutdown,
-		.set_state_periodic = sprd_timer_set_periodic,
-		.set_next_event = sprd_timer_set_next_event,
-		.cpumask = cpu_possible_mask,
-	},
-
-	.of_irq = {
-		.handler = sprd_timer_interrupt,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = TIMER_NAME,
+			.rating = 300,
+			.features = CLOCK_EVT_FEAT_DYNIRQ |
+				    CLOCK_EVT_FEAT_PERIODIC |
+				    CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_shutdown = sprd_timer_shutdown,
+			.set_state_periodic = sprd_timer_set_periodic,
+			.set_next_event = sprd_timer_set_next_event,
+			.cpumask = cpu_possible_mask,
+		},
+
+		.of_irq = {
+			.handler = sprd_timer_interrupt,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static int __init sprd_timer_init(struct device_node *np)
 {
-	sprd_timer_enable_interrupt(timer_of_base(&to));
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+	struct timer_of *to = np->data;
+
+	sprd_timer_enable_interrupt(timer_of_base(to));
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					1, UINT_MAX);
 
 	return 0;
 }
 
-static struct timer_of suspend_to = {
-	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
+static struct timer_of suspend_to[] = {
+	{ .flags = TIMER_OF_BASE | TIMER_OF_CLOCK | TIMER_OF_TYPE_CE_AND_CS, },
+	{ /* sentinel */ }
 };
 
 static u64 sprd_suspend_timer_read(struct clocksource *cs)
 {
-	return ~(u64)readl_relaxed(timer_of_base(&suspend_to) +
+	return ~(u64)readl_relaxed(timer_of_base(&suspend_to[0]) +
 				   TIMER_VALUE_SHDW_LO) & cs->mask;
 }
 
 static int sprd_suspend_timer_enable(struct clocksource *cs)
 {
-	sprd_timer_update_counter(timer_of_base(&suspend_to),
+	sprd_timer_update_counter(timer_of_base(&suspend_to[0]),
 				  TIMER_VALUE_LO_MASK);
-	sprd_timer_enable(timer_of_base(&suspend_to), TIMER_CTL_PERIOD_MODE);
+	sprd_timer_enable(timer_of_base(&suspend_to[0]), TIMER_CTL_PERIOD_MODE);
 
 	return 0;
 }
 
 static void sprd_suspend_timer_disable(struct clocksource *cs)
 {
-	sprd_timer_disable(timer_of_base(&suspend_to));
+	sprd_timer_disable(timer_of_base(&suspend_to[0]));
 }
 
 static struct clocksource suspend_clocksource = {
@@ -186,12 +194,13 @@ static struct clocksource suspend_clocksource = {
 
 static int __init sprd_suspend_timer_init(struct device_node *np)
 {
-	clocksource_register_hz(&suspend_clocksource,
-				timer_of_rate(&suspend_to));
+	struct timer_of *to = np->data;
+
+	clocksource_register_hz(&suspend_clocksource, timer_of_rate(to));
 
 	return 0;
 }
 
-TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init, &to);
+TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init, to);
 TIMER_OF_DECLARE(sc9860_persistent_timer, "sprd,sc9860-suspend-timer",
-		 sprd_suspend_timer_init, &suspend_to);
+		 sprd_suspend_timer_init, suspend_to);
diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index 4a07e02e7c84..1e387e15fa08 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -285,22 +285,27 @@ static void __init stm32_clockevent_init(struct timer_of *to)
 		to->np, bits);
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
-
-	.of_irq = {
-		.handler = stm32_clock_event_handler,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.of_irq = {
+			.handler = stm32_clock_event_handler,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static int __init stm32_timer_init(struct device_node *node)
 {
+	struct timer_of *to = node->data;
 	struct reset_control *rstc;
 	int ret;
 
-	to.private_data = kzalloc(sizeof(struct stm32_timer_private),
-				  GFP_KERNEL);
-	if (!to.private_data)
+	to->private_data = kzalloc(sizeof(struct stm32_timer_private),
+				   GFP_KERNEL);
+	if (!to->private_data)
 		return -ENOMEM;
 
 	rstc = of_reset_control_get(node, NULL);
@@ -309,20 +314,20 @@ static int __init stm32_timer_init(struct device_node *node)
 		reset_control_deassert(rstc);
 	}
 
-	stm32_timer_set_width(&to);
+	stm32_timer_set_width(to);
 
-	stm32_timer_set_prescaler(&to);
+	stm32_timer_set_prescaler(to);
 
-	ret = stm32_clocksource_init(&to);
+	ret = stm32_clocksource_init(to);
 	if (ret)
 		goto err;
 
-	stm32_clockevent_init(&to);
+	stm32_clockevent_init(to);
 	return 0;
 
 err:
-	kfree(to.private_data);
+	kfree(to->private_data);
 	return ret;
 }
 
-TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_timer_init, &to);
+TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_timer_init, to);
diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 1443cf5ca92b..4f8935118251 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -140,41 +140,47 @@ static irqreturn_t sun4i_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct timer_of to = {
-	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
-
-	.clkevt = {
-		.name = "sun4i_tick",
-		.rating = 350,
-		.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-		.set_state_shutdown = sun4i_clkevt_shutdown,
-		.set_state_periodic = sun4i_clkevt_set_periodic,
-		.set_state_oneshot = sun4i_clkevt_set_oneshot,
-		.tick_resume = sun4i_clkevt_shutdown,
-		.set_next_event = sun4i_clkevt_next_event,
-		.cpumask = cpu_possible_mask,
-	},
-
-	.of_irq = {
-		.handler = sun4i_timer_interrupt,
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+static struct timer_of to[] = {
+	{
+		.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE |
+			 TIMER_OF_TYPE_CE_AND_CS,
+
+		.clkevt = {
+			.name = "sun4i_tick",
+			.rating = 350,
+			.features = CLOCK_EVT_FEAT_PERIODIC |
+				    CLOCK_EVT_FEAT_ONESHOT,
+			.set_state_shutdown = sun4i_clkevt_shutdown,
+			.set_state_periodic = sun4i_clkevt_set_periodic,
+			.set_state_oneshot = sun4i_clkevt_set_oneshot,
+			.tick_resume = sun4i_clkevt_shutdown,
+			.set_next_event = sun4i_clkevt_next_event,
+			.cpumask = cpu_possible_mask,
+		},
+
+		.of_irq = {
+			.handler = sun4i_timer_interrupt,
+			.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		},
 	},
+	{ /* sentinel */ }
 };
 
 static u64 notrace sun4i_timer_sched_read(void)
 {
-	return ~readl(timer_of_base(&to) + TIMER_CNTVAL_REG(1));
+	return ~readl(timer_of_base(to) + TIMER_CNTVAL_REG(1));
 }
 
 static int __init sun4i_timer_init(struct device_node *node)
 {
+	struct timer_of *to = node->data;
 	int ret;
 	u32 val;
 
-	writel(~0, timer_of_base(&to) + TIMER_INTVAL_REG(1));
+	writel(~0, timer_of_base(to) + TIMER_INTVAL_REG(1));
 	writel(TIMER_CTL_ENABLE | TIMER_CTL_RELOAD |
 	       TIMER_CTL_CLK_SRC(TIMER_CTL_CLK_SRC_OSC24M),
-	       timer_of_base(&to) + TIMER_CTL_REG(1));
+	       timer_of_base(to) + TIMER_CTL_REG(1));
 
 	/*
 	 * sched_clock_register does not have priorities, and on sun6i and
@@ -185,10 +191,10 @@ static int __init sun4i_timer_init(struct device_node *node)
 	    of_machine_is_compatible("allwinner,sun5i-a10s") ||
 	    of_machine_is_compatible("allwinner,suniv-f1c100s"))
 		sched_clock_register(sun4i_timer_sched_read, 32,
-				     timer_of_rate(&to));
+				     timer_of_rate(to));
 
-	ret = clocksource_mmio_init(timer_of_base(&to) + TIMER_CNTVAL_REG(1),
-				    node->name, timer_of_rate(&to), 350, 32,
+	ret = clocksource_mmio_init(timer_of_base(to) + TIMER_CNTVAL_REG(1),
+				    node->name, timer_of_rate(to), 350, 32,
 				    clocksource_mmio_readl_down);
 	if (ret) {
 		pr_err("Failed to register clocksource\n");
@@ -196,28 +202,28 @@ static int __init sun4i_timer_init(struct device_node *node)
 	}
 
 	writel(TIMER_CTL_CLK_SRC(TIMER_CTL_CLK_SRC_OSC24M),
-	       timer_of_base(&to) + TIMER_CTL_REG(0));
+	       timer_of_base(to) + TIMER_CTL_REG(0));
 
 	/* Make sure timer is stopped before playing with interrupts */
-	sun4i_clkevt_time_stop(timer_of_base(&to), 0);
+	sun4i_clkevt_time_stop(timer_of_base(to), 0);
 
 	/* clear timer0 interrupt */
-	sun4i_timer_clear_interrupt(timer_of_base(&to));
+	sun4i_timer_clear_interrupt(timer_of_base(to));
 
-	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
 	/* Enable timer0 interrupt */
-	val = readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);
-	writel(val | TIMER_IRQ_EN(0), timer_of_base(&to) + TIMER_IRQ_EN_REG);
+	val = readl(timer_of_base(to) + TIMER_IRQ_EN_REG);
+	writel(val | TIMER_IRQ_EN(0), timer_of_base(to) + TIMER_IRQ_EN_REG);
 
 	return ret;
 }
 TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
-		       sun4i_timer_init, &to);
+		       sun4i_timer_init, to);
 TIMER_OF_DECLARE(sun8i_a23, "allwinner,sun8i-a23-timer",
-		 sun4i_timer_init, &to);
+		 sun4i_timer_init, to);
 TIMER_OF_DECLARE(sun8i_v3s, "allwinner,sun8i-v3s-timer",
-		 sun4i_timer_init, &to);
+		 sun4i_timer_init, to);
 TIMER_OF_DECLARE(suniv, "allwinner,suniv-f1c100s-timer",
-		       sun4i_timer_init, &to);
+		       sun4i_timer_init, to);
diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 6da57c51127a..2a9c9bc93ec1 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -114,7 +114,7 @@ static void tegra_timer_resume(struct clock_event_device *evt)
 }
 
 static DEFINE_PER_CPU(struct timer_of, tegra_to) = {
-	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE,
+	.flags = TIMER_OF_CLOCK | TIMER_OF_BASE | TIMER_OF_TYPE_CE_AND_CS,
 	.percpu = true,
 
 	.clkevt = {
@@ -182,8 +182,9 @@ static struct delay_timer tegra_delay_timer = {
 };
 #endif
 
-static struct timer_of suspend_rtc_to = {
-	.flags = TIMER_OF_BASE | TIMER_OF_CLOCK,
+static struct timer_of suspend_rtc_to[] = {
+	{ .flags = TIMER_OF_BASE | TIMER_OF_CLOCK | TIMER_OF_TYPE_CE_AND_CS },
+	{ /* sentinel */ }
 };
 
 /*
@@ -194,7 +195,7 @@ static struct timer_of suspend_rtc_to = {
  */
 static u64 tegra_rtc_read_ms(struct clocksource *cs)
 {
-	void __iomem *reg_base = timer_of_base(&suspend_rtc_to);
+	void __iomem *reg_base = timer_of_base(&suspend_rtc_to[0]);
 
 	u32 ms = readl_relaxed(reg_base + RTC_MILLISECONDS);
 	u32 s = readl_relaxed(reg_base + RTC_SHADOW_SECONDS);
@@ -252,7 +253,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 				   int rating)
 {
-	struct timer_of *to;
+	struct timer_of *to = np->data;
 	int cpu, ret;
 
 	to = this_cpu_ptr(&tegra_to);
@@ -407,4 +408,4 @@ static int __init tegra20_init_rtc(struct device_node *np)
 	return clocksource_register_hz(&suspend_rtc_clocksource, 1000);
 }
 TIMER_OF_DECLARE(tegra20_rtc, "nvidia,tegra20-rtc", tegra20_init_rtc,
-		 &suspend_rtc_to);
+		 suspend_rtc_to);
-- 
2.7.4

