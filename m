Return-Path: <linux-mips+bounces-14899-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GKQAAoi5IWqJMgEAu9opvQ
	(envelope-from <linux-mips+bounces-14899-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:44:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465E6425F4
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 19:44:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=KYeKtaPm;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14899-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14899-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 799CA30073D3
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 17:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8091F4C6F1B;
	Thu,  4 Jun 2026 17:44:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843EF4A2E24;
	Thu,  4 Jun 2026 17:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595077; cv=none; b=bCTSP+GPNXyc5spadq3SvAcwz4Swm+TkFf+5scqqRe2+T4oNJwXkswnTCR/y787NOWMUUEQg4JTCNa5mN8BRhOSxqvIEGcjA3MkkjdE95V2JJcNkvJjn01TaCEvveDZiSM2bUlBxrqAeuleLTpXvpe1FPrjB4+qXCiet/mTwSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595077; c=relaxed/simple;
	bh=m8px+IwOqOf2CyP4hcwavD4lNRus7BToghnvILwDNCQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=EOsFxDrQxcCwoDqdvh3JPGfZEbRpd2H/X8zkbU527x+rWG+txcMgt4iV+UgtOM4qrGXdow91HRip9HhhyqvTZUI++A0uN5lNdk22WIjw2kdlRGtIZGeD8WB9uNdSTno7PJ71xS++4pa5EEPwX3WR6HuJ6jIp5opk7FySkDpNzaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KYeKtaPm; arc=none smtp.client-ip=212.227.17.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780595073; x=1781199873; i=markus.elfring@web.de;
	bh=acNsc6l/pe22FbmAO0LmDYLq+gJSAR5NoG2io/CM/Xo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KYeKtaPmttJo9GdLqToeK1rI6efQCgJVOsWOm83y3asntxD9bsJ7oioZe6QEFwKK
	 s/hU+jdclMkzN3IKYvCUQci0ttNmxeOua7vwV8E5ezEDw3GRqlNmF9ricvAez5HZk
	 JzGEKh/tZMa+2vFKwCoaEABXvd1cQon2spBQ+gAP8xug9uqAVRECp+SylD2uNL4yj
	 bX2pubjXhYhFZW+u3vmazPZ3Xq3S2IJUVlqdauFIvkwyOEWpgWgaDMJfydjqrTWXS
	 khuKNH0i9ilRbJR97RjgxcZMug2iiAkwJXvLbDvi4GJjILhkBfty7gWSYIT89Jlyc
	 qeeOSNLPQG15JLqGXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MaHWx-1wjEuK2bjB-00O7O0; Thu, 04
 Jun 2026 19:44:33 +0200
Message-ID: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
Date: Thu, 4 Jun 2026 19:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mips@vger.kernel.org, =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?=
 <tsbogend@alpha.franken.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/4] MIPS: kernel: proc: More efficient data output in
 show_cpuinfo()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BPksMcBbhZxHdJqy3liqoORiy8FXYDdOSe4CHTX2VMb6nNBN6lI
 BcZaQz66OIjOP/0mkqblbsl3mthBrupj4fD5dfH88noih3DusGJHjgKpxbOKQEENADqWCoe
 7xeOwJ2pB3EiGxD3YwTUxBv+R4msUI0FEaFEhQs7qCAe9r6tiTde9In0Gmy0ouMgeySbUW0
 ug42bEGke+DaSu/H5yYAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bn+S+vWEw3U=;KRmAdNSkXQRUyAJ25oUsg8lbAa6
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
	TAGGED_FROM(0.00)[bounces-14899-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7465E6425F4

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 19:33:55 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Simplify data output
  Combine two seq_puts() calls
  Use seq_putc() calls
  Delete unnecessary braces

 arch/mips/kernel/proc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

=2D-=20
2.54.0


