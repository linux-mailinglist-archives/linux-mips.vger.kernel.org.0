Return-Path: <linux-mips+bounces-14016-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBENHjGAzmk9oAYAu9opvQ
	(envelope-from <linux-mips+bounces-14016-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:41:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394F38ABC7
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE583093A03
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6E63EDAB9;
	Thu,  2 Apr 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GfsUKvWj"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEBB3E5593;
	Thu,  2 Apr 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140589; cv=none; b=uqD2onLePJK+LckkTkQ+HlFDfaiQb2OVZPSEEoowTZBpYHcBTL4yfV01bDNUtmadE8PAvnUgj5x5vttetf9xolZfRzPlc0WwP3IVDviIVqRfHg4llrvKkEpXolFeuVBd9pE4+PJ7ZFaRtl2Eg0aNJWur+1vozAn29LXDRBjoRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140589; c=relaxed/simple;
	bh=y3aIGMOp1b9VTDfNribT+T7Mf+FjPMAH9yNwJsDKdYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLDonjVCkW8chAalDVJK6ilBkQ4xojItoQOM1AK97NqWfoEWD1jxtIA/daSypUEZ1aIjI8P82HKVhJFzJcO03IN+368+fyYHGfgJza2R72WaC1nxaLKOgHCuaxMBvs2tHFGorevfS5QcuYlKGE9MXv6sEs5YJgRJFwPYsgCvzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GfsUKvWj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775140579;
	bh=y3aIGMOp1b9VTDfNribT+T7Mf+FjPMAH9yNwJsDKdYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GfsUKvWjtPB92Wb+RCOBssOJOuwdasKXPvWjDnOaWryixXcre8JD+s5m1X7S0ktOf
	 ZtjZT9+rVGTQBPTCYD/8U62GhCxooIpB61duMF9Raa33SPUt61gohAEbfddtoWNaUC
	 oaPlpZbyg2ic6PMrPorzQJzioCZJ/hNr4yPOORgQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 02 Apr 2026 16:36:20 +0200
Subject: [PATCH v3 3/3] checksyscalls: move instance functionality into
 generic code
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260402-kbuild-missing-syscalls-v3-3-6641be1de2db@weissschuh.net>
References: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
In-Reply-To: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775140579; l=2042;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=y3aIGMOp1b9VTDfNribT+T7Mf+FjPMAH9yNwJsDKdYs=;
 b=025Nt1dUd01x2J1nlRjnU7Vbl4wsIVyJa6X4qkP1YA4c2di+2OdaEPCAm8+NiI5IG7XSE7Cbz
 b9hbEko+VaqCz0eCauOoZLgQch8k5lUQXR6tLaC9PqItqwyxz0tr4iW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14016-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checksyscalls.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,arndb.de:email]
X-Rspamd-Queue-Id: 2394F38ABC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On MIPS the checksyscalls.sh script may be executed multiple times.
Currently these multiple executions are executed on each build as kbuild
see that the commands have changed each time.

Use a dedicated stamp file for each different invocation to avoid the
spurious executions.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 Kbuild             | 4 ++--
 arch/mips/Makefile | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Kbuild b/Kbuild
index 515cc6a27477..a6a0192dea08 100644
--- a/Kbuild
+++ b/Kbuild
@@ -47,11 +47,11 @@ $(rq-offsets-file): kernel/sched/rq-offsets.s FORCE
 
 # Check for missing system calls
 
-missing-syscalls-file := .tmp_missing-syscalls
+missing-syscalls-file := .tmp_missing-syscalls$(missing_syscalls_instance)
 
 targets += $(missing-syscalls-file)
 
-quiet_cmd_syscalls = CALL    $<
+quiet_cmd_syscalls = CALL    $< $(addprefix for ,$(missing_syscalls_instance))
       cmd_syscalls = DEPFILE=$(depfile) $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags); touch $@
 
 $(missing-syscalls-file): scripts/checksyscalls.sh $(rq-offsets-file) FORCE
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index d9057e29bc62..6705fa5d9211 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -421,12 +421,10 @@ CLEAN_FILES += vmlinux.32 vmlinux.64
 
 archprepare:
 ifdef CONFIG_MIPS32_N32
-	@$(kecho) '  Checking missing-syscalls for N32'
-	$(Q)$(MAKE) $(build)=. missing-syscalls missing_syscalls_flags="-mabi=n32"
+	$(Q)$(MAKE) $(build)=. missing-syscalls missing_syscalls_instance="N32" missing_syscalls_flags="-mabi=n32"
 endif
 ifdef CONFIG_MIPS32_O32
-	@$(kecho) '  Checking missing-syscalls for O32'
-	$(Q)$(MAKE) $(build)=. missing-syscalls missing_syscalls_flags="-mabi=32"
+	$(Q)$(MAKE) $(build)=. missing-syscalls missing_syscalls_instance="O32" missing_syscalls_flags="-mabi=32"
 endif
 
 install:

-- 
2.53.0


