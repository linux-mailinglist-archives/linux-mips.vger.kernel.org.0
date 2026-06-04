Return-Path: <linux-mips+bounces-14902-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id es7OM6O8IWpIMwEAu9opvQ
	(envelope-from <linux-mips+bounces-14902-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:57:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524E64274A
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:57:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=M2WsnRAN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14902-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14902-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5C2300875F
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 17:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EAC4C9541;
	Thu,  4 Jun 2026 17:54:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470C492527;
	Thu,  4 Jun 2026 17:54:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595653; cv=none; b=HQsi6oWtKsZjHXK9hgsSRlNCHMh7hqBgdWXeWvyVn2UzlnUzJVVqxhjHy2EBftTHbuP7k99ujIrC0C5aBEIXZyr4uDfyF3I6GUG5LBMyABdZdsVfAQEGJifXnWdtpa6sEYLelHYMy70ocpuyw5pKc9yru1I429tM0iaZ1TwogXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595653; c=relaxed/simple;
	bh=A8W9rIdpizl97MY2qKWbDvuFGTFYb/1R5MeP8rtnznI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rTPlYZnWlNC58ZnMQpJF+ysW+C7ipx/lGQuOX55HMCixBkj0Y85z7UI0M+BGRPUJiMXTUmTrh26jx1SdkIR0yns3C8B2g23vM1BS13e0OnmiH/jj42x/62oWRBbcXRWQ7mmNYg4aqZVAiG7jKt6MVOvfj3FTKPwfCkjOK8/ADjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=M2WsnRAN; arc=none smtp.client-ip=212.227.17.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780595650; x=1781200450; i=markus.elfring@web.de;
	bh=gGbGMKxugBrdjuAoq9jQsP/dLFPf14bo78rvG9/ah1I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M2WsnRANvslltusRrEIsyI2d+NYFNOqCx08g1WDjfXC7CyNiY8dwWcsrLrCTuwjH
	 yWTKiRiHehCfM4QST1RoDLRsdtXTeu+WeqZPqP7Vnr8t6M/Tb/hFwhtFh7mE1kT81
	 FmO+g/JvsmVGlICljNLlClRA+uoBMaTvOkDE1YXczXW5WYrmRoXuh7EAreQJWeZSL
	 skVsePuxm8xpiG1EDzx8FhkA/3Yn0V9THK/gfAQ8TTkQHtB2+OL0J3EZDP56an4oF
	 r4T9jBMARosU9rDaQmVt3k+6oB7aHG4VyVSAodiraZKm5Kx21/4H80thWuxD6kR5G
	 k4d/I7AhVp8As6z7og==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5j1c-1wcJoZ3XB4-00FdFh; Thu, 04
 Jun 2026 19:54:09 +0200
Message-ID: <c2dcc1be-0f5e-4e51-ba67-235c178ce211@web.de>
Date: Thu, 4 Jun 2026 19:54:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] MIPS: kernel: proc: Use seq_putc() calls in
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
X-Provags-ID: V03:K1:7tUEJbQmOu0zDHO/psUIq6B/zMLCA34OMTveiMqUNlF7SNY5KRu
 bCkX1bsvucXtbuRUYKM3gBgBXahpGa6Vdu+FOOyiFBLS3UYj+rNaLqYDmD5ttRbSy0l7Wrw
 bE2vb5pNvAjY8fB5ORcc/55nTwSZW7FkkUSycZJP88JfG8rU50TpqvNu5HQ/PRHuL2s183x
 mRkSeBEp74yrLT7lDf0xA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sFAHwpgf0tY=;9sRFXUOgNRBmiqjK0QGQwI4JyXc
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14902-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5524E64274A

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 19:12:11 +0200

Single characters should occasionally be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/kernel/proc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 9e8b8f99b606..42430c7f0acf 100644
=2D-- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -79,7 +79,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		for (i =3D 0; i < cpu_data[n].watch_reg_count; i++)
 			seq_printf(m, "%s0x%04x", i ? ", " : "",
 				cpu_data[n].watch_reg_masks[i]);
-		seq_puts(m, "]");
+		seq_putc(m, ']');
 	}
=20
 	seq_puts(m, "\nisa\t\t\t:");
@@ -149,7 +149,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " loongson-ext");
 	if (cpu_has_loongson_ext2)
 		seq_puts(m, " loongson-ext2");
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
=20
 	if (cpu_has_mmips) {
 		seq_printf(m, "micromips kernel\t: %s\n",
@@ -298,7 +298,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	raw_notifier_call_chain(&proc_cpuinfo_chain, 0,
 				&proc_cpuinfo_notifier_args);
=20
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
=20
 	return 0;
 }
=2D-=20
2.54.0


