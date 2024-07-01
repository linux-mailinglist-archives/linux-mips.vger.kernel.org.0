Return-Path: <linux-mips+bounces-4050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1D191D54A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DF01C20C69
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBEA157A46;
	Mon,  1 Jul 2024 00:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSYq8ySq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E552157495;
	Mon,  1 Jul 2024 00:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792873; cv=none; b=GJoHbEThYn69noTXbCRk7cwwTQiEln2/keFFHH/KUz6uL/XKJxXNr9trqKANi/dT/+I43+zRIu672NbcGdO04HxjSukHpU32Bumbq5H/FTvgF5/h6crxtMOpHaQuFL/w6sIzFF6l66Yfh3F6PXfRUa7/Hr9FEAfVAdrv1MIKcWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792873; c=relaxed/simple;
	bh=6MrW6dg08bfMTpI1SGE8CHFNbuQufmErMcTfC3ZLpJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MI71eVyyn/wOCoOw6eC2zBjAw3jKQD1HNyn5fjZMJvfifkMPXrcFydJuc7yJJXhdu1AbioRblykMwHiPifyEnfJld2OATnwKX7nFiX091PjrSBTv9fMdQgpJRefM9iq5gMS/VIMspaCJ0x66DHImSMgFHBMl6UfxydXfeyNtrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSYq8ySq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6A1C2BD10;
	Mon,  1 Jul 2024 00:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792873;
	bh=6MrW6dg08bfMTpI1SGE8CHFNbuQufmErMcTfC3ZLpJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QSYq8ySq7bKyYGF+jYyImv1V3kHj79hhW8RU49tqmYjQMe1bOJkv0ohyO2iOYbuy7
	 y70yLp8Jk1+aKe3BbfNUd8ClLn6bvLRlwWqwV3ABXk9MdVugBjgnnVDerHI8hRqMO7
	 cAmAhq4XGFobH8SHBIS3/W3/VvYMLXc1Xb/D5dxKYR3SkLJeg7mQ2oK8fH+6mjBRMc
	 3SYxG0B2atEY8lwfnvyGXGmHdo8HL55J8op94D/jwmxjrqihQxt7qjq4xNFzDFgTMq
	 /rX0OEt4v/jomJKvO24W2b+SJyPYgaWcOMpPWGf6m++oM1mll9auwiAr4tfaGHuOhe
	 Fyvcfv0rSvgNQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	geert@linux-m68k.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	kees@kernel.org,
	sohil.mehta@intel.com,
	casey@schaufler-ca.com,
	mszeredi@redhat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 5/5] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:14:15 -0400
Message-ID: <20240701001420.2921203-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001420.2921203-1-sashal@kernel.org>
References: <20240701001420.2921203-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.96
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
index 8f243e35a7b20..2c8bb6c630d9c 100644
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


