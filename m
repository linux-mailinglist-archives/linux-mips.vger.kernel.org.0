Return-Path: <linux-mips+bounces-14058-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB/QEMvu0ml/cQcAu9opvQ
	(envelope-from <linux-mips+bounces-14058-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:22:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35D3A02C8
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0FE830063A0
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 23:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEED353EDF;
	Sun,  5 Apr 2026 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="TFQCKYNO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6533F5BC
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431368; cv=none; b=an+9zz7kgJmpODWLi5oNZk5V6S6E2VCbIp1ROJ88u1Y1kUudB2aA+YwrPFpDu8kQtVPTXx4GEDg/I5uOFAGOlwt2dTbNSLX00NPpAuQI8zq9XAx84o3IOUaxJ7Q+KWzzxVL4kVX4h+2n7rd3Ez5OeTepV/KC0nNzsetWM0KIIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431368; c=relaxed/simple;
	bh=XpyZ1Lbo/yyhspvJDMRbo7m4H0g/KU5rzZpUvdOn1J8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=aQsdlKRj0PgpLphlNU6bZv6hTlNnCE3RLrtxHu9UtYHDUu4yCtGmGv43qiyAMvHzfk9J2xE6U5L5HzcA+S32qvYTReD1rBJFnSO8HsCujwYF9or3+/NQwNmyL2HoSXp7RVHMkzMjCeUsn6BnYBqfWiiEl3kEMh213Ogkup6MAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=TFQCKYNO; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fppQc1cgLzDqRh
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775431363; bh=Sy2tK5T9y1pd88+Wluip2N2cKEGro0t56kYjkiGawnU=;
	h=Date:From:Subject:To:Cc:From;
	b=TFQCKYNOof4oY09a3MyvIT6VQEAlRXpWqsCY3NubH37xQRogM6XHF8euXNh7iiUnN
	 6bM2l+/OuiKZODax5mGI4rHiaGiNLyorsFVJ30DES3N2UB59rt/9mwzg2B4ToFiea4
	 jlPGYx8+Y4PdP8YeVIckxloxK0GXpWLyqO3DcMGI=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4fppQV2HzGz9xf6;
	Sun,  5 Apr 2026 23:22:26 +0000 (UTC)
X-Riseup-User-ID: AB0B50A313BE062469DE136CB7EDB213E655ACF3478BBB0069330C1E0A27AB73
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4fppQT0l5cz22Ml;
	Sun,  5 Apr 2026 23:22:24 +0000 (UTC)
Message-ID: <863a8bde-1b70-4338-a68a-b9c03baee85a@riseup.net>
Date: Mon, 6 Apr 2026 02:22:24 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rany Hany <rany_hany@riseup.net>
Subject: [PATCH 2/3] MIPS: SMP: Wait for secondary CPUs to stop in
 smp_send_stop()
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	TAGGED_FROM(0.00)[bounces-14058-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3C35D3A02C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smp_send_stop() returns immediately without waiting.

Wait up to one second for secondary CPUs to mark themselves offline
before returning, similar to what ARM and ARM64 already do.

Signed-off-by: Rany Hany <rany_hany@riseup.net>
---
 arch/mips/kernel/smp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 4868e79f3..8d2932e81 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -427,7 +427,17 @@ static void stop_this_cpu(void *dummy)
 
 void smp_send_stop(void)
 {
+	unsigned long timeout;
+
 	smp_call_function(stop_this_cpu, NULL, 0);
+
+	/* Wait up to 1s for other CPUs to stop */
+	timeout = USEC_PER_SEC;
+	while (num_online_cpus() > 1 && timeout--)
+		udelay(1);
+
+	if (num_online_cpus() > 1)
+		pr_warn("SMP: failed to stop secondary CPUs\n");
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
-- 
2.53.0



