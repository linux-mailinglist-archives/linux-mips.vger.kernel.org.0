Return-Path: <linux-mips+bounces-14901-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A9bMADW8IWoqMwEAu9opvQ
	(envelope-from <linux-mips+bounces-14901-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:56:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F339E642709
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:56:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=ALZOuFXz;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14901-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-14901-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C3623006990
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 17:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D964C8FFE;
	Thu,  4 Jun 2026 17:52:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A902212B2F;
	Thu,  4 Jun 2026 17:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595524; cv=none; b=RL+Cw/EG3BTcjLFSB9wPax4P0UFSEz9oqkBtIu3sgeRdIscsslaSK+O4Nor0t29oUGqyQJGJb8gGP2rUNgQyw9O+ygkDA6lIISHlqBdXPpc40ji+k9X/NAyPGDBjZqsWTo9se3dMcV8edXwb0kLd8DLJOlyLEr83RoNaE/1DY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595524; c=relaxed/simple;
	bh=X1n7zojWok6mJSKwqw01jKzhUdh9dRWzqFMGd0XRQXw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LQwsu8YkCIE0Yq0BLv/0mSyqSmahsZOh4LOovOErEKk3x/TRqf9V5xKYzzUSlkMZCb0lt5pxrmiqDNfei9XRkCJomkxvt2Yzz00AmBue40ElyPEVAh9s1US8cJuCIQGh0q3J+YnvexsO77hthu1uRRsBrFTx1x4zXMh0+n10n5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ALZOuFXz; arc=none smtp.client-ip=217.72.192.78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780595520; x=1781200320; i=markus.elfring@web.de;
	bh=Ugb4EnGHGRCKE25RkCxcodmPEb2gojdaDXOASPEL8ZI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ALZOuFXza98VKJdUxegp4W30i05VnOflfL0PmhIXecdEqMfyPvr6WjDk8YTu8NZU
	 HbqOMaNdJNAJH42430FOwbXJevwOiaYBo8KMTZrNJSt6kIohxOfalgRf+mILMM67w
	 Za9Vh4iapY2WLddRbWlTgq8RhXa+IcITrNW0VBx5ZUQvHwk/64gI1jLYMVV+3S8O7
	 uJhWFcpcTpYS9RC9YUw8+hCBtMUpGOG7zMWaT6oAWsccqQDF28YXzFL7hf3KpssPM
	 BcavdZuP3N52MADrrYeAzFNmIDkBxXFrd7F48azykgupxY8vRSgx5u5zbLNQ6PyGG
	 oF83Yx/39OH4tcYkFg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1wwWmK13Ey-00b3KZ; Thu, 04
 Jun 2026 19:52:00 +0200
Message-ID: <870b810e-1f4e-4af2-b514-c822dfa89113@web.de>
Date: Thu, 4 Jun 2026 19:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] MIPS: kernel: proc: Combine two seq_puts() calls in
 show_cpuinfo()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mips@vger.kernel.org, =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?=
 <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2TN3e0Bsb5aqSSGNGUHarNT7H/hxJEKo/U5+j8lvgnOzHh0j0wa
 jFKGE5C9K2/2MyZ4Eau6qby1v5WPvHI4auOadxoUhUGp2ojlKqxnhOBmjRM1gNoBko2oLUJ
 xAzPARffaaVYLLmaA/86o9hY5w3tfGeQoLIwO2Td90sae/9eBC7ioqG2Bd1BaZDjrzCeWWL
 xnTSo6Qze120hUE/gmERA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:80d8+TTvD5Q=;CcjpcQhda4BTmlgWFV51nuJEas0
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14901-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[web.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F339E642709

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 19:10:04 +0200

Put data into a sequence by a single seq_puts() call instead of two.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/kernel/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index fdf659a8bb3d..9e8b8f99b606 100644
=2D-- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -109,9 +109,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " mips64r5");
 	if (cpu_has_mips64r6)
 		seq_puts(m, " mips64r6");
-	seq_puts(m, "\n");
=20
-	seq_puts(m, "ASEs implemented\t:");
+	seq_puts(m, "\nASEs implemented\t:");
 	if (cpu_has_mips16)
 		seq_puts(m, " mips16");
 	if (cpu_has_mips16e2)
=2D-=20
2.54.0


