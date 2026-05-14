Return-Path: <linux-mips+bounces-14590-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIPQEncSBWpoSAIAu9opvQ
	(envelope-from <linux-mips+bounces-14590-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:08:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15C53C405
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF1D930782AA
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454731B86C7;
	Thu, 14 May 2026 00:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="sXM5Kd8N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615961DF748;
	Thu, 14 May 2026 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717191; cv=none; b=iI813x3g2SNjJdXpRc5A5EBdbFHtXK7l+dW8hYl1mmcq+fCLG8+M/iBGHfd801NhHohjBCBbD+qqPBefKtxNAz1AHN2wY9gfSrBXECG5PQ8olxQ1DMXpUtj7+zVSliev7SZjeWmGAc7z20qc8hdQvgKizN0C1B75VB2IyhqEpMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717191; c=relaxed/simple;
	bh=IpvTnlv0vFLKt2rkVYk/KQJMPZEDq9+iMpQlGSRKVB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jI+pfC5O2GZ2hceqTcfh8Me8egPMPhxjl33csiMiyFD4jaEJLGcegRgUAhIxEG9cBT3WEn6PDf5qzowyjt1Zv6n8qLP9VpFrfxTbzCte9EItYKYfbWAx+wwcCw4VRcLuiLZojfD5EyDL1gKPrprdlGFo1n43uvx1WTjcEwGfzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=sXM5Kd8N; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CBED3CAEC9;
	Thu, 14 May 2026 02:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778717186; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=q9mlP5LpbiwbXoJmKa6RlqBhsUePdNJjaIJGAtp2bJQ=;
	b=sXM5Kd8N/fmEsBD/pQEmKPYBz3udisYfmch/OGbcAHfWJvWDBVhzpYYR5tjjQFGSAjP8Xg
	6f/MKFrKCNw1qFvA9naLkHuEKGPlK1xAVvfl9yUpCpzOJNcOJ3qB7rKSspqqI6L8L0tzBk
	qvj87yyPX0IXbJlKis/cKEHpCj/spJ6ImXn9axKQVT3nNJ632rbj20H2M0xq7SSKbtiSIg
	S76HOjk8KPIyVfkcDmzXnWddTTsmDQAUB9GFcBLS1LXhv3pTePFCRTc/Yq6qipiHxx+tYv
	L6wr73iISHY3j+WsRRAMRf0JFd2zEiwyKLq+juyFHbejud0xlhMTBNvwPl5jYw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	naseefkm@gmail.com,
	robh@kernel.org,
	tglx@kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 5/5] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 14 May 2026 00:06:01 +0000
Message-Id: <20260514000601.3430262-6-cjd@cjdns.fr>
In-Reply-To: <20260514000601.3430262-1-cjd@cjdns.fr>
References: <20260514000601.3430262-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9C15C53C405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14590-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This timer was first developed on the EN751221 which is a MIPS 34Kc
and has a custom interrupt controller. The hardware for
econet,en751221-intc implements percpu routing of the timer interrupts.

However, the EN751627 and EN7528 are MIPS 1004Kc based, and use the
standard mti,gic compatible interrupt controller. This interrupt
controller uses a different IRQ number for each timer interrupt.

Support both interrupt modes, percpu and individual IRQ per timer.

This is based on work by Ahmed Naseef but has been refactored and
broken up since then.

Originally-by: Ahmed Naseef <naseefkm@gmail.com>
Link: https://github.com/openwrt/openwrt/commit/fab098cb6121647ca9cc6e501d56ebe8a9ea550b#diff-a09ee5e4166e89df337d03c1455dce7b81eb89797b1d0f714476b188e6685334
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 74 ++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4b712eb4db6f..642af9fcda60 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -8,6 +8,7 @@
 #include <linux/io.h>
 #include <linux/cpumask.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/clockchips.h>
 #include <linux/sched_clock.h>
 #include <linux/of.h>
@@ -21,14 +22,26 @@
 #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
 /* 34Kc hardware has 1 block and 1004Kc has 2. */
 #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+#define ECONET_MAX_IRQS			NR_CPUS
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
 	u32		freq_hz;
+	int		irqs[ECONET_MAX_IRQS];
+	int		num_irqs;
 } econet_timer __ro_after_init;
 
 static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
 
+/* This timer supports two interrupt controller models, either 1 IRQ which is in per-cpu
+ * mode which is used on 34Kc CPUs, and separate IRQ number per CPU which is used on
+ * 1004Kc CPUs with GIC intc.
+ */
+static inline bool is_percpu_irq(void)
+{
+	return econet_timer.num_irqs == 1;
+}
+
 /* Each memory block has 2 timers, the order of registers is:
  * CTL, CMR0, CNT0, CMR1, CNT1
  */
@@ -98,12 +111,21 @@ static int cevt_init_cpu(uint cpu)
 	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
 	u32 reg;
 
+	if (!is_percpu_irq() && cpu >= econet_timer.num_irqs)
+		return -EINVAL;
+
 	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
 
 	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
 	iowrite32(reg, reg_ctl(cpu));
 
-	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	if (is_percpu_irq()) {
+		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	} else {
+		if (irq_force_affinity(econet_timer.irqs[cpu], cpumask_of(cpu)))
+			pr_warn("%s: failed to set IRQ %d affinity to CPU %d\n",
+				cd->name, econet_timer.irqs[cpu], cpu);
+	}
 
 	/* Do this last because it synchronously configures the timer */
 	clockevents_config_and_register(cd, econet_timer.freq_hz,
@@ -171,6 +193,44 @@ static int __init cevt_init(struct device_node *np)
 	return ret;
 }
 
+static int __init cevt_init_multi_irq(struct device_node *np)
+{
+	int i, ret;
+
+	for (i = 0; i < econet_timer.num_irqs; i++) {
+		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
+
+		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
+		if (econet_timer.irqs[i] <= 0) {
+			pr_err("%pOFn: irq_of_parse_and_map failed", np);
+			ret = -EINVAL;
+			goto err_free_irqs;
+		}
+
+		ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
+				  IRQF_TIMER | IRQF_NOBALANCING,
+				  np->name, NULL);
+		if (ret < 0) {
+			pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
+			       econet_timer.irqs[i], ret);
+			irq_dispose_mapping(econet_timer.irqs[i]);
+			goto err_free_irqs;
+		}
+
+		cevt_setup_clockevent(cd, np, econet_timer.irqs[i], i);
+		cevt_dev_init(i);
+	}
+
+	return 0;
+
+err_free_irqs:
+	while (--i >= 0) {
+		free_irq(econet_timer.irqs[i], NULL);
+		irq_dispose_mapping(econet_timer.irqs[i]);
+	}
+	return ret;
+}
+
 static int __init timer_init(struct device_node *np)
 {
 	struct clk *clk;
@@ -184,6 +244,12 @@ static int __init timer_init(struct device_node *np)
 
 	econet_timer.freq_hz = clk_get_rate(clk);
 
+	econet_timer.num_irqs = of_irq_count(np);
+	if (econet_timer.num_irqs <= 0 || econet_timer.num_irqs > ECONET_MAX_IRQS) {
+		pr_err("%pOFn: invalid IRQ count %d\n", np, econet_timer.num_irqs);
+		return -EINVAL;
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
@@ -202,7 +268,11 @@ static int __init timer_init(struct device_node *np)
 		goto err_unmap;
 	}
 
-	ret = cevt_init(np);
+	if (is_percpu_irq())
+		ret = cevt_init(np);
+	else
+		ret = cevt_init_multi_irq(np);
+
 	if (ret < 0)
 		goto err_unmap;
 
-- 
2.39.5


