Return-Path: <linux-mips+bounces-14589-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDGoFDwSBWpoSAIAu9opvQ
	(envelope-from <linux-mips+bounces-14589-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:07:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A202D53C3E8
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 02:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D11783014284
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB43C1E0DD8;
	Thu, 14 May 2026 00:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="c6+z3sdz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1E1DB54C;
	Thu, 14 May 2026 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717187; cv=none; b=FClbGB1swI54WwFRDLXVC2znlIHyhOrqouNlVZKBlNqRgFq4A/C0bSg5KnHXeciksaC6XfkAyBLld6b1/7ABwbb2o+DWrv9+yABdxBj6H9RO7yuG/5Ms6BUUM1OqQn44dKrtiVLkHsgIXyCiOgxabOcgXMXwlHSzxpkrh7jx2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717187; c=relaxed/simple;
	bh=JY/9j43Kc1bhFxarcxOb4L1EYCGR3nA3bFC7iXEP22c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q50YnDe1LsbBJ0NiTtDbjCExxDlXoqbyh3iXJfnjs7//SfeWNhbLqYTJt4MdES4s/BQOf6d3MYHxvPWrYr9iTFG2x9BqnBbC2KjNgMJv2ZRO6yF7aDweBKEwFQbhzLLzVlX4KEz65e8467nzlK1ZJXEM3qHCt5Gl9AOTjACSInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=c6+z3sdz; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98A2C3CC215;
	Thu, 14 May 2026 02:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778717183; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nHs+ZG7Xyt4eumxbVK7vTkSw0rUysE85PTRgQqMszug=;
	b=c6+z3sdzHyXk1pNy0iL3Fd29XaXYftjP3N8CQ0kf0s2G7JIBfY4Ob13DhERYkpDNzfK393
	0j847VoMVwBQxHGP9ziBFxoN6o5CbVlaHUPmG0bhFDiYom5vZ3Y9iDxcd8hBf/ctQCAGRu
	IrVBS9qemUJp7cYtlWlZ516dnl9dMSw94wgkmH0D22sXqySjH3Kj5DsOrQPNT68fq5CTfX
	VGkzwQUIJRrYKDHxheFp2eixZGVN3yGlN1f4/mk74bDura34xY9r4GJTvtPzeZ1fg1Cux+
	vhL1ABHpgN0R/XUqrGAwIrGqtCnAc8Yu1zIqltwkj1QUPaFICXqtaWbrPYdoKg==
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
Subject: [PATCH v2 4/5] clocksource/timer-econet-en751221: Unmap io mem on probe error
Date: Thu, 14 May 2026 00:06:00 +0000
Message-Id: <20260514000601.3430262-5-cjd@cjdns.fr>
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
X-Rspamd-Queue-Id: A202D53C3E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14589-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In case of error during probe, the io mem blocks should be unmapped.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/timer-econet-en751221.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index e79069d9a826..4b712eb4db6f 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -188,7 +188,8 @@ static int __init timer_init(struct device_node *np)
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto err_unmap;
 		}
 	}
 
@@ -198,12 +199,12 @@ static int __init timer_init(struct device_node *np)
 				    clocksource_mmio_readl_up);
 	if (ret) {
 		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	ret = cevt_init(np);
 	if (ret < 0)
-		return ret;
+		goto err_unmap;
 
 	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 			  "clockevents/econet/timer:starting",
@@ -217,6 +218,14 @@ static int __init timer_init(struct device_node *np)
 		(econet_timer.freq_hz / 1000) % 1000);
 
 	return 0;
+
+err_unmap:
+	for (int i = 0; i < ARRAY_SIZE(econet_timer.membase); i++) {
+		if (econet_timer.membase[i])
+			iounmap(econet_timer.membase[i]);
+	}
+
+	return ret;
 }
 
 TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
-- 
2.39.5


