Return-Path: <linux-mips+bounces-4048-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B091D514
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA541C20BB1
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14DF82C6C;
	Mon,  1 Jul 2024 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEoOaIg+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8846482C63;
	Mon,  1 Jul 2024 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792809; cv=none; b=eJbGsedz3vgR/3ESpV8jzACJaG22hZqfXwFkYEl0FGV2Qk7Jc0l3a7CylyZeetaVzqDbKKRipRGqBu9x+ZTVI9uvFn2ij2a6mOUR5zmpGuYuuIEq/H7Ox7eYnR0O5nOC/nZLRmJ8y0epA6AKckAt5Kx/mOtb9cKdmzj8TQzKyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792809; c=relaxed/simple;
	bh=9kZtq5Pv7UgvTiZujv39ShTgDbAphEjPiqOPenduPIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMICbT5ME18tRL7ashTRvdNCczc+x8mDYYbKjpx24kYiJ+ewI22psiNUI/7vCs1HYFbpoRPOMpeKuitA3EPpqTphJREvZdz4oW/rJ/axqkDUtMBZ1hnCsw3vTutYOq+HjSPNbkCPYzYY3KS9ImbiGfmY5rD2VlJ6roiAjLrrgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEoOaIg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC883C4AF0B;
	Mon,  1 Jul 2024 00:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792809;
	bh=9kZtq5Pv7UgvTiZujv39ShTgDbAphEjPiqOPenduPIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEoOaIg+WY8dbAftQmYID95Hf6LRJaNc/ydgJm7k4hnZXUggH6arJIbxH9Gm/MUtV
	 EiRcAraOl8kwok6G1JfnIKBCyGKrNMg85cW9IGWtn2qDvMZcnTY6g5nm20/eTk0e1I
	 QDXcibwAs02lMCbm94AFTSnaO2oMHRsJ0VwcrO32Ab71GNrZyxJsy8zmVzTAhM0wGa
	 CJvtdxJZb/D+iQDssVcrKhRsnEGbP0f4nMdxNJhvDbMRvSzocdio1pidRa/Zd9+5gA
	 IL9D2CxFwNTsP/nn+AsslFtFhKHwISQdS4SqQQ1wkEH34mLuM+kjAAtm8gf/Q018zf
	 XQlQOntdwnfAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	geert@linux-m68k.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	sohil.mehta@intel.com,
	casey@schaufler-ca.com,
	jeffxu@chromium.org,
	mszeredi@redhat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 19/20] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:11:24 -0400
Message-ID: <20240701001209.2920293-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001209.2920293-1-sashal@kernel.org>
References: <20240701001209.2920293-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.7
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 0d5679a0aae2d8cda72169452c32e5cb88a7ab33 ]

This is almost compatible, but passing a negative offset should result
in a EINVAL error, but on mips o32 compat mode would seek to a large
32-bit byte offset.

Use compat_sys_lseek() to correctly sign-extend the argument.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index f45c9530ea93a..6a405cb4218b6 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -27,7 +27,7 @@
 17	o32	break				sys_ni_syscall
 # 18 was sys_stat
 18	o32	unused18			sys_ni_syscall
-19	o32	lseek				sys_lseek
+19	o32	lseek				sys_lseek			compat_sys_lseek
 20	o32	getpid				sys_getpid
 21	o32	mount				sys_mount
 22	o32	umount				sys_oldumount
-- 
2.43.0


