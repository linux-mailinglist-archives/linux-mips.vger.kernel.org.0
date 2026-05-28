Return-Path: <linux-mips+bounces-14816-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKOrGhFPGGpMiwgAu9opvQ
	(envelope-from <linux-mips+bounces-14816-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:20:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0D5F3955
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 16:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB42F30BCB8B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 14:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D477A2E5429;
	Thu, 28 May 2026 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="swSHffBB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591962D7D47;
	Thu, 28 May 2026 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977271; cv=none; b=k4wlu+5HgkNVhDpXvlx4O0WOtqVnEa9brPPLoatSRLkPrguGS5aBoUrk+/85/TgfrYOUg/pAubMVr5oDL9KlOUvId7OoUoXqwFd8QbbkwRM25/C8s1XfRGtzBwQBiKZQqRX8903ko/pnPT0RHA2TVQurnY1+Nw+X27DtBAPITEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977271; c=relaxed/simple;
	bh=9cxKqRSzDI1k9DZMBIppT7I1D0ocQhPQ6p2OsQkLhW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fX9pZ8kn86YQ+pH7SN2jOIeZxcJAFY+H3pjm3CQ9bgBoCt0xGPqoMABAwHB0HWmPywu/4xsKNdvFNim//QnI0mall5spieWFjAClznm0pV5VcNEmJPvG82pzHHaQF/lcSsyR3kgdLGPfzy+x5SXesenYkTXf+Q75ux2S23II5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=swSHffBB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1F064B4F67;
	Thu, 28 May 2026 16:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779976852; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q6cAAX9tCyXcIpCsb2E2vZSxmNLsA1iEdhH9bQm/us8=;
	b=swSHffBBunY4eCmpsSnru5+9yku9EPJG4aGpkoYBpxoNt65Tdg9TKNnpUwRR/lIucRwbvq
	fHXsG/GqJ4xvGalnwr176HONOll+eBb30lQmK+nf9I8XbPz490vTCD4yUKfNHhbS8hg1fT
	gPsuWYkPjXTqtMfBQchBoWWBcwkW0pfujSgC585uDvLEaUPAiVAX8cJrWg3y3l3OXnoIEs
	XYQQBtAT2hNgy2A2IMpvGMCCBeixE4FETSrfCoIOYlw4bNtrvixjaX85oWUlz/ciKS8F4l
	VMQLXKrnBSnuR1tIK+me9mxnUa594ZN+pJQG/HaturMGPjK3jgAoQyPbcmLOlg==
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
Subject: [PATCH v6 1/5] clocksource/timer-econet-en751221: fix refcount leak
Date: Thu, 28 May 2026 14:00:42 +0000
Message-Id: <20260528140046.2897674-2-cjd@cjdns.fr>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,al2klimov.de,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14816-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,al2klimov.de:email]
X-Rspamd-Queue-Id: 73C0D5F3955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Alexander A. Klimov" <grandmaster@al2klimov.de>

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
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
2.39.5


