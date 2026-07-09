Return-Path: <linux-mips+bounces-15702-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fU56IJ2HT2qMiwIAu9opvQ
	(envelope-from <linux-mips+bounces-15702-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:35:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CC7306D3
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="dl/Whe90";
	dkim=pass header.d=linutronix.de header.s=2020e header.b=R0daFp2z;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15702-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15702-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 446A9305026C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DB7420874;
	Thu,  9 Jul 2026 11:32:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453B41B34F;
	Thu,  9 Jul 2026 11:32:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596764; cv=none; b=ifiM2yFCdlADcD9Ox06G1yiyb7KAcD3bMh/LAAeN7I8dFdAItqRkc6IjGpyqmzjABo2pQh08KU0CFm9nCvnXNjCxNPXipWyzwugArJ3lrWMpda9IIOM+uZVVaoKvoxnOE2c1N5O/TkWk5VDsjRtnQM23xFSkyL+K+DtzXctoW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596764; c=relaxed/simple;
	bh=KQ1WIDNBrUDk8ykSofgmkt90oehDLy0q9zMVnaVz/hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcudsR+PeGlHYaaBQ9VUK28NfZB02SnHh/+I7LDOA3DLm6Q0EBkMNmYXIBMXinmJkkOIZiJibMzKeD3NJAvk62zLKbUNnnCm0gVSQzJ5eSLmKeJiuo2V/73xczmttS5b/XlRL3G/MGHhSv/3ydajdBZM+5ULc4uk3jPwY8EdSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dl/Whe90; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R0daFp2z; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=dl/Whe90T6ve1O/3BTYidbDlixXrRSZd9phpta7c91ohla4b2Dx2E5iifStTqh2ByHAQ5Z
	tkxbt3jGRk0cuD6PhbVirPC3Szz7eXxPlSqrdeJLbeSnqR/5bykstZo7YMY8a0MqNy/DpK
	zNNKjENFd82sWWrMuLT3VJD5tVgLiIWIhJ/AqmC4KQoK/PULslB1/WFkraP5cU7W05HtPN
	G1vHUzecSCMLSTSFeNWIo2Y9F0MjFeOuMMXH21eT5OOmw4YgI0DvQXSRBiemcgdZXzME2+
	EMb7ulqTR3Qo88BKNqsQQaVvF8yVGO/tHw3MkRlwVocw7YOvNhqvyR5oVuFOOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=R0daFp2zs8PkyBEnpzUsW6sYt9fasERLxK+sCcwB8Jh2nM6cgfHoq6gVjXAKhSw4jMJWSg
	KzQu6q79L6+xZHCw==
Date: Thu, 09 Jul 2026 13:32:37 +0200
Subject: [PATCH 1/7] kbuild: support generated asm-headers in
 subdirectories
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-arch-clockmodes-v1-1-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1604;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KQ1WIDNBrUDk8ykSofgmkt90oehDLy0q9zMVnaVz/hY=;
 b=cuha/aGlOpoUsmDaKjoWXmmeaxuYlmw0QjfAEYle7hMdcStT8E1OxpY4kQA1imhwJAbSZIj6l
 wOmqS1MP1U5Af5duBA66eQXFPP86GmfpscWeOmCAPowqjmZTP7Fdhp0
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
	TAGGED_FROM(0.00)[bounces-15702-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 599CC7306D3

Extend the asm-header stub generation to also handle subdirectories.
An upcoming vdso/ header refactoring requires this.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.asm-headers | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index 8a4856e74180..772b53ffdeb4 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,14 +48,13 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(wildcard $(obj)/*.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
-quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+filechk_wrap = echo "\#include <asm-generic/$*.h>"
 
 quiet_cmd_remove = REMOVE  $(unwanted)
-      cmd_remove = rm -f $(unwanted)
+      cmd_remove = rm -f $(unwanted); find $(obj) -type -d -empty -delete
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) \
@@ -74,8 +73,8 @@ all: $(generic-y) $(syscall-y)
 	$(if $(unwanted),$(call cmd,remove))
 	@:
 
-$(obj)/%.h: $(srctree)/$(generic)/%.h
-	$(call cmd,wrap)
+$(obj)/%.h: $(srctree)/$(generic)/%.h FORCE
+	$(call filechk,wrap)
 
 $(obj)/unistd_%.h: $(syscalltbl) $(syshdr) FORCE
 	$(call if_changed,syshdr)

-- 
2.55.0


