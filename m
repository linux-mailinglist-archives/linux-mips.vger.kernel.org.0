Return-Path: <linux-mips+bounces-14784-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GvxJujpFWqXegcAu9opvQ
	(envelope-from <linux-mips+bounces-14784-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 20:43:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405A5DB7E8
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 20:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 513943018A01
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB29423A80;
	Tue, 26 May 2026 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="q/maGtWz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716B42189F;
	Tue, 26 May 2026 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820900; cv=none; b=ArReXPymrpyruwKQU5+z1p0lIo6AFpMYaLvavr7SWXm92rxeVOov5FQmP8gVoz3giupsVPm7j4ScecK/8zWlTyqwVSigplwRJuhj4F3d8sYb7pfo/ic4tTcuZKyMU3iGt1+MA5UhDlv6V/f98awVYTJn79qaFVBFtDIiblBiROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820900; c=relaxed/simple;
	bh=iP+eP9hBSXDY1w2nmHYEU1q4Q50HIhtLC51Y0ORDRvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jz8ddi9/Ef4tAfSdemU9jwbThXMycIfSyKgmL1vZCBu1ARloKtp0Y6oOcwoBckvJ5nVAlCzwO0iCT3IyAkqtEfAWlWBDL9uuskAEgHtvcrpqyoWPQVIxEUB1xdu3awxMhDi8UFyruj0xB0T3N13zPSvfoHuRe8jqaWOqSBtYAtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=q/maGtWz; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=iP+eP9hBSXDY
	1w2nmHYEU1q4Q50HIhtLC51Y0ORDRvo=; h=references:in-reply-to:date:
	subject:cc:to:from; d=al2klimov.de; b=q/maGtWzYPjcrmppLBHAGyJ+fd4BCANm
	rOHwzsOX1fUhDJsd4QaTpLs1PiKBWGau96UY/PB/r9hj8+YuhSxWB3yhq7dVhTuxIzXRX3
	YdcXVA78FVFTzCbou0vgYzn9zwvR5/pDqqHbXTuUpHYOm65wfhxekXPQSPWOjHK1hOJJpn
	U8nqvVqQVMUBjdZ2n7hRvw9taBtW81fwDOu5LmtCmVSRSHwOfTkSaTjPzMu4BTUEIEryE8
	sjKxLXdNF6Gcc8Vtf4YdloyFItmwaffDF+IxpmplcGso/mjyN/8aRHxOBf7GQiCQ8LPqUd
	CQLmzQC5rklmBT/hZJC9qCg/ZHM3kQ==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id ae99d518 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 18:41:29 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Caleb James DeLisle <cjd@cjdns.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-mips@vger.kernel.org (open list:ECONET MIPS PLATFORM),
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clocksource/timer-econet-en751221: fix refcount leak
Date: Tue, 26 May 2026 20:40:58 +0200
Message-ID: <20260526184105.18962-3-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526184105.18962-1-grandmaster@al2klimov.de>
References: <20260526184105.18962-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[al2klimov.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[al2klimov.de:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14784-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[al2klimov.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,al2klimov.de:email,al2klimov.de:mid,al2klimov.de:dkim]
X-Rspamd-Queue-Id: 9405A5DB7E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clocksource/timer-econet-en751221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4008076b1a21..1859335345b5 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -181,6 +181,7 @@ static int __init timer_init(struct device_node *np)
 	}
 
 	econet_timer.freq_hz = clk_get_rate(clk);
+	clk_put(clk);
 
 	for (int i = 0; i < num_blocks; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
-- 
2.54.0


