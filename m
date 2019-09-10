Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D065AEBFD
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733215AbfIJNs2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Sep 2019 09:48:28 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:52285 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729173AbfIJNs1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Sep 2019 09:48:27 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 683XAQN9cp4PvWPaqfkswPOIVe8ed+z2/PAq+f5JbwUzTvxskB6TgBI5humDkARo19rIwUFt4F
 JzDtfX8pqdaTvCf5xrJyuiOTbmLIdfTBZj8qrSZO9+YVFXyDN0U4WcXn6dL9SSpUh4/3dqi5Xf
 X1CK53wyLz+ksXw4GCnfyxymjat+8N9sXtEswkYDIBJy9KWVsAg0I8VKBbVUJahRwl0rGXKZse
 tTI/HzuiqgKTdepmpiRMYHuCmvqPBYcgKq0bJKzkh7Ds3++Q6EUbOPHiJ1DHplps4/rkRql4eS
 8NI=
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="45604948"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Sep 2019 06:48:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Sep 2019 06:48:15 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 10 Sep 2019 06:47:52 -0700
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
Subject: [PATCH 1/7] clocksource/drivers/c-sky: request timer_of_init only for probing CPU
Date:   Tue, 10 Sep 2019 16:47:10 +0300
Message-ID: <1568123236-767-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

timer_of_init() was initially called for all possible CPUs although it
was requested clock with index 0 for the same device_node on behalf of
all possible CPUs. This patch keeps the timer_of_init() only for probing
CPU and use the information obtained by timer_of_init() to also
initialize the timer_of structure for the rest of CPUs. Since the
probing CPU was requested also a per CPU interrupt, and the
timer_of_init() has such a mechanism implemented, the patch took also
the chance to pass TIMER_OF_IRQ flag to timer_of_init(). Apart from
this csky_mptimer_irq variable was removed and information in per CPU
timer_of objects was used instead (to->clkevt.irq).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clocksource/timer-mp-csky.c | 45 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/clocksource/timer-mp-csky.c b/drivers/clocksource/timer-mp-csky.c
index 183a9955160a..dd263c8de580 100644
--- a/drivers/clocksource/timer-mp-csky.c
+++ b/drivers/clocksource/timer-mp-csky.c
@@ -15,7 +15,7 @@
 #define PTIM_LVR	"cr<6, 14>"
 #define PTIM_TSR	"cr<1, 14>"
 
-static int csky_mptimer_irq;
+static irqreturn_t csky_timer_interrupt(int irq, void *dev);
 
 static int csky_mptimer_set_next_event(unsigned long delta,
 				       struct clock_event_device *ce)
@@ -47,7 +47,7 @@ static int csky_mptimer_oneshot_stopped(struct clock_event_device *ce)
 }
 
 static DEFINE_PER_CPU(struct timer_of, csky_to) = {
-	.flags					= TIMER_OF_CLOCK,
+	.flags					= TIMER_OF_CLOCK | TIMER_OF_IRQ,
 	.clkevt = {
 		.rating				= 300,
 		.features			= CLOCK_EVT_FEAT_PERCPU |
@@ -57,6 +57,10 @@ static DEFINE_PER_CPU(struct timer_of, csky_to) = {
 		.set_state_oneshot_stopped	= csky_mptimer_oneshot_stopped,
 		.set_next_event			= csky_mptimer_set_next_event,
 	},
+	.of_irq = {
+		.percpu				= true,
+		.handler			= csky_timer_interrupt,
+	},
 };
 
 static irqreturn_t csky_timer_interrupt(int irq, void *dev)
@@ -79,7 +83,7 @@ static int csky_mptimer_starting_cpu(unsigned int cpu)
 
 	to->clkevt.cpumask = cpumask_of(cpu);
 
-	enable_percpu_irq(csky_mptimer_irq, 0);
+	enable_percpu_irq(to->clkevt.irq, 0);
 
 	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
 					2, ULONG_MAX);
@@ -89,7 +93,9 @@ static int csky_mptimer_starting_cpu(unsigned int cpu)
 
 static int csky_mptimer_dying_cpu(unsigned int cpu)
 {
-	disable_percpu_irq(csky_mptimer_irq);
+	struct timer_of *to = per_cpu_ptr(&csky_to, cpu);
+
+	disable_percpu_irq(to->clkevt.irq);
 
 	return 0;
 }
@@ -117,8 +123,8 @@ struct clocksource csky_clocksource = {
 
 static int __init csky_mptimer_init(struct device_node *np)
 {
-	int ret, cpu, cpu_rollback;
-	struct timer_of *to = NULL;
+	struct timer_of *to = this_cpu_ptr(&csky_to);
+	int ret, cpu;
 
 	/*
 	 * Csky_mptimer is designed for C-SKY SMP multi-processors and
@@ -132,20 +138,20 @@ static int __init csky_mptimer_init(struct device_node *np)
 	 * We use private irq for the mptimer and irq number is the same
 	 * for every core. So we use request_percpu_irq() in timer_of_init.
 	 */
-	csky_mptimer_irq = irq_of_parse_and_map(np, 0);
-	if (csky_mptimer_irq <= 0)
-		return -EINVAL;
 
-	ret = request_percpu_irq(csky_mptimer_irq, csky_timer_interrupt,
-				 "csky_mp_timer", &csky_to);
+	ret = timer_of_init(np, to);
 	if (ret)
 		return -EINVAL;
 
 	for_each_possible_cpu(cpu) {
-		to = per_cpu_ptr(&csky_to, cpu);
-		ret = timer_of_init(np, to);
-		if (ret)
-			goto rollback;
+		struct timer_of *cpu_to = per_cpu_ptr(&csky_to, cpu);
+
+		if (to == cpu_to)
+			continue;
+
+		cpu_to->clkevt.irq = to->of_irq.irq;
+		cpu_to->of_clk.rate = to->of_clk.rate;
+		cpu_to->of_clk.period = to->of_clk.period;
 	}
 
 	clocksource_register_hz(&csky_clocksource, timer_of_rate(to));
@@ -156,18 +162,13 @@ static int __init csky_mptimer_init(struct device_node *np)
 				csky_mptimer_starting_cpu,
 				csky_mptimer_dying_cpu);
 	if (ret)
-		return -EINVAL;
+		goto rollback;
 
 	return 0;
 
 rollback:
-	for_each_possible_cpu(cpu_rollback) {
-		if (cpu_rollback == cpu)
-			break;
+	timer_of_cleanup(to);
 
-		to = per_cpu_ptr(&csky_to, cpu_rollback);
-		timer_of_cleanup(to);
-	}
 	return -EINVAL;
 }
 TIMER_OF_DECLARE(csky_mptimer, "csky,mptimer", csky_mptimer_init);
-- 
2.7.4

