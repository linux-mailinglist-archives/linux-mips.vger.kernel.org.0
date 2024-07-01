Return-Path: <linux-mips+bounces-4051-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C791D558
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 02:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699D41F24F1B
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 00:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3E51591E0;
	Mon,  1 Jul 2024 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNXu0xw9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541B51C42;
	Mon,  1 Jul 2024 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719792892; cv=none; b=qkYhSsdHwP9Vdkh3PxLu3/9o5U6ATqPJd8bUHh55luhs1AkJoaUeuMan+7H4nkkHW8VD7+BDpx5U7e6glB1ZzNUbRmgWhPOWB/SlK0nK3e89HZTqvBrtETTlBDZ9RNtBTgldigSFaDdeu9V0rbbCITnRZPBPZP5qiEWJBeTZjTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719792892; c=relaxed/simple;
	bh=bcfmSFNZOH8bTOHB+4V2WwndUfrNz4rca9tLGyhsW+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+Ron4Fo0NWacJtmvEKMViLkPXoZ9nNcTFhy0c6cnLg9xLcwIG+Xg2YANEnHF5cOPf/BFB0t5zK/0lvzBooGmHrlrfZBKKo0+s9yM5Xx9m4+nqOlg/OeUxCZD3lVMY+gJf9djY2m6gncoeL7NU/HgTde6/RBLHa66MW3skwvdkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNXu0xw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A566DC2BD10;
	Mon,  1 Jul 2024 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719792892;
	bh=bcfmSFNZOH8bTOHB+4V2WwndUfrNz4rca9tLGyhsW+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aNXu0xw94fA3L7i4bw+Qv9rhzyTpQMeh69oyT5L0Gdvis8K4UzMGCUwXMyTGnrhaR
	 qMWLfg/9KbZBBeF4WAEte6uUxq9BXlBiOrsny2b+uUlvT63m1P2IzkFe5bk2y3kEjd
	 wwoBsEIqP/Qi1jM1xZJA+AjbNRrw+z+BgyUpLPZL5XkIheipAZdNbxsueQn3+xy8wW
	 wF0cIScj4L/9/MMyRoIDzOHuu1lLUFKAZmTYL22v8RJyIWC0qwkVoql1mjTXXU0f/P
	 hAYA+ZVgOlK78Xe92XPdpx0fu3d4dtuk4QSUTMp3AFiaBkoW6/O4Q55NbxBhW7nN30
	 Rv4nxEY0t67XQ==
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
	mszeredi@redhat.com,
	casey@schaufler-ca.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 5/5] mips: fix compat_sys_lseek syscall
Date: Sun, 30 Jun 2024 20:14:33 -0400
Message-ID: <20240701001438.2921324-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001438.2921324-1-sashal@kernel.org>
References: <20240701001438.2921324-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.161
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
index a61c35edaa74c..0840175bda655 100644
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


