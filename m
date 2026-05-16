Return-Path: <linux-mips+bounces-14620-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMxvHaQACWqnEQQAu9opvQ
	(envelope-from <linux-mips+bounces-14620-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:41:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BCA55E535
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D0C8302F6A0
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEAA3A8753;
	Sat, 16 May 2026 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GuBhxufv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B323A9D90;
	Sat, 16 May 2026 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778974807; cv=none; b=f5XnUcv1rxg0Xr6MMJXD7u0FymyvW0Ll2JpDh2cA9tvpZZs4eoDluokKtrWc0L5EamNr13HCbNPkeDdG2L63FBoXvR1IzmizkgOaSl2WbmgRDjFIuGe+WuoaSUMTFdWpZL+3lQLqvVHnaNMy5587j7A32w7TSdc7ENRyj7yClHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778974807; c=relaxed/simple;
	bh=yu4fJ8ulO9mDA5fJi1f5Oh17QSzsgloHDbdia6qHACE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BrsdjSeajVpV5Wh4Vc8r2xM6jwjqh52HeUgc8SUlvcWkogRFfJVXfUsjwfvyuuCzCc20qekkm7RE8rQWyJBM1D0K1McD2a7Ux4duFQMZw8l3hGixVReaYBYwcFlQWiBcPk95nNPbnxJIGWzdAqHb5+jAlD70LA6evBgAA1XjuiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GuBhxufv; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 323D03F9160;
	Sun, 17 May 2026 01:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778974803; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=evFEwSByBmS71IrMaroencfJpe45Jcdgsf/YM1lBbTw=;
	b=GuBhxufvHyYvUzc5oDgTciZtLhUCUmzgZg43g7OvtTKMM8vAwiRvQ2JUD7SwPARbnNG5pX
	r68QnJG2PCK3VNefXvk74XYBbLj7ZquUNHDE3P2fbUf0LktdJc7sTrdfAGALPfkGWQKHeJ
	BNpAzFhNH6UoiElqnxkyv87GknbVY6OiD9qHH5/ExIQ3FtW//LWAoiN9rsFth78qPkM7jV
	9wPEya5u0m0zqb1xev7dNe5pYc/hsMAtA7TukWDFxvX6elz40CWfwgI0mbEU/D7YFxwQ2Q
	kLnblnpbcgDlA2JkM4HKBFpOVWMKrTeNYQIthxWcjqw8OwcBFL7h9ZxEy69Klw==
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
Subject: [PATCH v5 4/4] clocksource/timer-econet-en751221: Support EN751627 without percpu IRQ
Date: Sat, 16 May 2026 23:39:43 +0000
Message-Id: <20260516233943.49502-5-cjd@cjdns.fr>
In-Reply-To: <20260516233943.49502-1-cjd@cjdns.fr>
References: <20260516233943.49502-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: E2BCA55E535
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
	TAGGED_FROM(0.00)[bounces-14620-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action

EN751627 is based on the 1004Kc which uses a different interrupt number
for each CPU timer. Support both this and the EN751221 which uses a
single percpu interrupt.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 120 ++++++++++++++++----
 1 file changed, 96 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index ed750e39cc4f..529f81118eef 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -21,10 +21,12 @@
 #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
 /* 34Kc hardware has 1 block and 1004Kc has 2. */
 #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+#define ECONET_NUM_IRQS			NR_CPUS
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
-	int		irq;
+	int		irqs[ECONET_NUM_IRQS];
+	bool		is_percpu;
 	u32		freq_hz;
 } econet_timer __ro_after_init;
 
@@ -99,6 +101,25 @@ static int cevt_init_cpu(uint cpu)
 	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
 	u32 reg;
 
+	if (!reg_ctl(cpu)) {
+		pr_err("%s: missing address resource for CPU %d\n", cd->name,
+		       cpu);
+		return -EINVAL;
+	}
+	if (cd->irq <= 0) {
+		pr_err("%s: missing IRQ for CPU %d\n", cd->name, cpu);
+		return -EINVAL;
+	}
+	if (!econet_timer.is_percpu) {
+		int ret = irq_force_affinity(cd->irq, cpumask_of(cpu));
+
+		if (ret) {
+			pr_err("%s: failed to set IRQ affinity to CPU %d: %pe\n",
+			       cd->name, cpu, ERR_PTR(ret));
+			return ret;
+		}
+	}
+
 	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
 
 	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
@@ -107,7 +128,10 @@ static int cevt_init_cpu(uint cpu)
 	clockevents_config_and_register(cd, econet_timer.freq_hz,
 					ECONET_MIN_DELTA, ECONET_MAX_DELTA);
 
-	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	if (econet_timer.is_percpu)
+		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	else
+		enable_irq(cd->irq);
 
 	return 0;
 }
@@ -138,19 +162,48 @@ static void __init cevt_init(struct device_node *np)
 					  CLOCK_EVT_FEAT_C3STOP |
 					  CLOCK_EVT_FEAT_PERCPU;
 		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= econet_timer.irq;
+
+		if (econet_timer.is_percpu)
+			cd->irq = econet_timer.irqs[0];
+		else
+			cd->irq = econet_timer.irqs[i];
+
 		cd->cpumask		= cpumask_of(i);
 		cd->name		= np->name;
 
-		cevt_dev_init(i);
+		/*
+		 * Tolerate CPUs that could exist but don't.
+		 * Fail in cevt_init_cpu when they try to start.
+		 */
+		if (reg_ctl(i))
+			cevt_dev_init(i);
 	}
 }
 
 static int __init timer_init(struct device_node *np)
 {
-	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
+	int num_blocks = of_address_count(np);
+	int num_irqs = of_irq_count(np);
 	struct clk *clk;
-	int ret;
+	int ret, i;
+
+	econet_timer.is_percpu = of_device_is_compatible(np, "econet,en751221-timer");
+
+	if (econet_timer.is_percpu && num_irqs != 1) {
+		pr_err("%pOFn: EN751221 clock must have 1 IRQ not %d\n", np,
+		       num_irqs);
+		return -EINVAL;
+	}
+	if (num_irqs > ARRAY_SIZE(econet_timer.irqs)) {
+		pr_err("%pOFn: Too many IRQs max %d got %d\n", np,
+		       ARRAY_SIZE(econet_timer.irqs), num_irqs);
+		return -EINVAL;
+	}
+	if (num_blocks > ARRAY_SIZE(econet_timer.membase)) {
+		pr_err("%pOFn: Too many regs: max %d got %d\n", np,
+		       ARRAY_SIZE(econet_timer.membase), num_blocks);
+		return -EINVAL;
+	}
 
 	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk)) {
@@ -160,7 +213,7 @@ static int __init timer_init(struct device_node *np)
 
 	econet_timer.freq_hz = clk_get_rate(clk);
 
-	for (int i = 0; i < num_blocks; i++) {
+	for (i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
@@ -169,22 +222,32 @@ static int __init timer_init(struct device_node *np)
 		}
 	}
 
-	econet_timer.irq = irq_of_parse_and_map(np, 0);
-	if (econet_timer.irq <= 0) {
-		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
-		ret = -EINVAL;
-		goto out_membase;
+	for (i = 0; i < num_irqs; i++) {
+		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
+		if (econet_timer.irqs[i] <= 0) {
+			pr_err("%pOFn: failed mapping irq %d\n", np, i);
+			ret = -EINVAL;
+			goto out_irq_mapping;
+		}
 	}
 
-	irq_set_status_flags(econet_timer.irq, IRQ_NOAUTOEN);
-
-	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
-				 &econet_timer_pcpu);
-
-	if (ret < 0) {
-		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
-		       econet_timer.irq, ret);
-		goto out_irq_mapping;
+	for (i = 0; i < num_irqs; i++) {
+		irq_set_status_flags(econet_timer.irqs[i], IRQ_NOAUTOEN);
+
+		if (econet_timer.is_percpu)
+			ret = request_percpu_irq(econet_timer.irqs[i],
+						 cevt_interrupt, np->name,
+						 &econet_timer_pcpu);
+		else
+			ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
+					  IRQF_TIMER | IRQF_NOBALANCING,
+					  np->name, NULL);
+
+		if (ret < 0) {
+			pr_err("%pOFn: IRQ %d setup failed: %pe\n", np,
+			       i, ERR_PTR(ret));
+			goto out_irq_free;
+		}
 	}
 
 	cevt_init(np);
@@ -216,11 +279,19 @@ static int __init timer_init(struct device_node *np)
 	return 0;
 
 out_irq_free:
-	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
+	while (--i >= 0) {
+		if (econet_timer.is_percpu)
+			free_percpu_irq(econet_timer.irqs[i], &econet_timer_pcpu);
+		else
+			free_irq(econet_timer.irqs[i], NULL);
+	}
 out_irq_mapping:
-	irq_dispose_mapping(econet_timer.irq);
+	for (i = 0; i < num_irqs; i++) {
+		if (econet_timer.irqs[i] > 0)
+			irq_dispose_mapping(econet_timer.irqs[i]);
+	}
 out_membase:
-	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+	for (i = 0; i < num_blocks; i++) {
 		if (econet_timer.membase[i])
 			iounmap(econet_timer.membase[i]);
 	}
@@ -229,3 +300,4 @@ static int __init timer_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
+TIMER_OF_DECLARE(econet_timer_en751627, "econet,en751627-timer", timer_init);
-- 
2.39.5


