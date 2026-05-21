Return-Path: <linux-mips+bounces-14666-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOswDhusDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14666-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:54:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043059FB99
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D190304A85F
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EC8395AE5;
	Thu, 21 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fboL8oE6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L5KQBoR7"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55D2BE034;
	Thu, 21 May 2026 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346403; cv=none; b=JBQL4rM7UBGwyE4jzIbL8iRvcUZXI6no0S86xjv8LHF3AYK9ccWSWrRsQzuoE7WxOIsTWsYwhws1reGQdGLZ70pqpLzzl7IjtHaY44dS4EcfKq7f42o+3t7xFdiN1pHebzM6cuMzpPBlhSed893vMVouz40Z2NuvQooCjl1sWbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346403; c=relaxed/simple;
	bh=yTmG4kpTX3BSV2NvGKW4yDvxCLXU/0LeZ6467ssf/sI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qLj5P/q3WUYzKI0lwOdTDwtQ3qWho45d/GCGaic4+j4u0QCbLmhpfU5XxuGhCQrN25wKWA+4mseZ3ofONxXOYdHHpgFI5jVYCYNehennnnqNgX0pW+CrEi2fQOVNUyDhRi2YzBlWDQ82i4/G1HrXfSg+C9nxXRZe4RdfvDAhg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fboL8oE6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L5KQBoR7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JphOcis7jLuwvBLQATLEreR0iKin89W8Yeqx09Ok2A=;
	b=fboL8oE64RQ/AwEQ11s/m3R7y9BAb2ntRhL1YAhNGbq/Ctl3F+i6SU7ODMB+W/K0QEDnQ1
	OAK54O+6qIxkY8aMfSnhNdaNW2e/litgZK0arbTz0b4NB0Ym7Xr7O8h3A3kaXhXfh7va+O
	+Z1k73NvtRJsh+2xgHGmTS9UAhTEBLMw/dmfGBj/8hYpqxPm9kJe1HNSM3DC/aDyR0OyzK
	GBgR4o0cDvXYVkvmGxbMK8R9GWQWde/V4JO7Zk33oxdIwNmdXRubgzSNzJOTOsPjr0vsiB
	AdlHKLlavDjllw05/5BJWLULlxQuLPEavLJFXfahM0bCCWVwUkoK11a5oXzYeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JphOcis7jLuwvBLQATLEreR0iKin89W8Yeqx09Ok2A=;
	b=L5KQBoR7uFhTyGCHus/UlGnYpUPoAPNVoanUcfMpsRDwlaoUG1sUOduWKkitCvB8O3C9FC
	jLYHcTQlDEsPqYCg==
Subject: [PATCH 0/9] MIPS: VDSO: Clean up vDSO Kconfig
Date: Thu, 21 May 2026 08:53:14 +0200
Message-Id: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gbqpyJeRVyoSTWIrTRQBPHuF
 pdvMfOAchRWGIoHIidRCT6jKgtY99lvjELZUJu6M7bqMZEGPOVSPNbgnWxIRK3tm8W6hiF3V2Q
 n9/8cp/f9ALCxeQVjAAAA
X-Change-ID: 20260518-vdso-mips-kconfig-ddd4583b5f3e
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=1924;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yTmG4kpTX3BSV2NvGKW4yDvxCLXU/0LeZ6467ssf/sI=;
 b=whDHl+wJiIEtykUeJITL8YWlssS5m7LcTZmT47Z6ARs/ZTFOtMG0iX7VnzQWiN4+r2PddoQCb
 Vd4KteNiTT6DnMajLb3fj6niolJEYx8nu5O50Qv+H5HcJAn67UV7P8N
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14666-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 9043059FB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MIPS contains multiple different, incomplete methods to disable the
time-related vDSO bits. Unify them and make them work correctly.

This can go through either the vDSO or MIPS tree.
There will be a conflict with one of my other serieses [0].
It is trivial to resolve, remove all instances of GENERIC_TIME_VSYSCALL.

[0] https://lore.kernel.org/lkml/20260519-vdso-generic_time_vsyscal-v1-0-5c2a5905d5f5@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (9):
      MAINTAINERS: Add include/linux/vdso_datastore.h to vDSO block
      vdso/datastore: Always provide symbol declarations
      MIPS: Introduce Kconfig MIPS_GENERIC_GETTIMEOFDAY
      MIPS: VDSO: Only map the data pages when the vDSO is used
      MIPS: csrc-r4k: Only use VDSO_CLOCKMODE_R4K when it is a available
      clocksource/drivers/mips-gic-timer: Only use VDSO_CLOCKMODE_GIC when it is a available
      MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY
      MIPS: VDSO: Gate microMIPS restriction on GCC version
      MIPS: VDSO: Fold MIPS_CLOCK_VSYSCALL into MIPS_GENERIC_GETTIMEOFDAY

 MAINTAINERS                          |  1 +
 arch/mips/Kconfig                    | 19 +++++++++++--------
 arch/mips/kernel/csrc-r4k.c          |  5 ++++-
 arch/mips/kernel/vdso.c              | 12 +++++++-----
 arch/mips/vdso/Kconfig               |  6 ------
 arch/mips/vdso/Makefile              |  7 ++-----
 arch/mips/vdso/vdso.lds.S            |  4 +---
 arch/mips/vdso/vgettimeofday.c       | 20 --------------------
 drivers/clocksource/mips-gic-timer.c |  2 ++
 include/linux/vdso_datastore.h       |  2 +-
 10 files changed, 29 insertions(+), 49 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260518-vdso-mips-kconfig-ddd4583b5f3e

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


