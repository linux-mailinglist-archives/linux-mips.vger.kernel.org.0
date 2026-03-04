Return-Path: <linux-mips+bounces-13341-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNAWNyXkp2nqlQAAu9opvQ
	(envelope-from <linux-mips+bounces-13341-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:49:57 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0B1FBDDD
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 08:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DF23302DF60
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 07:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73212388E4D;
	Wed,  4 Mar 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o3VFk9ts";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CQlRXt4X"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB6387572;
	Wed,  4 Mar 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610558; cv=none; b=dDeqfDNoFQqJ0tIuKb/IveZ9BGX+v8Bv8H2drf7mwvkpH23uEfeLMlB1M79A/IUQ6vfXS1p45H6ngX+TC+gRBDzTAHXox9fdg5JeQWiAdppuqDMnXHBPeyEI8Cx0EYM8+Hb8SdLbdBm7/uZpeRmHi7hk80PXdg7b5kCWxFUyNwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610558; c=relaxed/simple;
	bh=coa1rVPXvvfSKVXCp1hWICCYNOIY9jhKAe9k08Z13m4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tSDO/lHQtkyQkidUxzsHjKVo6G/8ljck/yRkcbLNrFL5kscwVoYiewMrv5uG6g44z4mav0rlhfMYHyI9Zu+aNx95mmna2U/JgWCLtrVKDk9yBfroby+F25hIld6HM36u6TAKHSGDLILwRauwJAO05Z442hLo6I3mllzhFtPsBEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o3VFk9ts; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CQlRXt4X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tExRo9EdJB/0iC9aVc7h/nmkEcGApprYnjO2Gut37XU=;
	b=o3VFk9tsY0/aMCaIuc4w5j5fckonqI0NeQ2OaPUEVz0wvbxECNWJTR+TvcZsXkl2ziILaC
	opdicwcpYJwtXvsHtTpwtl10xe1cTgjgWhY3aouzwPCfBcCcQSG9m9/M5bZGxJ0g+FiRBO
	vvzhiQoENAdN1v2fUx/jBTRx7NVQtmsSSzlUkB4jQTymS+h0mbZldRQa/TwOHh61pveuyw
	yM6wBLtDIuxr8bIzOHARGazYC5nGirsbll4LCewJ6F1CtkvfjFR45nuY5VScT9XxMXXNpe
	NKbKIw5xrbkDWOi5m3xZoM91SwOhUmIXRMj7ukrYTKOPDqVTYDWrfkeBxhiiTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tExRo9EdJB/0iC9aVc7h/nmkEcGApprYnjO2Gut37XU=;
	b=CQlRXt4Xe4r+u9aUimg3wpTf8//0PYh/7nJ3eh1e5EH3GDK90hhYh1Wq7szQXn2HMf4Z3y
	zF1suGnKTfLvjqCA==
Subject: [PATCH v6 00/14] sparc64: vdso: Switch to the generic vDSO library
Date: Wed, 04 Mar 2026 08:48:57 +0100
Message-Id: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTW7DIBAF4KtErEsFw6+z6j2iLgwMCVJlR5CiR
 JHvXhyp9aJm+UZ63+g9ScGcsJDj4Uky1lTSPLWg3w7EX8bpjDSFlgkwUMwA0BrKTMt1zF5Lesa
 p1T0FCioCMmVxAE9a+ZoxpvsLPn22fEnlNufH60/l6/WXlD2ycsooCqNH4QLIwD++0vR9y/OU7
 u8BycpW2CjLVZeCRjkVo2XagJBmjxIbNXDTpUSjhDaD485bRLtHyT+KM94fKNeBTDPjohwCjnu
 U2ijOdJdSjRpMjOC0khD/DVyW5QeQOxuZ7AEAAA==
X-Change-ID: 20250722-vdso-sparc64-generic-2-25f2e058e92c
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=5091;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=coa1rVPXvvfSKVXCp1hWICCYNOIY9jhKAe9k08Z13m4=;
 b=1H28xfAD2yOev2Vntn45b+s1SK9oRczk3lLIF8UfBKz5V9GWLALD82hoRyRbTygmoK8fcOwwj
 u+6aLBOPdaYBTLMN8AdpKgc/jYxHLZZSuJ8YVqDQNA3yoqv/LM3Gquk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 6DE0B1FBDDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13341-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Action: no action

The generic vDSO provides a lot common functionality shared between
different architectures. SPARC is the last architecture not using it,
preventing some necessary code cleanup.

Make use of the generic infrastructure.

Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/

SPARC64 can not map .bss into userspace, so the vDSO datapages are
switched over to be allocated dynamically.

Tested on a Niagara T4 and QEMU.

This has emantic conflicts with
* "vdso: Reject absolute relocations during build" [0]
* "vDSO: Respect COMPAT_32BIT_TIME" [1]

But I expect both other serieses to need more discussions.

[0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/
[1] https://lore.kernel.org/lkml/20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v6:
- Provide statically allocated during early boot to avoid canges to the rng core
- Use non-compound data pages
- Reword commit messages
- Rebase on v7.0-rc1
- Link to v5: https://lore.kernel.org/r/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de

Changes in v5:
- Merge the patches for 'struct page' mapping and dynamic allocation
- Zero out newly-allocated data pages
- Pick up review tags
- Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de

Changes in v4:
- Rebase on v6.18-rc1.
- Keep inclusion of asm/clocksource.h from linux/clocksource.h
- Reword description of "s390/time: Set up vDSO datapage later"
- Link to v3: https://lore.kernel.org/r/20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de

Changes in v3:
- Allocate vDSO data pages dynamically (and lots of preparations for that)
- Drop clock_getres()
- Fix 32bit clock_gettime() syscall fallback
- Link to v2: https://lore.kernel.org/r/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de

Changes in v2:
- Rebase on v6.17-rc1
- Drop RFC state
- Fix typo in commit message
- Drop duplicate 'select GENERIC_TIME_VSYSCALL'
- Merge "sparc64: time: Remove architecture-specific clocksource data" into the
  main conversion patch. It violated the check in __clocksource_register_scale()
- Link to v1: https://lore.kernel.org/r/20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1@linutronix.de

---
Arnd Bergmann (1):
      clocksource: remove ARCH_CLOCKSOURCE_DATA

Thomas Weißschuh (13):
      vdso/datastore: Reduce scope of some variables in vvar_fault()
      vdso/datastore: Drop inclusion of linux/mmap_lock.h
      vdso/datastore: Allocate data pages dynamically
      sparc64: vdso: Link with -z noexecstack
      sparc64: vdso: Remove obsolete "fake section table" reservation
      sparc64: vdso: Replace code patching with runtime conditional
      sparc64: vdso: Move hardware counter read into header
      sparc64: vdso: Move syscall fallbacks into header
      sparc64: vdso: Introduce vdso/processor.h
      sparc64: vdso: Switch to the generic vDSO library
      sparc64: vdso2c: Drop sym_vvar_start handling
      sparc64: vdso2c: Remove symbol handling
      sparc64: vdso: Implement clock_gettime64()

 arch/sparc/Kconfig                         |   3 +-
 arch/sparc/include/asm/clocksource.h       |   9 -
 arch/sparc/include/asm/processor.h         |   3 +
 arch/sparc/include/asm/processor_32.h      |   2 -
 arch/sparc/include/asm/processor_64.h      |  25 --
 arch/sparc/include/asm/vdso.h              |   2 -
 arch/sparc/include/asm/vdso/clocksource.h  |  10 +
 arch/sparc/include/asm/vdso/gettimeofday.h | 184 ++++++++++++++
 arch/sparc/include/asm/vdso/processor.h    |  41 ++++
 arch/sparc/include/asm/vdso/vsyscall.h     |  10 +
 arch/sparc/include/asm/vvar.h              |  75 ------
 arch/sparc/kernel/Makefile                 |   1 -
 arch/sparc/kernel/time_64.c                |   6 +-
 arch/sparc/kernel/vdso.c                   |  69 ------
 arch/sparc/vdso/Makefile                   |   8 +-
 arch/sparc/vdso/vclock_gettime.c           | 380 ++---------------------------
 arch/sparc/vdso/vdso-layout.lds.S          |  26 +-
 arch/sparc/vdso/vdso.lds.S                 |   2 -
 arch/sparc/vdso/vdso2c.c                   |  24 --
 arch/sparc/vdso/vdso2c.h                   |  45 +---
 arch/sparc/vdso/vdso32/vdso32.lds.S        |   4 +-
 arch/sparc/vdso/vma.c                      | 274 ++-------------------
 include/linux/clocksource.h                |   6 +-
 include/linux/vdso_datastore.h             |   6 +
 init/main.c                                |   2 +
 kernel/time/Kconfig                        |   4 -
 lib/vdso/datastore.c                       |  97 +++++---
 27 files changed, 375 insertions(+), 943 deletions(-)
---
base-commit: f02e02079ac56b44ff89d4c2189cf7185ab794f3
change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


