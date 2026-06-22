Return-Path: <linux-mips+bounces-15164-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FITeM7RbOWpFrAcAu9opvQ
	(envelope-from <linux-mips+bounces-15164-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 17:58:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 731966B0EA6
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 17:58:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=Zh6Ld+TD;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15164-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15164-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 856FD3012540
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 15:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D7C3CAA52;
	Mon, 22 Jun 2026 15:57:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567D838331D;
	Mon, 22 Jun 2026 15:57:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143865; cv=none; b=n7/fthICOd2tewjtsGKGaMVS9E6wl0JJd/XwTWZTDM/6tnZXt8AsrPQJlnlggM3ak/J38HDFZ88/7I9zPZISI1yMuYbyMv3zCQVbkHCho1eUtcGSL1lfFw463R8tsE88UtVZHoC5QEB/eBHTIt1seamkJtrQ+56+rEyXc/dwb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143865; c=relaxed/simple;
	bh=WhXEXj1bRhmCr19CzAbDWgsSmUxUa4k9igIJ/U1f9IQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNqocGh+JeBMdL+IOTgYolhuADn8rp46K1aa2r5XZ3iykza66zLLrVdD66g8rnqeLxFmj01wzGdYOw0sX2p/TSHOzy1iXO+LiHnATq6+/rODcCy9Y2KCA9V5HyGyj3Bx+XOi2c+c+X+1ETVrPTAyOYh+k5G9pgpA7UhYDmEBcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Zh6Ld+TD; arc=none smtp.client-ip=212.227.15.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782143857; x=1782748657; i=markus.elfring@web.de;
	bh=1ORvFe1ufdus/d2jEE/KoTKEFPVCVn1GUBUQV4WRGsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zh6Ld+TDlDXGjOab3jkaWzGz3G859mWnr9N6WdltKhCT19FdWyAm808pjNvS5E0y
	 Y4RU+5zdvepDX00qQ+3sBzdoFpFUbsaktoZRCzDX/AjSqQGE88H4hFPrGXPZROVxq
	 MiTwQp8ah8SVufHtzaNQ4kl1D4IQ+u9O/9RrCRYYOG3D+AG0Je60sWaL2fiT6VL1e
	 IhYegWMVWWgrd0t9V93qBJgSGAoL8F5enWzakeOvsI+nTBurPK2Qeio4DZ481xT09
	 UkwOPkT8Mcqbf93iWDQrYsC+Uw5vVAgdnjMW4cNIOYCmqZgPjv8y25TlV7Qi5IabH
	 wOpiMTNaSDzBPnjJOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mq182-1wyOW30kOg-00en4x; Mon, 22
 Jun 2026 17:57:37 +0200
Message-ID: <736e312c-1356-4d8f-8ae5-bcc695f555dc@web.de>
Date: Mon, 22 Jun 2026 17:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] MIPS: kernel: proc: Use two seq_putc() calls in
 show_cpuinfo()
To: =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <39fa676a-e761-4a33-9660-f366c692d4f1@web.de>
 <ajEs2UcAj-YmT1og@alpha.franken.de>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ajEs2UcAj-YmT1og@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:67jTrmUrZoneySOE+E7/Lpxp2Z5UA4aLo02D7hK2XM8j9OPBf2w
 KZBjXrk/Gsti3QtFIZjamYwnVZwYH54O3ZXhXnyUOqlrKGNKC+Dtd9YXboBuMt0euKnqN9U
 z2qY+OFc/0WhlkcpGEDslQOvFVf+vutdPn+qgc3/Y2z82QMinNpVHmRkB5KQ4k0PdkHjeki
 9uGWTNofF5iDyqf+kRr/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:05ihqUowP44=;3tj+4t0UZ/RYOJLB2a90xg8geQ+
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:chenhuacai@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15164-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[web.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 731966B0EA6

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 Jun 2026 17:50:13 +0200

Single line breaks should occasionally be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/kernel/proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 5401c679813a..5f49fd4653a7 100644
=2D-- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -109,7 +109,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " mips64r5");
 	if (cpu_has_mips64r6)
 		seq_puts(m, " mips64r6");
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
=20
 	seq_puts(m, "ASEs implemented\t:");
 	if (cpu_has_mips16)
@@ -273,7 +273,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " mm_sysad");
 	if (cpu_has_mm_full)
 		seq_puts(m, " mm_full");
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
=20
 	seq_printf(m, "shadow register sets\t: %d\n",
 		      cpu_data[n].srsets);
=2D-=20
2.54.0


