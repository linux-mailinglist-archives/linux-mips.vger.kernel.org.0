Return-Path: <linux-mips+bounces-13923-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ5UC43JwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13923-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:27:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350A319FFC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14DDE3071AED
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCAF407572;
	Tue, 24 Mar 2026 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZgAj9cfl"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A973FEB01;
	Tue, 24 Mar 2026 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372615; cv=none; b=G+8PtNtTEsfbHPmRWC5wMw6G/RD/IhE9UMGnwqvKu/fhEHqiPaJUomLZqjMH9QXEQhuHlkbc7vBLGT7EwCwMwTHBllvDWGdIXsmpCSbDT3a4E04yS+eRjfrWXq6keah5Y69uuJlJCYGtR74j8yht27b2Otejy5rUSw1MBWDtr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372615; c=relaxed/simple;
	bh=sVe9WgjkD5UnEghpp5kXIoL4zB3qrw9OGrMSEjhy8bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXY4zZkJufxAgo/tDkIsCKiXDnwy0AJjdd74UtIXWsnDzjYp+MVx253/+mx8f6desEo4fuX7qBY0Z8G20bUVmL18R7UnjQJyfdh4GqTo8tnm6xlumTcvZIBrd/RVp8K5+5gjTX0n03blhsCtfdZbe139AInqWngfuFhAPA6rQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZgAj9cfl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774372611;
	bh=sVe9WgjkD5UnEghpp5kXIoL4zB3qrw9OGrMSEjhy8bo=;
	h=From:Subject:Date:To:Cc:From;
	b=ZgAj9cflFm/ooqqtYFqiNdSyb2+Ljt5FFIHLch7X3BxXcrFLJz4myCXzazb1Ioctx
	 c/NPNyDb8IUN9ma5KoaPDCrBloFkHHZEJ9alNITEUBrrVPsooj3qWT2QUMOU8b82E1
	 0MfKlYPFCb1JiM61h76JPN+Ye2zA98dFysqSNT5s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] checksyscalls: only run when necessary
Date: Tue, 24 Mar 2026 18:16:44 +0100
Message-Id: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf8Xs2ZrSAqIn/8NwoO1KN2IxXUAJ4
 d+tePb4JjNvFmCMhAzn3QIRJ2LqQwK134H1TWhRkEsMSqpSqkyJuxmpc+JBzBRawTPbputYoFa
 VQ21zU+SQ1s+IN3pv5mud2BMPfZy3oyn7pj+nlvqvc8qEFNrkrjyZsrLH4vLC1GHrR38IOEC9r
 usHg6t6i8MAAAA=
X-Change-ID: 20260212-kbuild-missing-syscalls-e328de3c4b54
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774372608; l=977;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sVe9WgjkD5UnEghpp5kXIoL4zB3qrw9OGrMSEjhy8bo=;
 b=6wYhoPfWgmJbgbPbq9xbvGKA0W1lRrhWqqG2D4zreLAqb8uqzIhAy2Yd9JKNeKjQ9QQdJn1/N
 JQJu2HBJxzODehOC7yhHfFa+woxOMXXCp5yaC6HGgcfFkDX2Ss6C/RL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13923-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,checksyscalls.sh:url,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: 2350A319FFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently checksyscalls.sh is unconditionally executed during each build.
Most of these executions are unnecessary.

Only run checksyscalls.sh if one of its inputs have changed.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Also send to kbuild maintainers
- Link to v1: https://patch.msgid.link/20260303-kbuild-missing-syscalls-v1-0-3b4d69b68c75@weissschuh.net

---
Thomas Weißschuh (3):
      checksyscalls: move path to reference table to a variable
      checksyscalls: only run when necessary
      checksyscalls: move instance functionality into generic code

 Kbuild                   | 14 ++++++++++----
 arch/mips/Makefile       |  6 ++----
 scripts/checksyscalls.sh |  9 ++++++++-
 3 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260212-kbuild-missing-syscalls-e328de3c4b54

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


