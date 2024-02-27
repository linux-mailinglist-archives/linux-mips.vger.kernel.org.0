Return-Path: <linux-mips+bounces-1790-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67B869617
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 15:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C24F1F2CBF1
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81BF13B2B9;
	Tue, 27 Feb 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5qQx4TP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97A13AA43;
	Tue, 27 Feb 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709042881; cv=none; b=sSm4r/jAk7lX6PJZF17xmhP6KqDX5sCVJRoW/rlWVovHnlvC2lXErEWplLE3m2ZQ7hCY8C6ddgSqnB8TkdvQtBI1/Rjg8Q3lqDwnIBmk7jQnwoPrzIArWtyJfCrWsEL/ONop6Tl3iG64d91Aiqfi6E12OkDAZhpmsPYUYJuWGh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709042881; c=relaxed/simple;
	bh=2DLTWH1g5QBoJQR6b7sMrHswEuGMGQv9/Q0mVCRQ8ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzRnQhNniAkd/QGP0fQsBluW2kPmfSRl+sIswJU4YKQNoaoq0fyMZCX6v/KDKpdQzMLliT9o5ZZJdrbinTy/CMKPAvCeqdT9QjdVL5v0vHuhi/PPrgjboem/5mGrOv/ZdvralSoy7r1Hp6zRYKEA3dLqJmHDxU9o9Y+q/jPoa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5qQx4TP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11456C433F1;
	Tue, 27 Feb 2024 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709042881;
	bh=2DLTWH1g5QBoJQR6b7sMrHswEuGMGQv9/Q0mVCRQ8ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5qQx4TPJYMmNjcN/k1d2RYLYhhD4iP/3w3vaxVEpX/WjhuYF6Y6925EgQJJ2/6xD
	 45lVQMzuvO3SIbQIWlABRSbsA94hH2NwYpeLYe+7jFPxIWWD/OrrZZmiXGrmVckNsY
	 UnPdf6MA+XAxtQDyGmmgd4xJP7UjwEe/b2dCipK8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Dengcheng Zhu <dzhu@wavecomp.com>,
	John Crispin <john@phrozen.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Steven J. Hill" <Steven.Hill@imgtec.com>,
	Qais Yousef <Qais.Yousef@imgtec.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	James Hogan <jhogan@kernel.org>,
	linux-mips@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 127/245] MIPS: vpe-mt: drop physical_memsize
Date: Tue, 27 Feb 2024 14:25:15 +0100
Message-ID: <20240227131619.349656709@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131615.098467438@linuxfoundation.org>
References: <20240227131615.098467438@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 91dc288f4edf0d768e46c2c6d33e0ab703403459 ]

When neither LANTIQ nor MIPS_MALTA is set, 'physical_memsize' is not
declared. This causes the build to fail with:

mips-linux-ld: arch/mips/kernel/vpe-mt.o: in function `vpe_run':
arch/mips/kernel/vpe-mt.c:(.text.vpe_run+0x280): undefined reference to `physical_memsize'

LANTIQ is not using 'physical_memsize' and MIPS_MALTA's use of it is
self-contained in mti-malta/malta-dtshim.c.
Use of physical_memsize in vpe-mt.c appears to be unused, so eliminate
this loader mode completely and require VPE programs to be compiled with
DFLT_STACK_SIZE and DFLT_HEAP_SIZE defined.

Fixes: 9050d50e2244 ("MIPS: lantiq: Set physical_memsize")
Fixes: 1a2a6d7e8816 ("MIPS: APRP: Split VPE loader into separate files.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202302030625.2g3E98sY-lkp@intel.com/
Cc: Dengcheng Zhu <dzhu@wavecomp.com>
Cc: John Crispin <john@phrozen.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: Qais Yousef <Qais.Yousef@imgtec.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/vpe.h | 1 -
 arch/mips/kernel/vpe-mt.c   | 7 +++----
 arch/mips/lantiq/prom.c     | 6 ------
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/vpe.h b/arch/mips/include/asm/vpe.h
index baa949a744cb4..ef7e078296079 100644
--- a/arch/mips/include/asm/vpe.h
+++ b/arch/mips/include/asm/vpe.h
@@ -102,7 +102,6 @@ struct vpe_control {
 	struct list_head tc_list;       /* Thread contexts */
 };
 
-extern unsigned long physical_memsize;
 extern struct vpe_control vpecontrol;
 extern const struct file_operations vpe_fops;
 
diff --git a/arch/mips/kernel/vpe-mt.c b/arch/mips/kernel/vpe-mt.c
index 84a82b551ec35..223d6274f2e5b 100644
--- a/arch/mips/kernel/vpe-mt.c
+++ b/arch/mips/kernel/vpe-mt.c
@@ -92,12 +92,11 @@ int vpe_run(struct vpe *v)
 	write_tc_c0_tchalt(read_tc_c0_tchalt() & ~TCHALT_H);
 
 	/*
-	 * The sde-kit passes 'memsize' to __start in $a3, so set something
-	 * here...  Or set $a3 to zero and define DFLT_STACK_SIZE and
-	 * DFLT_HEAP_SIZE when you compile your program
+	 * We don't pass the memsize here, so VPE programs need to be
+	 * compiled with DFLT_STACK_SIZE and DFLT_HEAP_SIZE defined.
 	 */
+	mttgpr(7, 0);
 	mttgpr(6, v->ntcs);
-	mttgpr(7, physical_memsize);
 
 	/* set up VPE1 */
 	/*
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index bc9f58fcbdf94..86c743747e79a 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -22,12 +22,6 @@
 DEFINE_SPINLOCK(ebu_lock);
 EXPORT_SYMBOL_GPL(ebu_lock);
 
-/*
- * This is needed by the VPE loader code, just set it to 0 and assume
- * that the firmware hardcodes this value to something useful.
- */
-unsigned long physical_memsize = 0L;
-
 /*
  * this struct is filled by the soc specific detection code and holds
  * information about the specific soc type, revision and name
-- 
2.43.0




