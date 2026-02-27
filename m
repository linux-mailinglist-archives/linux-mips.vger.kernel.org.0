Return-Path: <linux-mips+bounces-13255-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIgHNGM9oWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13255-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:44:51 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC731B360E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 07:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92EB53063AEB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8443D902B;
	Fri, 27 Feb 2026 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M85pSVFQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R9NsRIvi"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3533D37AA72;
	Fri, 27 Feb 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174685; cv=none; b=eBnclnsyAlJeVaevXc4yYhNx+rDt+FES0ah4+X0R1MNRsHRDgXrYD2ZlQGfxQTikiJJJguf9gRBwhN4HQu4GaujaW5kMKyLzNUSkXe/vyxfePzLlDX1o2Chq9VJqO/mVixyeuPA+CEvu7WHD+J/WmYqI3z5rBhs+q6DjtHpvUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174685; c=relaxed/simple;
	bh=zI4WNBxKE1oqYDsbwbv7mmrObw8MTsILZFRv4cugSQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eLJbh5v0so1EULqJ0i+SJd+HO9C4q9wBCEFyRK+m9TkEadRl0L9O/TROMFpnjbuIexZP730AVeD+IUOpSFUWUDqAGRlRyS2FwjbC6P6g9WbLZc9oh6MAzqhhPQa42eS1Ern3+Vhy6++FNEOKOlC324glRL1jRuhWhD5kOtRcm+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M85pSVFQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R9NsRIvi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=M85pSVFQdCyhtVthb4y3GdgjGae2qjnUR2acQJS/2Lz6ZG5gaWw+wfjB40Qze/eavODE6u
	ZfIOjPPAKbm/OV+pNLogLSoSIMlSVrz9xk3cG8Es+YowNSoTyYvmK54lERaBho6Q/4qFL7
	j3dkg3kLv/Zic3xdbtAZIb7YfyFPFZ4gFIjbhRWxNire+kIhHbIfkn46ylr6pUDvC/Wi0W
	gRt8oFP6BdPOVzyr9fOLDwhMxbuFtRE4r2Cr8ro0jk7B0RRAL7J8LFzRpkXfTe2pf65uvS
	e6oAGaRbMoZIVglqn6olNqsRL68TX3BO9O0dq7tWIDGmB3rU74bwh3khDIbIpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJvj9oQFQeeMCbDd+GICAEc7FTw0NbC/VPhyAd1JJKo=;
	b=R9NsRIviSPQjcWSg0uQHOs18QhYxOdO58Gzs91l8uNso2iAl21Qya8XrkfoOaM4mLlsg/r
	y1Jn/BdTjCVaUCCA==
Subject: [PATCH v2 00/15] vDSO: header file cleanups
Date: Fri, 27 Feb 2026 07:44:26 +0100
Message-Id: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2IiAr72FYFDrYSUhLWmgwh
 LtbuYDL95L//g6RAlOEttghUOLI3mVQlwIGq92bkE1mUEJVQsoSk4keLWlDAYeJtFvniEaNWlX
 1vSEykKdzoJG3M/vqMluOiw+f8yXJn/0TTBIFNuLWN4LoUfflc2K3LsE73q6GoDuO4wvZQ+Q/v
 AAAAA==
X-Change-ID: 20260114-vdso-header-cleanups-d2fa26758eed
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=2786;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zI4WNBxKE1oqYDsbwbv7mmrObw8MTsILZFRv4cugSQ8=;
 b=erC3nB1DKmuQs15OOkp3AAhmZKYK9eudzE8BP0VU2g3116caadMiZY0nDvfbDDgVCnj/hub0/
 Uaq1gn9VKGWAp3F6pRbxoqspNNYnUpIHkC4zAS+KyqX4uXIR65801d1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13255-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EC731B360E
X-Rspamd-Action: no action

The vDSO header files are a bit of a mess, relying on transitive
includes and pulling in much more definitions than necessary.

Clean up the headers and remove some ifdeffery in the rng core.

This was originally part of my SPARC generic vDSO patch series [0].
After feedback I am reworking that series and it may not require these
cleanups anymore. But as the code is already written I am submitting it
here standalone.

Based on tip/timers/vdso.

[0] https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de

---
Thomas Weißschuh (15):
      arm64: vDSO: gettimeofday: Explicitly include vdso/clocksource.h
      arm64: vDSO: compat_gettimeofday: Add explicit includes
      ARM: vdso: gettimeofday: Add explicit includes
      powerpc/vdso/gettimeofday: Explicitly include vdso/time32.h
      powerpc/vdso: Explicitly include asm/cputable.h and asm/feature-fixups.h
      LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
      MIPS: vdso: Add include guard to asm/vdso/vdso.h
      MIPS: vdso: Explicitly include asm/vdso/vdso.h
      random: vDSO: add explicit includes
      vdso/gettimeofday: Add explicit includes
      vdso/helpers: Explicitly include vdso/processor.h
      vdso/datapage: Remove inclusion of gettimeofday.h
      vdso/datapage: Trim down unnecessary includes
      random: vDSO: trim vDSO includes
      random: vDSO: remove ifdeffery

 arch/arm/include/asm/vdso/gettimeofday.h          |  2 ++
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  3 +++
 arch/arm64/include/asm/vdso/gettimeofday.h        |  2 ++
 arch/loongarch/kernel/process.c                   |  1 +
 arch/loongarch/kernel/vdso.c                      |  1 +
 arch/mips/include/asm/vdso/vdso.h                 |  5 +++++
 arch/mips/kernel/vdso.c                           |  1 +
 arch/powerpc/include/asm/vdso/gettimeofday.h      |  1 +
 arch/powerpc/include/asm/vdso/processor.h         |  3 +++
 drivers/char/random.c                             | 16 ++++++----------
 include/vdso/datapage.h                           | 23 ++---------------------
 include/vdso/helpers.h                            |  1 +
 lib/vdso/getrandom.c                              |  3 +++
 lib/vdso/gettimeofday.c                           | 17 +++++++++++++++++
 14 files changed, 48 insertions(+), 31 deletions(-)
---
base-commit: 375f574d703d3af5174d6357d3ca8990bd4a1e42
change-id: 20260114-vdso-header-cleanups-d2fa26758eed

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


