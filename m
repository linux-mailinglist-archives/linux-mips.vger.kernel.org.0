Return-Path: <linux-mips+bounces-13270-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IxDM3BAoWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13270-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:57:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C91B3912
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F752301A3A2
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFD538A73A;
	Fri, 27 Feb 2026 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H4o7ORTn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gOAq0G/C"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C9259CA9;
	Fri, 27 Feb 2026 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175469; cv=none; b=hsGMJtYfbZVm5gq1D6rLIF6xxilbA9jhvsquV4MAi+Buwq9lkoFpfiTvgthl/hkRcbhY5JYfk5x8eSiNmQ1aSMBu8Lb9L4bpq4siZWW+Gyru6KCRNdwp5cN7y1aAmFjCjunqOHo9jP2em1eipmj5vpVZafrr5aGfz+2Jjzy0kls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175469; c=relaxed/simple;
	bh=j+10mN0yr2XgOejP9mFbnsE8FfQujsP1mq/LotWdhto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cpGORFEiblEQiyo7HbJRxuzOejXE3OUWRD6oZOeP/8j1F+szhFo34REhFyx9/8N0Hv5IShfzwxdUC4z0qtt0F0wF3lV7k9VokWsX2Bg/etEQdNgyb7uE4tGodVviLaw8Tb9wiWPIS8ScLlS+2lSS3xS+/kx7ptU1CXhQmel+WpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H4o7ORTn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gOAq0G/C; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=H4o7ORTn4JvG+PVTnYpO0/oTgdZCJbwVt4425etjg8+5ole07xXCVfxDm7D5LGyIHgoBJx
	8NwMkH71P64oXxvqvHLZB+IND37Jq3yby+W4GswDpz7bHdPKCez33/1zzxosn/+0pinBkm
	X7Yo9UMR4Vv0MfeCsSwufKeBILZtlkEgMVdYUbInPIWcpTl7UPQfgtO+RpsiiUy7r+2O4y
	++fQbI9BcasRK1a65vijBTiUpgA5nuY2eYltLq2LS2SOlWhynNISJ+i8/Wm4kqSqPLV9jT
	vpwtDuAp08YVymX36aLS9EWtu6mZVL9Q8F70pw/L9Ch47fljYATqIzqrE6JI3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HtbZMuKPuZ/Q8N4tWs6O3IZMokrlUXoSJAG1PhFcJgY=;
	b=gOAq0G/CQ3E3pUMxzw8fM3TjOLd6FY02Gw7eezax8KZlsADL9RmM590a28hE1bUpjrjYNl
	zytu7ftaESwuGKAA==
Subject: [PATCH 0/7] vDSO: Respect COMPAT_32BIT_TIME
Date: Fri, 27 Feb 2026 07:57:39 +0100
Message-Id: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBP8AbOuEhFWU83CDBUJorsnL
 b/Few8kjIQJevZAxEKJwlkhGwbL4c4dOa3VoIQyQkrNy5oCX4K/XJ60milPmTxytMK2RmPXGgc
 1viJudP/jYXzfD3yh3uRoAAAA
X-Change-ID: 20260113-vdso-compat_32bit_time-e808763e976a
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=j+10mN0yr2XgOejP9mFbnsE8FfQujsP1mq/LotWdhto=;
 b=4qjwQGnBsBfZe0LjYUORov+hgkDQzer/ymRhbE91DQX1XPZRWzaKFR4++0Fr1RMsBbxUveStm
 UAm3S7SwNMvA4AnLvQRE43aBQhvrPLsa/92l8LBwRdO3MAbzufbbm2f
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13270-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 567C91B3912
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

I also tried to introduce some helpers to avoid much of the ifdeffery,
but due to the high variance in the architecture-specific glue code
these would need to handle they ended up being worse than the current
proposal.

As a side-effect this will make the self-tests more reliable,
as there is now always a matching syscall available for each vDSO function.

clock_gettime_time64() was only introduced in v6.19, so libc implementations
are likely not using it yet.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      x86/vdso: Respect COMPAT_32BIT_TIME
      ARM: VDSO: Respect COMPAT_32BIT_TIME
      arm64: vdso32: Respect COMPAT_32BIT_TIME
      powerpc/vdso: Respect COMPAT_32BIT_TIME
      MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
      MIPS: VDSO: Respect COMPAT_32BIT_TIME
      vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions

 arch/arm/vdso/vdso.lds.S                    |  4 +++-
 arch/arm/vdso/vgettimeofday.c               | 14 ++++++------
 arch/arm64/kernel/vdso32/vdso.lds.S         |  4 +++-
 arch/arm64/kernel/vdso32/vgettimeofday.c    | 14 ++++++------
 arch/mips/Kconfig                           |  3 ---
 arch/mips/vdso/vdso.lds.S                   |  6 +++---
 arch/mips/vdso/vgettimeofday.c              | 33 +++++++----------------------
 arch/powerpc/kernel/vdso/gettimeofday.S     |  6 ++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S       | 10 +++++----
 arch/powerpc/kernel/vdso/vgettimeofday.c    | 16 ++++++++------
 arch/x86/entry/vdso/common/vclock_gettime.c | 20 ++++++++++-------
 arch/x86/entry/vdso/vdso32/vdso32.lds.S     |  4 +++-
 lib/vdso/gettimeofday.c                     |  8 +++++++
 13 files changed, 78 insertions(+), 64 deletions(-)
---
base-commit: 328b128e8fe2ae981900c1f38b3b9c75c586455e
change-id: 20260113-vdso-compat_32bit_time-e808763e976a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


