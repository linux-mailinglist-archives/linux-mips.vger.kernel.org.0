Return-Path: <linux-mips+bounces-4052-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01E91D564
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343481F21C9D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C72215AAC1;
	Mon,  1 Jul 2024 00:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMqMt0Y7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A863D5;
	Mon,  1 Jul 2024 00:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792909; cv=none; b=U+YX6+qR0CE2oILQK3NtBTVv1t+lmNVPxGjsJXLMB/iEdRUrW/LP3a11LEkG21+Q9lV17DRcr78V8bIaIPXrf7H2O34tTKMS9aLS5Jq2bzvFD1l7aZMOyJkO9BximTPvyBfCm9YiEDeGYZ4L7yuiGJjnD8u+HiXnsUfJp714N6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792909; c=relaxed/simple;
	bh=LUGLkVx+EB9gNUaqkvSz3PKyYxAOJvfQZIJVdEGv9PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMB1nCqRkFiKPNtSs/KWDsgk71sSIci/7ykYkh1AvUabvlDt066/zFV24o522Hzi/PQE8eKsxZV5H7FQBif1Dk6ylhqRuuHPZT4T7WvEEz6gCNVEyG9qq+DJifZV9rV6ap0qtMb9TqPAsZqew+RXajFsK9pqMs4hjaxNKFAkeUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMqMt0Y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCCEC2BD10;
	Mon,  1 Jul 2024 00:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792909;
	bh=LUGLkVx+EB9gNUaqkvSz3PKyYxAOJvfQZIJVdEGv9PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMqMt0Y7D2VkJN/9JfkrvJq9XBcjugNs8sSeFXvEKldg+q19WB12oeJ2DyF+xtA3u
	 EABi6OCuK1f4AbFF2cY2+Bm4mqArK1A6zZ4QI8sO0vyyX4E75wYfsFjfZlEIxmeY1C
	 imiSMmO/6nmnwAVHtUAft8sPW4E1ib3vzcnVmOeiiFS96h52YeiokcE4rHKxPTIHwD
	 OQnW6qKCrUpSR6w8DnvCPQZMOZv4lun5RrHts9a7xmL0mkAu3Yi0Uky9rT5G2fAfQJ
	 DOsiS05jJSlnZ49iszvUMkxoMNI8RjVviGiLuzCA8xVW2yvgTPFY8ndcbc0hUPPvEF
	 9qHZWYpmsYtcA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	geert@linux-m68k.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	kees@kernel.org,
	sohil.mehta@intel.com,
	casey@schaufler-ca.com,
	palmer@sifive.com,
	mszeredi@redhat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/4] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:14:52 -0400
Message-ID: <20240701001457.2921445-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001457.2921445-1-sashal@kernel.org>
References: <20240701001457.2921445-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.220
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
index 29f5f28cf5cea..99e63597c7a66 100644
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


