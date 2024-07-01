Return-Path: <linux-mips+bounces-4053-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24591D571
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C493B21033
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16EC15D5AB;
	Mon,  1 Jul 2024 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD+Wlrue"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646A15D5A4;
	Mon,  1 Jul 2024 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792926; cv=none; b=h0tNGWwwHgG83M7rP57OqXnUjzicuN9JGQ/k3JvKJsErvYVQ7v0Lvd2H4GICRTMlkGkR3+qRcpMpbtiQBnZNU5Wk27+IVZJsbNygt+U3LCTuzBY2a2h8Cu9VP8W99OPmOsZhUqmZYEcKzzyKljmDTpgaV1nT/MwneWtbiStvQso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792926; c=relaxed/simple;
	bh=W4XKRM96NfZEDgWXn2Q2vfdWEruHWoR+teSwyVUiCIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8raPQorRxhKNxDuu47uy1Gu87rXlTmOqBMYlRIsTEsIcQhwV2IjJMysONQVSmIBq5jAzYMNva/aZewUwYTJpLYlJqOLqTJ20iTajBznByREvHKLWBJsnbGeH1T+YyeAuLk1QWUJ5iM5sBbaBb8QLeBcFVZAuT8CdkHQXvZlUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD+Wlrue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3BDC32786;
	Mon,  1 Jul 2024 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792926;
	bh=W4XKRM96NfZEDgWXn2Q2vfdWEruHWoR+teSwyVUiCIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iD+WlrueB1Jp6lwm3dUDc6fSXfjg6VVt19TgUH55092Gk+bznnim0HpjpqQrEYfmp
	 XwowNVySHOmvo/4Ka8/48KQ9xcEuzn+SvhK2UHwq70E5Ygtod/fqsdIM1AFYbs5jXx
	 VVw3SSbNpNQVL7NBUIHNCXz7sclc1Nfluhkr6NICocX7XNCKmZsm8p6OpTMevCyShi
	 vqp92ABEqO1IKcJKgBN48BVopDRQegOp2h1eT0kn4ZP5qPkM/3s0F7xkbC/VWqTS/O
	 WWI5iahwgjFaCCNR9+Fjm2Rfr0rTHEl6fSWElDdIrcaycZEwJsGeew3hwS/sdBsPr0
	 +GIGlK1oqy5xw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	geert@linux-m68k.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	brauner@kernel.org,
	sohil.mehta@intel.com,
	casey@schaufler-ca.com,
	palmer@sifive.com,
	mszeredi@redhat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 4/4] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:15:09 -0400
Message-ID: <20240701001514.2921545-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001514.2921545-1-sashal@kernel.org>
References: <20240701001514.2921545-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.278
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
index 353539ea4140a..5f2c2636e7a4f 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -27,7 +27,7 @@
 17	o32	break				sys_ni_syscall
 # 18 was sys_stat
 18	o32	unused18			sys_ni_syscall
-19	o32	lseek				sys_lseek
+19	o32	lseek				sys_lseek			compat_sys_lseek
 20	o32	getpid				sys_getpid
 21	o32	mount				sys_mount			compat_sys_mount
 22	o32	umount				sys_oldumount
-- 
2.43.0


