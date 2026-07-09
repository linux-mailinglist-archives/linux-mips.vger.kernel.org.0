Return-Path: <linux-mips+bounces-15700-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6+ajGouHT2p/iwIAu9opvQ
	(envelope-from <linux-mips+bounces-15700-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:35:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F27306AE
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=giBxjz3T;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=dhUA7ErG;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15700-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15700-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 222783026AFA
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A9D41C2E2;
	Thu,  9 Jul 2026 11:32:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468441C2E1;
	Thu,  9 Jul 2026 11:32:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596763; cv=none; b=WnRBlFp44/ZxzYB+AJ3WMHQL+4yq0NfDLwLA0s/XS9tdjmo+SpwXiCXjk9AgPy8rvp4Bp0Vh/tALxqEJYlO2hP0yBTS6cJ2ev/5gylDOHB8d032P9FYyEQEJvIFj/PCh9HpTMB67Q0Nm5ouEzXtkgckGYjIuFqzOyj3f7GLwjDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596763; c=relaxed/simple;
	bh=bd62m/ysnHtkfVSUaGn+V8oLxmFUlxg59T9FJQBkVtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zf9zaCm8tkXIr1tI+7l3PTG5YwpYobrc+DNX/m2WEDwjOBEiBN76ObRV+BMZgITpp+fa8bQkFGmSIwcONJFXbhUVUA50df/cv7B6WVL+QqM8tY9skse4JdXohVZFWgbi2nFVBtwdK4ftszpOtdKocQEvL1W2XHdAcwq2BaSmSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=giBxjz3T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dhUA7ErG; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=giBxjz3T0P2S6MQBaE7q0V1Y+P8GtU/83OH5yvA/IJYRF6rEaZNH72uhWRmoHYQPBvSeaM
	aYnR4r1jdyxlKCtHofIYIu21ZYJGKVw0zu+eZEOXrVSQ4jqcThtvVq/2UTbCrBN/YEV7Tq
	5tFNpsN0J1iSkT07jP/gg2PBJPINWCi3E3tnw+Fa9V9beR+M/vw5jMh1JmIJ1HAhyEjrfH
	hpRUEFeMrvg4MVEEMmBLkDNRDEghr9gcOcOvOWEXIrt33Fhbgz7NP8tocFyKQBWNFVbmLa
	pbX1QoRmmZ62rssps6gM9ElrjWLJL8LCmFPjAHg1v8EZF9vB/RLuN7DuE5bxiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=dhUA7ErG68WNBRzhRd+NtTZFYpT3et+sDudNK/W2f5/GDKNvhVYhhGh6UArQIQUKejGRLk
	3THQK4lIsGB1LlCg==
Subject: [PATCH 0/7] vDSO: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
 with IS_ENABLED()
Date: Thu, 09 Jul 2026 13:32:36 +0200
Message-Id: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZqUVGvMrioaarBGTs0UATx7
 haXb/H/BcpJWGGqLkicRSUeBU1dAW3uWBnFF4M1tje96TB7jegSbUjfSPsvelZcArkwOktDO0B
 J/4mDnO/2M9/3Ayijr3NmAAAA
X-Change-ID: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bd62m/ysnHtkfVSUaGn+V8oLxmFUlxg59T9FJQBkVtY=;
 b=v0PUn23gIRlT3wMLw6uvxNhG8MDsFLklGKvI5FMtQ09FTJRHMHBj0/elS9bs0Z3CEgLqrSM8/
 LBkRruGlMC/DM32fLjupE7GsD6pdIWQ+TzzZgMOdIZkoEhk+dyQS3TE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:tsbogend@alpha.franken.de,m:daniel.lezcano@kernel.org,m:mark.rutland@arm.com,m:maz@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:linux-arch@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-15700-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 078F27306AE

Provide dummy declarations of the VDSO_CLOCKMODE_* constants and use
those to replace some ugly ifdeffery with cleaner IS_ENABLED() checks.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (7):
      kbuild: support generated asm-headers in subdirectories
      vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
      MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/mips-gic-timer: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/arm_arch_timer: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      clocksource/drivers/timer-riscv: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
      LoongArch: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()

 arch/loongarch/kernel/time.c           |  5 ++---
 arch/mips/kernel/csrc-r4k.c            |  4 +---
 drivers/clocksource/arm_arch_timer.c   |  7 ++-----
 drivers/clocksource/mips-gic-timer.c   |  5 ++---
 drivers/clocksource/timer-riscv.c      |  7 ++-----
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/vdso/clocksource.h |  0
 include/vdso/clocksource.h             |  7 +++++--
 scripts/Makefile.asm-headers           | 11 +++++------
 9 files changed, 20 insertions(+), 27 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


