Return-Path: <linux-mips+bounces-13921-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMeCNA3HwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13921-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:17:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C395319E13
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60B41303274C
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476CF406266;
	Tue, 24 Mar 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Leqe5vwL"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE77639BFE7;
	Tue, 24 Mar 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372614; cv=none; b=c6JPwK8+ZoW12o+mElmUkdOwfXj/bLqiRI8Bq73rHJtvmay3p5HjVUQY065ZoZ4dexl63GCDnrNk5rr3Wkh3GzkKLNWe/RcIQZsC5mD2jYqk7Tc36Z5dOafVZmhnWSAeoWewn0vb0G/iGV2FnTRIPL2ub2TlY3XJg3E9M8yB26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372614; c=relaxed/simple;
	bh=AWPGSjlFGYCvM0Uf27Rjhu8lYH3auQ3CC8o4On5/Fg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fC3IKudLE0ZnDhnXqds2/SpamaeQsDrwe825ETgAE13VI3Fc6GUuCbTGtatDAP8DV1kytK6PcSic8o323K9YWYsrz/RHoR/rZVRGUddbMOb7fZ3d8kejKf5m0nrJL+Vujyy6dVLzpGnhaLsvWeM2c2U7hqAVCy0wNd5J3yaCBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Leqe5vwL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774372611;
	bh=AWPGSjlFGYCvM0Uf27Rjhu8lYH3auQ3CC8o4On5/Fg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Leqe5vwLM/IYMnZB2ew5KnxqE8SBhXPoILF4d+MItPHq3HjqI0aZaSEHJppRnT+qp
	 a/BsRJ9g2v+joXC1tZtnCPsVB/Ls7u7w36OGw+NxTIhlL4kKlWAY0juuFTxaT3/eqA
	 XTpkja5+cZNLXMwR/2Akb4gZ/i7pHY3CnhWQL6uU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 24 Mar 2026 18:16:47 +0100
Subject: [PATCH v2 3/3] checksyscalls: move instance functionality into
 generic code
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-kbuild-missing-syscalls-v2-3-651b8beb0bfd@weissschuh.net>
References: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
In-Reply-To: <20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774372608; l=1976;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=AWPGSjlFGYCvM0Uf27Rjhu8lYH3auQ3CC8o4On5/Fg8=;
 b=php6j205LocMv2mfZM19vfQjgmPBUt2US+ZalikYBSClGGFY96vwoeiHsp/AaKPNHZ8jVliBA
 0XxziGWo3ItAkGwxzwsiMqosAOMXqLAtxIg8w7p4l2p5bJ40ENtwtj6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13921-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checksyscalls.sh:url]
X-Rspamd-Queue-Id: 7C395319E13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On MIPS the checksyscalls.sh script may be executed multiple times.
Currently these multiple executions are executed on each build as kbuild
see that the commands have changed each time.

Use a dedicated stamp file for each different invocation to avoid the
spurious executions.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Kbuild             | 4 ++--
 arch/mips/Makefile | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Kbuild b/Kbuild
index 515cc6a27477..fb547bc5ff41 100644
--- a/Kbuild
+++ b/Kbuild
@@ -47,11 +47,11 @@ $(rq-offsets-file): kernel/sched/rq-offsets.s FORCE
 
 # Check for missing system calls
 
-missing-syscalls-file := .tmp_missing-syscalls
+missing-syscalls-file := .tmp_missing-syscalls$(missing_syscalls_instance)
 
 targets += $(missing-syscalls-file)
 
-quiet_cmd_syscalls = CALL    $<
+quiet_cmd_syscalls = CALL    $< $(if $(missing_syscalls_instance),for $(missing_syscalls_instance))
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


