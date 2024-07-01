Return-Path: <linux-mips+bounces-4049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA891D53C
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10FEB1F24AEF
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED1E14F121;
	Mon,  1 Jul 2024 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5uZAW0I"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5498214E2FB;
	Mon,  1 Jul 2024 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792855; cv=none; b=BcUdENwJfSjotkEgrLoecY+s1G4OBBxMzMqnKE86E6t4KAOQWmEtO3oaJs3PEnOZYr4FbZZoK9ktimpTRrfqDsbhLzy538g5GvQ2YBCgh1AkmxfvkxsWAwiNvm62vspoxDQ7ud0rGZMAdkvCXnJ47LWzCkgoLd4GqKEqQpL8Ha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792855; c=relaxed/simple;
	bh=2Jd6uoxkND1P+6cmjzofO508go7HiADA7HL/ZC4rmvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WksF3VwLuogNG/Q+0aCok45UPHsW6kc4RxIWkqfAMbHDC2OhHTSTVVe7EPQYuxx3JnY9QXctGWSSiYtn2SLR/U0gd3esDGtXouxgHxz7eSXNVEQTl0aM/leBGcmYQe3EXP5vpfCUmOamlzzrY152X1Ylqby8v1de4Mzul6GTfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5uZAW0I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB74C32786;
	Mon,  1 Jul 2024 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792855;
	bh=2Jd6uoxkND1P+6cmjzofO508go7HiADA7HL/ZC4rmvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5uZAW0I20jcfvYWXuN2WQHNxAos8JFHbykdc1yvDrQ1xPceqXIuuskQYcx6nvNWl
	 QRfBxA0apXWPToWBoKD7zn2Wh3b21fOwcwyGGTjbJPwD26AA8fxihSDqSC61zsiiFE
	 4iTUneipY7t4qLo6RevEp1DEeKPkpg3D/NSloqRgly3hh2pbb7ePc0FOd6wCLr7AaB
	 fwSO1vtwR6VUFSMRVFerwcOErvhsZZ1XROKIbc6muGq71JTcHHIGMHBuj6bI15VEfP
	 za/cQ7GI7mmtvlVg3Y0jvH56216R554TP+ySTAFTg+UrfqMMotmMVf7e/U0Hi2+ADu
	 KpzWPpjOhXbSA==
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
	palmer@sifive.com,
	mszeredi@redhat.com,
	casey@schaufler-ca.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 12/12] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:13:31 -0400
Message-ID: <20240701001342.2920907-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001342.2920907-1-sashal@kernel.org>
References: <20240701001342.2920907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.36
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
index 1a646813afdca..f50f2b85d0f79 100644
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


