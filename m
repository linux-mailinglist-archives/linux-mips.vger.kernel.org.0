Return-Path: <linux-mips+bounces-14152-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP1YNxhF32nzRAAAu9opvQ
	(envelope-from <linux-mips+bounces-14152-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 09:58:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 438114019F0
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 09:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2840431322AA
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 07:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A8A3A1CF3;
	Wed, 15 Apr 2026 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Aiy83F9F"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7093B27D4
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239608; cv=none; b=YuBwsVIdpX2N9Vg+HUg70/wGqrUGRu76w1KXVcZC5MjHhzDMpGdy+A9W6i64Yos0o7NiLDpb0Ctq7xGDflKTJVF7IGjsWQSIWfgstYbN7RcLyGrxX3yFI49u+f/4NpTjGmeAlzSlbGXxmMkvoL0EPeyxmvMQ0nlFpdx2VLSDDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239608; c=relaxed/simple;
	bh=W4x/58XgIv5XI7jhWh4j8cARAN9k4mITWH2qk9/UthI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lGPoOOFQnGIQ1dEmCHS6jegdiJAAPZd8bQhXNlipMcTgt8aiz2pMAYVsDi14SQLzstfxqrfxmtxj2H9ENRIGjTSZUi4LHibsbALOEEh85gDKwKFz7rciRShmGnjQ/AfR0OxCA5d6c9Xn0M/YZAVESRmXAbgmGs4X0iw51KUG6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Aiy83F9F; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3ltqacpkzzfcxl75v7gii5t4m4.protonmail; t=1776239597; x=1776498797;
	bh=aOLx3Q8yHI6Qs9EHpVk/UjtK8hz2zOx9P3hITrevSuE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Aiy83F9FtZbcG0mMNniof9zE2P6NOQnRgWoXJ6M6G+0sH9r7n+EUh+qy5poIKgwSi
	 uGZ7cDm6aX5FMmN58i3bwN5uSFLaZqjbxccsyVlHK8IjEwOhLCro+evlYGOwDiPzy1
	 ueotgPdin31OBo1vKGJrKmry1Zz0js/nNx+Vkoac72RcylSdlZuV3gNO3qe8H5Vpwx
	 373ooQ+Hn5M3S+C2x+N8E4gaSOEVIm4faFnq7FYZr4E6DhdkOHA9Fa4acQ3HS93J44
	 PLO0ee4VYzZLtuXOC5aQ9Y+nKdp6ojhReOP96nUTh3w8iX1314sfIJDkZj5QkFeslD
	 A313KADE8WamA==
Date: Wed, 15 Apr 2026 07:53:12 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>, "naseefkm@gmail.com" <naseefkm@gmail.com>
Subject: [PATCH v3 1/2] clocksource: timer-econet-en751221: fix timer block mapping at boot
Message-ID: <o_cMD_cD6PNolsucCVtoojfSsfFgjsNiEop7YJ_QW8jrX1aCkIF8Rhdk-8_DSCBU1WrKSjr9STxTuCjiRK8yJ6vDA4Q1Ck2BCgOzYaBqSEs=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: ee175f24970d808c9ea6043e25897b51ed4de194
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=3ltqacpkzzfcxl75v7gii5t4m4.protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alpha.franken.de,cjdns.fr,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14152-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email,proton.me:dkim,proton.me:mid]
X-Rspamd-Queue-Id: 438114019F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

timer_init() used DIV_ROUND_UP(num_possible_cpus(), 2) to determine how
many register blocks to iomap. At early boot with VPE-based SMP, MIPS
reports num_possible_cpus()=3D1 (VPEs not yet brought online), giving
num_blocks=3D1. Only membase[0] is then mapped via of_iomap.

The EN751627 SoC has 2 physical cores, each with 2 VPEs, giving NR_CPUS=3D4
and two timer register blocks (one per core). Each block serves two VPEs:
block 0 handles CPU0+CPU1 (core 0), block 1 handles CPU2+CPU3 (core 1).
The block count is a silicon constant: DIV_ROUND_UP(NR_CPUS, 2) =3D 2.

cevt_init() calls cevt_dev_init(i) for each possible CPU via
for_each_possible_cpu(). On EN7528/EN751627 with 4 VPEs, NR_CPUS=3D4 so
cevt_dev_init(2) is called. cevt_dev_init(2) writes to reg_compare(2)
which dereferences membase[2>>1] =3D membase[1], which is NULL:

  CPU 0 Unable to handle kernel paging request at virtual address 00000008
  epc : iowrite32+0x4/0x10
  ra  : cevt_dev_init+0x40/0x64

Fix: replace the runtime calculation with ECONET_NUM_BLOCKS, which is
DIV_ROUND_UP(NR_CPUS, 2) evaluated at compile time. This is the same
expression used to declare the membase[] array, so the loop bound and
array size are provably consistent. For NR_CPUS=3D4 this is always 2,
correctly mapping both register blocks regardless of how many VPEs are
visible at early boot.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
Reviewed-by: Caleb James DeLisle <cjd@cjdns.fr>
---
v3: No changes. Resent as v3 to keep version in sync with 2/2.
v2: Add Reviewed-by from Caleb James DeLisle.

 drivers/clocksource/timer-econet-en751221.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksou=
rce/timer-econet-en751221.c
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -160,5 +160,4 @@ static u64 notrace sched_clock_read(void)
 static int __init timer_init(struct device_node *np)
 {
-=09int num_blocks =3D DIV_ROUND_UP(num_possible_cpus(), 2);
 =09struct clk *clk;
 =09int ret;

@@ -172,5 +171,5 @@ static int __init timer_init(struct device_node *np)

 =09econet_timer.freq_hz =3D clk_get_rate(clk);

-=09for (int i =3D 0; i < num_blocks; i++) {
+=09for (int i =3D 0; i < ECONET_NUM_BLOCKS; i++) {
 =09=09econet_timer.membase[i] =3D of_iomap(np, i);
 =09=09if (!econet_timer.membase[i]) {
 =09=09=09pr_err("%pOFn: failed to map register [%d]\n", np, i);

