Return-Path: <linux-mips+bounces-14014-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I3cFul/zmkqoAYAu9opvQ
	(envelope-from <linux-mips+bounces-14014-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:40:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5D38AB35
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1844430848C7
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DAA3EBF07;
	Thu,  2 Apr 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UW08Li5s"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF13346A8;
	Thu,  2 Apr 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140588; cv=none; b=Q3k7a3/5iYEePLPpikCOywpg9Dl+Y1DEMpDfFJMRdClrqml4Wq9bxhLSgQNgqoIfjukQCVYigFuely4WDfaRxw0WgLtiKzJnHoFtciStj34oMNdG8CQUrUif2AyGz//slgSsWHLLU6YY5EtASNJboTBc/FKk3kpbgGgdjmMYD4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140588; c=relaxed/simple;
	bh=skHgsjllCjONubULCO5MAmo+ht3WwPSrHT2emExS1rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNgKGVcF/kXpVyQF9NLqm+Gd8QtG9gPTHeCtYljx6UrK/PwXlwUZWUZiqPc9yCdWZkI9cfqqD+lD4lXeQg9v9dNygBTUysE/qht/WCdJuQvWyX5XMfWOsSLtp8R3jvcQkeXJKePpNM/NZ3z29aMMt1Ii0c0TSEnerqWIkAFD+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UW08Li5s; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775140579;
	bh=skHgsjllCjONubULCO5MAmo+ht3WwPSrHT2emExS1rQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UW08Li5sDRcR1Bylg7XRixRAfT+usztJY7yTdrPeTpYtmd446gQP4TDrga78S2TEt
	 3/WE8J4TNERSHvM4WPKmCZmoPH8op9AsR6/SWyJzEqBBDI5nnk9jI1oPk29t5Xr3Tg
	 ea3iut3Ppiiuin9f9sOMOn+LSdPotcbPry1tus2w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 02 Apr 2026 16:36:19 +0200
Subject: [PATCH v3 2/3] checksyscalls: only run when necessary
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260402-kbuild-missing-syscalls-v3-2-6641be1de2db@weissschuh.net>
References: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
In-Reply-To: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775140579; l=1984;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=skHgsjllCjONubULCO5MAmo+ht3WwPSrHT2emExS1rQ=;
 b=2kWk2dU0Kl/hKnt6nTDB/MICPgFwAuOaOMTEos7JVz4sdU4znfeQ8OrNpkhkAckpZrbhHYXyD
 jt9wO4v6B1YCrWNUxMCyvaTY8rl3Uqr3W6bm9MLBcCkICab4x9j9M9W
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14014-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checksyscalls.sh:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,arndb.de:email]
X-Rspamd-Queue-Id: C2C5D38AB35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently checksyscalls.sh is unconditionally executed during each build.
Most of these executions are unnecessary.

Only run checksyscalls.sh if one of its inputs have changed.

This new logic does not work for the multiple invocations done for MIPS.
The effect is that checksyscalls.sh is still executed unconditionally.
However this is not worse than before.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 Kbuild                   | 12 +++++++++---
 scripts/checksyscalls.sh |  5 +++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Kbuild b/Kbuild
index 13324b4bbe23..515cc6a27477 100644
--- a/Kbuild
+++ b/Kbuild
@@ -47,12 +47,18 @@ $(rq-offsets-file): kernel/sched/rq-offsets.s FORCE
 
 # Check for missing system calls
 
+missing-syscalls-file := .tmp_missing-syscalls
+
+targets += $(missing-syscalls-file)
+
 quiet_cmd_syscalls = CALL    $<
-      cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
+      cmd_syscalls = DEPFILE=$(depfile) $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags); touch $@
+
+$(missing-syscalls-file): scripts/checksyscalls.sh $(rq-offsets-file) FORCE
+	$(call if_changed_dep,syscalls)
 
 PHONY += missing-syscalls
-missing-syscalls: scripts/checksyscalls.sh $(rq-offsets-file)
-	$(call cmd,syscalls)
+missing-syscalls: $(missing-syscalls-file)
 
 # Check the manual modification of atomic headers
 
diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 9becaf8d7b78..a6d0882f07e1 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -273,3 +273,8 @@ syscall_list() {
 
 (ignore_list && syscall_list ${reference_table}) | \
 $* -Wno-error -Wno-unused-macros -E -x c - > /dev/null
+
+# For fixdep
+if [ -n "${DEPFILE}" ]; then
+	echo "${0}: ${0} ${reference_table}" >> "${DEPFILE}"
+fi

-- 
2.53.0


