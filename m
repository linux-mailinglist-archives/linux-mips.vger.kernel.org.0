Return-Path: <linux-mips+bounces-14813-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MfDKxVNGGomiwgAu9opvQ
	(envelope-from <linux-mips+bounces-14813-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:11:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6D5F372D
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C859321A4AF
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C1B3E5EE1;
	Thu, 28 May 2026 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Ak6aVmKU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471172D94AB;
	Thu, 28 May 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976873; cv=none; b=Tc3ds8jC7gZpvwfKdCYn4QR7HzmEJ/ZGPE/JTl9Hud0u41XZ54dVlU6Z8XaalfthFfDJC2Ov38wikMfOHnQyvsVnl3l2eiwdBflS9ISX7NI8SAE4eWw/SfJAJfS5TftKupfFzzRu35YF7kWrfkrrqbNakCFsx8f8dyXGCfjzuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976873; c=relaxed/simple;
	bh=xkU7FTh2Qx1l444kXVxCZ72X6BDvMmnbijkDMtD0tYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J6/OgYp/tQfU/lVvvxq0FaLJkY0EET3aEN1zS/mehsxJT3AnMX7ZMXQy1fca6HNSkXAehk5HxhLlAVMxKL7z1I7dYijooRtm4RteTx+NBkAjYZln1qFUVZ4h6NRwiyXvf1CIJNu2wQDB9uHJJkPRNPWV/A3tp4bVgyqgGROpgrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Ak6aVmKU; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E703B4B5E18;
	Thu, 28 May 2026 16:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779976864; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=B1OV7lBJrmDaac8ePy8dHk2DEYoP6HJXQm0PFK+z8S0=;
	b=Ak6aVmKUr3lEfXkJIKKCtXgcXKIQJJipvbSAC4Rx7AgXp/h5JbjRqVFN9d5biEeugcr7rv
	bdBkD7bN0MjrhBCsHnoqZidgTf1MkgcridsaleptHoPh1mKtgB7k2wolV38vjCHzazd3pk
	El1TK7RL+MY7jK3nWEexalSrBgVGLWPM+1K4ZCGsj6AbFrjbkDgCH6LV4XWx1tQckjhbdI
	hojJ1LFD0Y+M6jf3pFqTVVmQutUoJ2x8/5LSa7zUZw34MEkn/tpMHEvmF4h0N4T2qBK5LE
	EV7JCT4ZRHzAZsfPr3X8FF/TCcCeqXA1ZwRjJpSIzcrFXH81Gfp4812s6iBnxQ==
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
	grandmaster@al2klimov.de,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v6 3/5] clocksource/timer-econet-en751221: Init teardown on error if possible
Date: Thu, 28 May 2026 14:00:44 +0000
Message-Id: <20260528140046.2897674-4-cjd@cjdns.fr>
In-Reply-To: <20260528140046.2897674-1-cjd@cjdns.fr>
References: <20260528140046.2897674-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,al2klimov.de,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14813-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0CA6D5F372D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As a clocksource, much of the initialization process is irreversible
and the impact of a failure to initialize is a failure to boot.
That said, good practice is to attempt a clean exit if probing fails,
and supporting this pattern will reduce the likelihood that future
contributions introduce a bug by trying to teardown after it is no
longer possible to do so.

Convert the init process into two clearly delineated phases, one
which is reverted in case of error, and the other which can't be.
Move all IRQ and address resource mapping before that point, and add
teardown logic in case of error before the point of no return.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 84 ++++++++++++---------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 1859335345b5..714702b9ef12 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -24,6 +24,7 @@
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	int		irq;
 	u32		freq_hz;
 } econet_timer __ro_after_init;
 
@@ -126,22 +127,9 @@ static void __init cevt_dev_init(uint cpu)
 	iowrite32(U32_MAX, reg_compare(cpu));
 }
 
-static int __init cevt_init(struct device_node *np)
+static void __init cevt_init(struct device_node *np)
 {
-	int i, irq, ret;
-
-	irq = irq_of_parse_and_map(np, 0);
-	if (irq <= 0) {
-		pr_err("%pOFn: irq_of_parse_and_map failed", np);
-		return -EINVAL;
-	}
-
-	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
-
-	if (ret < 0) {
-		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
-		goto err_unmap_irq;
-	}
+	int i;
 
 	for_each_possible_cpu(i) {
 		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
@@ -151,21 +139,12 @@ static int __init cevt_init(struct device_node *np)
 					  CLOCK_EVT_FEAT_C3STOP |
 					  CLOCK_EVT_FEAT_PERCPU;
 		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= irq;
+		cd->irq			= econet_timer.irq;
 		cd->cpumask		= cpumask_of(i);
 		cd->name		= np->name;
 
 		cevt_dev_init(i);
 	}
-
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-			  "clockevents/econet/timer:starting",
-			  cevt_init_cpu, NULL);
-	return 0;
-
-err_unmap_irq:
-	irq_dispose_mapping(irq);
-	return ret;
 }
 
 static int __init timer_init(struct device_node *np)
@@ -187,22 +166,45 @@ static int __init timer_init(struct device_node *np)
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out_membase;
 		}
 	}
 
+	econet_timer.irq = irq_of_parse_and_map(np, 0);
+	if (econet_timer.irq <= 0) {
+		pr_err("%pOFn: irq_of_parse_and_map failed\n", np);
+		ret = -EINVAL;
+		goto out_membase;
+	}
+
+	ret = request_percpu_irq(econet_timer.irq, cevt_interrupt, np->name,
+				 &econet_timer_pcpu);
+
+	if (ret < 0) {
+		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
+		       econet_timer.irq, ret);
+		goto out_irq_mapping;
+	}
+
+	cevt_init(np);
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"clockevents/econet/timer:starting",
+				cevt_init_cpu, NULL);
+	if (ret < 0) {
+		pr_err("%pOFn: cpuhp setup failed (%d)\n", np, ret);
+		goto out_irq_free;
+	}
+
+	/* Point of no return, do not attempt to tear down after this. */
+
 	/* For clocksource purposes always read clock zero, whatever the CPU */
 	ret = clocksource_mmio_init(reg_count(0), np->name,
 				    econet_timer.freq_hz, 301, ECONET_BITS,
 				    clocksource_mmio_readl_up);
-	if (ret) {
-		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
-		return ret;
-	}
-
-	ret = cevt_init(np);
-	if (ret < 0)
-		return ret;
+	if (ret)
+		pr_err("%pOFn: clocksource_mmio_init failed: %d\n", np, ret);
 
 	sched_clock_register(sched_clock_read, ECONET_BITS,
 			     econet_timer.freq_hz);
@@ -212,6 +214,20 @@ static int __init timer_init(struct device_node *np)
 		(econet_timer.freq_hz / 1000) % 1000);
 
 	return 0;
+
+out_irq_free:
+	free_percpu_irq(econet_timer.irq, &econet_timer_pcpu);
+out_irq_mapping:
+	irq_dispose_mapping(econet_timer.irq);
+out_membase:
+	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+		if (econet_timer.membase[i]) {
+			iounmap(econet_timer.membase[i]);
+			econet_timer.membase[i] = NULL;
+		}
+	}
+
+	return ret;
 }
 
 TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
-- 
2.39.5


