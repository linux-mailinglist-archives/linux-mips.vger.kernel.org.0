Return-Path: <linux-mips+bounces-14903-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zi+RCEa8IWo0MwEAu9opvQ
	(envelope-from <linux-mips+bounces-14903-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:56:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A75642716
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:56:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=lDwa+Tdg;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14903-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14903-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B46F300B862
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 17:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3674C956C;
	Thu,  4 Jun 2026 17:56:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F15A492527;
	Thu,  4 Jun 2026 17:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595778; cv=none; b=B26vNTtvDPDvwoaLTBAfQlIy3Gr1W0a0KObHkXABJF+3uleKxM/VV32bnkparZnA+Kw6K6z2KaD1u2APLMF3rrGoPKLJfDQ9Xs2nNhwOKmeFM7W+GejhiMEHfCD0Uo8MhsJ1UcMcOzlXt4EfJyIyqx1MsKESy6/f18iyrXaIHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595778; c=relaxed/simple;
	bh=WmUpECRABIyYu7qnKWS0Fv2tSm2n2n6hAJN+hJRfQg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tzvrytIfCcvphSG2M9E7IXc99IFlVHoD1SBTPfjuo3lBLxuxkSB2lPY8zfLQ1Prszpb8CJ4YFqzFgmraGL+c1diH0Mkv1y+ULwb5BxjvzbZ9kVu7VQdMYdodEVWCyNo5ZRZJvX0CX3ZXBTVkJktJ3NlJ0JzkUlQ99ze27R8V1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lDwa+Tdg; arc=none smtp.client-ip=212.227.17.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780595774; x=1781200574; i=markus.elfring@web.de;
	bh=2Ko60SJxoSNOkZ0p+xGCvq0lOaGnnxAHtdHWo4pMqq4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lDwa+TdgCJgRnNxVX36auh+QILwUOTQsitp9rM7/lAyQpf5w6zhq/ZRD8O3FQckQ
	 Wn7nLx1NFQfnQpu8As8DDkl/bJCiG5WBx0qoKW99ILkw8L6FJGnllJe8dAhBcoIVj
	 05Y6Dh2qPn7HY/fF6bcOgKLzbPP8Y5o5qQG8n8a+KSmX7TI1IFZGNPU35axd8GbXK
	 c8i2/FJR2i6C5adv/nYqyuU01TDCwm4YSG1g4cKZQ6O/XFsh9zn+eZ3vgeOFpJ+Ns
	 4ESGvYJZ02t8LqVcZROv0n1rGbH83vGHcWT6Z6M96rK6exNXRoVO0qt+BFoWE1H5z
	 hjbtO7N22sXbLxKV8g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1xCon90xWr-00rtBh; Thu, 04
 Jun 2026 19:56:14 +0200
Message-ID: <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
Date: Thu, 4 Jun 2026 19:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] MIPS: kernel: proc: Delete unnecessary braces in
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
X-Provags-ID: V03:K1:HyzV3L1fPgnBeqmI7Ff4OcZUOEHQUgyPYxr17sjhA7esKFm3AhT
 7wEWZRz5WYKnTMEmTuyiMyvamYYvi05y537P7yWVy5DJHy7nnaeVHvHEocM6QT77ZSrSNrn
 tiTsUdSFrrO+WAjK+GXNNle5nSOQGQO+7cFu7fqoccSJ+BZ/AS0lCyt1pkb2dJg5SssMbWP
 ahT/d8hdZ+z5Le+ZyvnIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3uQGMKKHw1o=;2MDM2U1IPdc4xoJyMfSQZ1AQaBZ
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14903-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mips@vger.kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A75642716

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 19:15:15 +0200

Do not use curly brackets at one source code place
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/kernel/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 42430c7f0acf..2c50b0b53be1 100644
=2D-- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -151,10 +151,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " loongson-ext2");
 	seq_putc(m, '\n');
=20
-	if (cpu_has_mmips) {
+	if (cpu_has_mmips)
 		seq_printf(m, "micromips kernel\t: %s\n",
 		      str_yes_no(read_c0_config3() & MIPS_CONF3_ISA_OE));
-	}
=20
 	seq_puts(m, "Options implemented\t:");
 	if (cpu_has_tlb)
=2D-=20
2.54.0


