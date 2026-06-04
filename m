Return-Path: <linux-mips+bounces-14900-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehOdBP+6IWr6MgEAu9opvQ
	(envelope-from <linux-mips+bounces-14900-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:50:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C0642697
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:50:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=BZq0N0Ju;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14900-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14900-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 434F730166DF
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 17:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136E04CA28B;
	Thu,  4 Jun 2026 17:50:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EEA4C957E;
	Thu,  4 Jun 2026 17:50:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595426; cv=none; b=i/+evhy4mWX2gP2Mk3JHm1hN4+9b3SbGMELvuo4s8ud3hX9u4C+MJcVInlU85veAnkfupxbbso27/4/YbdtwrCsdwbxooP8V6bHEtFgHTYyZL+ki11fO8qH+zfpCBNaVibgspKSGpBSyqsvDnwu9dN/bJFN5wCg59mYX1w6mWEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595426; c=relaxed/simple;
	bh=Nr25PbtoAaP9ny+GdzOwgtw+0D/wKrUM7LLzmm7Oa/k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ILzWJWGKgyIMQjgSzXZnwPbzgRfbPwGUyufBCGicxFXLer5jeXWkkGYLnlICBehluY5ryTUMoHs2vvwqaAHigs5ZBFjLaIZUfKVWcijfYPvJyu8bdry89P0+V2gJFdcdcRH6NZk2U4HnD83hUNRxYCsojAmEps9hppAcAJfQDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BZq0N0Ju; arc=none smtp.client-ip=212.227.17.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780595422; x=1781200222; i=markus.elfring@web.de;
	bh=ok2BZZPCylWTOa+jXB/AMiL2facUm/XcmIq9/2R/OmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BZq0N0Jub4Z6TCkff+ViICAif6O+zdm2h4HMRNxp/WnkZw1+Eu7bxGKbbvNC/Tw0
	 TybaFSd44REOds8Lr1fXGl1QggzrBEWAQ/FGvu7t//l9Cdt3hTfnMBp14KrkTRMx3
	 8QZweb4lIvDpbcRq6I1Mi3FtSdrOgmMiLKUAeXXcKck68nPEx+PjXdxUX+kGA63W+
	 0ZSWkBDKecccmsJYrMztqQfu/5P9dQmp3IosmNT9pyJ1C9mm6hNh99rHiSFc0fW/f
	 GlTbhOqJ2sPmc2hbmDaqBbBkyiTf0KqUnDX21mEfNUf/sJXZDHoTesw8Q1WhCPx/d
	 azvoIqJUO6vxTaG3+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJWoU-1wp3RN2spc-00TIZb; Thu, 04
 Jun 2026 19:50:21 +0200
Message-ID: <5dcb1ae4-dc98-4f12-8ccb-ff47b16a326c@web.de>
Date: Thu, 4 Jun 2026 19:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] MIPS: kernel: proc: Simplify data output in
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
X-Provags-ID: V03:K1:QgrpukbS9/861HLvL7OQILhHVK5A/VU34XYAV09yNcKFHkOruMd
 ePbxfevi1hm5yjRMgdycFII4qhSehF/5h1YeIFAlDQYgmaQkUJeLBIaErYon0ZY1/sTYVFR
 v6eJZW3ObiXi62kH8pZwFXjb8Hq2XZ0qdaUy61sH+QAt3B59wRGB5TFjKfr47122t+NbWmV
 rDutav9AR47zOGhilOyEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7O4SEWQK1NY=;Byda2qwVYe7l+AN91l1+og1V8YS
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14900-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 825C0642697

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 17:24:10 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/mips/kernel/proc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 8f0a0001540c..fdf659a8bb3d 100644
=2D-- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -274,10 +274,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " mm_sysad");
 	if (cpu_has_mm_full)
 		seq_puts(m, " mm_full");
-	seq_puts(m, "\n");
=20
-	seq_printf(m, "shadow register sets\t: %d\n",
-		      cpu_data[n].srsets);
+	seq_printf(m, "\nshadow register sets\t: %d\n", cpu_data[n].srsets);
 	seq_printf(m, "kscratch registers\t: %d\n",
 		      hweight8(cpu_data[n].kscratch_mask));
 	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
=2D-=20
2.54.0


