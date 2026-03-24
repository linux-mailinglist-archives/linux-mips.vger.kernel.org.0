Return-Path: <linux-mips+bounces-13920-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBUmGAjHwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13920-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:16:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC2319E0B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A00B3029AAC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355B0402456;
	Tue, 24 Mar 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZFmMFyGH"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB32FFFB8;
	Tue, 24 Mar 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372614; cv=none; b=ovW+QBjlfTujEGqWtr1QUmHfOB+kW4CS+yr8/6OQAj75PMPZthlbEPAAk8cVsrrZoxwAz2XYUtLyOSaqoJMmkcfDtEVgGxRa7Otv9uguPfoF4zPoYMyVOqZ5K4dXbUTozYd6U25K/vsUr4pZUUohoR0TGWHUp9FUKdHNaoFN8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372614; c=relaxed/simple;
	bh=dduxJCgHweVxYiNvudg2ZsGjXC2SsrE2dgbU9AwUCbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ln4v5ut0WsFxKR6KLun/8wwT44g15QrO4vC7aci2dUaWHxFEfFLXlmLYA9aJqg6BiPcqD+qiBgf8v0CD7fUa9pX3HBm6ng602pDUylqe4LVPzJDjIJnFV423Rjyu9IPtUzI+1qHTyh6qF0PXHQXsp4BSQ4VOJnGN1ujAN6qjA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZFmMFyGH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774372611;
	bh=dduxJCgHweVxYiNvudg2ZsGjXC2SsrE2dgbU9AwUCbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZFmMFyGHh8xLPoK0dJkucVrkCeSoHuJSPlHpbGmwX0EQlK9L1DCVMrrJDusFkzKh0
	 xCJtXs6P0TuSMxUwncWucmUDu148p4V6JUNYV3bK/FRwOe4Lw4Aw8pjE8a1rWVvqJv
	 0NGxAkOKVmosMYCT9KpoKNbIAU5Hymj6lbpTtq64=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 24 Mar 2026 18:16:46 +0100
Subject: [PATCH v2 2/3] checksyscalls: only run when necessary
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-kbuild-missing-syscalls-v2-2-651b8beb0bfd@weissschuh.net>
References: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
In-Reply-To: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774372608; l=1897;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=dduxJCgHweVxYiNvudg2ZsGjXC2SsrE2dgbU9AwUCbA=;
 b=kAHN5WQSNDvqL5cVowFQLOPm7uQNBmUnSkbP4ygCMbiQeekCS/sIu+2fTy5KCDGm4j8v1VgbI
 q4my+qCwnmBDIkcsHl9d84DQ0j62lZRgBjGK+weUqVcAcZHkkxroKFZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13920-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checksyscalls.sh:url]
X-Rspamd-Queue-Id: 07AC2319E0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently checksyscalls.sh is unconditionally executed during each build.
Most of these executions are unnecessary.

Only run checksyscalls.sh if one of its inputs have changed.

This new logic does not work for the multiple invocations done for MIPS.
The effect is that checksyscalls.sh is still executed unconditionally.
However this is not worse than before.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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


