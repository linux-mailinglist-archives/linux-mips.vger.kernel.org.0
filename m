Return-Path: <linux-mips+bounces-7984-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA1A460E6
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0488C16A5BF
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6367321C160;
	Wed, 26 Feb 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="dEAFUUJT"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532821578A;
	Wed, 26 Feb 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576550; cv=none; b=CSxfzqBIiy+vrsJrwHe7K82umkJzog/La7cWNivIR51BCDVep9ADx5MOY19232UyMy03138XB7n9aw5UwVxRRMl5DezfQEYo8PnCC1/EE+XkClKntfFTUovN206o2frONdfa6EX2BIVHXmA4WlbbitTZ9qDVsCVtBmPrhg4upAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576550; c=relaxed/simple;
	bh=Kps6CRn6lwp3Sf/xBH3YZLxHsLFMxHU24p7u/qwezGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5R1cSifBYA7NRNpR6AS8vxW2UUzLXjgnsXfDiOhsMuU5/cE03suN3Ah9LLZrqbHg6Txw3G4KdsLCC1fnIZbQ8WU1E9CTpHUSkp5+1MerCuG9A09/eEOnyBidMwA+lloR+TRcK1Tioj+7bJon4btdbB0OoSSoTFgI86SuHJowmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=dEAFUUJT; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740576541;
	bh=TNtk7emEalBYnrGztT/GGV0G9xZ09oPsRARFcEGb+mo=;
	h=From:To:Cc:Subject:Date:From;
	b=dEAFUUJTAVqbCbSLSQa8LWRJpQxnQE+A5YIE+NaM98GUPcTRvOE1HJhbq5VVMG0A2
	 OQY7BbNLLvXB3DnaCyU+GA21OL9PWL/7OKvEy3b930jx1NPorzS9/qOvfLafQkODLm
	 69/icPwBroWNs5m2oOj7bSkkHuIDUDpv2p+KmwxU=
Received: from stargazer.. (unknown [IPv6:240e:456:1120:44ab:6cbe:bf9d:b543:fee6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5237D1A3F54;
	Wed, 26 Feb 2025 08:28:54 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Matt Redfearn <matt.redfearn@blaize.com>,
	linux-mips@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] MIPS: Ignore relocs against __ex_table for relocatable kernel
Date: Wed, 26 Feb 2025 21:28:41 +0800
Message-ID: <20250226132841.381063-1-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 6f2c2f93a190 ("scripts/sorttable: Remove unneeded
Elf_Rel"), sorttable no longer clears relocs against __ex_table,
claiming "it was never used."  But in fact MIPS relocatable kernel had
been implicitly depending on this behavior, so after this commit the
MIPS relocatable kernel has started to spit oops like:

	CPU 1 Unable to handle kernel paging request at virtual address 000000fffbbdbff8, epc == ffffffff818f9a6c, ra == ffffffff813ad7d0
	... ...
	Call Trace:
	[<ffffffff818f9a6c>] __raw_copy_from_user+0x48/0x2fc
	[<ffffffff813ad7d0>] cp_statx+0x1a0/0x1e0
	[<ffffffff813ae528>] do_statx_fd+0xa8/0x118
	[<ffffffff813ae670>] sys_statx+0xd8/0xf8
	[<ffffffff81156cc8>] syscall_common+0x34/0x58

So ignore those relocs on our own to fix the issue.

Fixes: 6f2c2f93a190 ("scripts/sorttable: Remove unneeded Elf_Rel")
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/mips/boot/tools/relocs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/tools/relocs.c b/arch/mips/boot/tools/relocs.c
index a88d66c46d7f..9863e1d5c62e 100644
--- a/arch/mips/boot/tools/relocs.c
+++ b/arch/mips/boot/tools/relocs.c
@@ -468,6 +468,8 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
 			Elf_Sym *sym, const char *symname))
 {
 	int i;
+	struct section *extab_sec = sec_lookup("__ex_table");
+	int extab_index = extab_sec ? extab_sec - secs : -1;
 
 	/* Walk through the relocations */
 	for (i = 0; i < ehdr.e_shnum; i++) {
@@ -480,6 +482,9 @@ static void walk_relocs(int (*process)(struct section *sec, Elf_Rel *rel,
 		if (sec->shdr.sh_type != SHT_REL_TYPE)
 			continue;
 
+		if (sec->shdr.sh_info == extab_index)
+			continue;
+
 		sec_symtab  = sec->link;
 		sec_applies = &secs[sec->shdr.sh_info];
 		if (!(sec_applies->shdr.sh_flags & SHF_ALLOC))
-- 
2.48.1


