Return-Path: <linux-mips+bounces-13981-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ15IPZcyGnAkwUAu9opvQ
	(envelope-from <linux-mips+bounces-13981-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 23:57:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5F3502A1
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 23:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 607BE3008CA3
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 22:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A02733E358;
	Sat, 28 Mar 2026 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="jj3DKwIY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [157.180.15.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A639FCE;
	Sat, 28 Mar 2026 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.15.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738672; cv=none; b=LK+B03MMovYQhStFK/pV31HVqJYJrMlGaTPXOVFp3iCJt4IjhimeJjS4HTQc8phNgv755FH//3FxC4+BJIfVP6bQPk5U0Uh3RPiui6cc5cI9Joxkd6PYHbKAaEL8EAAIcMeaNqnGftddwQ9n4ZQl2JPxMUXbBfVMeZGPErxWkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738672; c=relaxed/simple;
	bh=PNu7Xdx59gcmUUPzwlcBT1ijOPEJXCY1cQFEGqFTNVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jENM/Q+9t/j4t7x6L111mlJzwE4BKRW9NKmbAG6MEtMsK17mvedSuT/rmfg1CGREL73avrkpy7e/PqJSjAfc8TwD7tzYfCAUXBkI9TqMuGWJc6sIH3QYFNyJykM36u1ho86Mi4hWtvlJ5Vsn6Dpoz0uAzEpzpoBS7C44MGIfVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=jj3DKwIY; arc=none smtp.client-ip=157.180.15.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id CD6781C00C1;
	Sat, 28 Mar 2026 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1774738665; bh=lNeJDM+mYstoZjlzf26cFMKgMa03rhGm2RloGU6C660=;
	h=From:To:Cc:Subject:Date:From;
	b=jj3DKwIYbaIYxEI9mDLjbk5nVsTAUD27D5lQC2sfeQ4fKh8QfQxrHcTAuOf13GIYN
	 vFONbxRVE6pGbaLq415dsl/m6a/TVmvrehsqG7f5mMnUdhdtNR/i56swOVbikm3n3U
	 gRo6miTALE0L9MXbdOFaHoNkoABjm/MkT1LCvfZtXZXo4PK5ekvTzZxlGTBHbUou7V
	 4NO15fKqdbuipjz2779AQMIpS7uNaNlITmBOT5gD2eBZHv34tGRcPpHUIbE5ifrFwN
	 OtWiocs6QeX5cjR8aiAZWLd7FejPiYnoTSRY1LXr4oMEv2eTJz4eJECcF6r/iuQv61
	 T+CfCmjGBSEEguA5XBa4YYaIRsbGTPmrw8FKOozgBToLTidOchJJGWUeEMmePktUGx
	 f7L9eey/x1CFlZz516uWU6KgnbnEreAogJyTpmh/jrkyeeYK93F7/9kRSQhdTOnzVx
	 SOCgngXlSQva1d7HmO0JF01fiEAxZk8j1Y+o8KrvC1RUfAdyf1PBJaIVSpmkaZr7RJ
	 xTRV8AyvYakilh3J3zQFeJ8xSWBEeROK2IQbJXG9n0Y6Y5mykYsetWOMiVjCOTy8UE
	 PLHPhCRFDgYxikF4V2PS0/yKwF1AXWhaIuv1psdah4AK6IAP22705pQSE9tD1hHLlG
	 CVy0Lmfql3WU13DB8BhumTWA=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Z2-EqT-5Mjpu; Sat, 28 Mar 2026 22:57:42 +0000 (UTC)
Received: from xtexx.eu.org (139-162-51-66.ip.linodeusercontent.com [139.162.51.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 28 Mar 2026 22:57:41 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Kees Cook <kees@kernel.org>,
	Matt Redfearn <matt.redfearn@mips.com>
Cc: Yao Zi <me@ziyao.cc>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bingwu Zhang <xtex@astrafall.org>
Subject: [PATCH] MIPS: Increase default mmap randomization bits for 64-bit
Date: Sun, 29 Mar 2026 06:57:39 +0800
Message-ID: <20260328225738.51613-2-xtex@envs.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1774738658; l=2031; i=xtex@astrafall.org; h=from:subject; bh=VuMFJKI0P3uomhHFxDMcv0oVHwd9fCVI2yDYakie94Q=; b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgL1erbbl1jNM9AtzeLFJ5FKVqr/ylJ MBUj5+W9IwwCl4AAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA QDMbhoCO6nUj6boAEwu2kZa3mAWpE7xvfrcHaaE4jSi+sMvaG82V4Jp18FUBBqWh2O3HgaX2TsQ xFV08DrU5Uwo=
X-Developer-Key: i=xtex@astrafall.org; a=openssh; fpr=SHA256:IEYEjkZlkUTr5U9GiDAmZU/4eZus2t2RsxusyhQqwao
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[envs.net,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[envs.net:s=modoboa];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13981-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xtex@envs.net,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[envs.net:+];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 77D5F3502A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bingwu Zhang <xtex@astrafall.org>

Increase mmap randomization bits on 64-bit from [12,18] to [18,20] for
better strength.

The original default, 12, means that ASLR offset has only (1 << 12) =
4096 possibilities. On average, it can be brute-forced in 2048 attempts.
If a service is configured to restart automatically or can be started
easily (e.g. execve a suid program), then trying for 4k times can be
done in one day even when each attempt takes 20s.
Increasing it to 18 makes brute-force much more difficult and leaves
more time for operators to find out attacks.

On 64-bit platforms, virtual address space is cheap, so the
randomization bits can be increased safely without disturbing userland.

In 1091458d09e1 ("MIPS: Randomize mmap if randomize_va_space is set")
where mmap randomization was first introduced to MIPS, the randomization
range was 256 MiB, equivalent to 16 randomization bits (if 4K page size).
In 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
where MIPS begin to use ARCH_MMAP_RND_BITS, commit message claimed:
> The minimum(default) for 64bit is 12bits, again with 4k
> pagesize this is the same as the current 256MB.
which is incorrect. (1 << 12) * page_size is 256 MiB only when page size
is 64 KiB, so the strength of mmap randomization was reduced by 4b.

Fixes: 109c32ffd89d ("MIPS: Add support for ARCH_MMAP_RND_{COMPAT_}BITS")
Signed-off-by: Bingwu Zhang <xtex@astrafall.org>
---
 arch/mips/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e48b62b4dc48..c630dab44419 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3063,11 +3063,11 @@ config MMU
 	default y
 
 config ARCH_MMAP_RND_BITS_MIN
-	default 12 if 64BIT
-	default 8
-
-config ARCH_MMAP_RND_BITS_MAX
 	default 18 if 64BIT
+	default 8
+
+config ARCH_MMAP_RND_BITS_MAX
+	default 20 if 64BIT
 	default 15
 
 config ARCH_MMAP_RND_COMPAT_BITS_MIN

base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
-- 
2.52.0


