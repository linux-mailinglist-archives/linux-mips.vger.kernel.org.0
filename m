Return-Path: <linux-mips+bounces-1789-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B809869616
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 15:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05DB71F2CD06
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 14:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD2813B78E;
	Tue, 27 Feb 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PHZP7FnF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1C713A26F;
	Tue, 27 Feb 2024 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709042879; cv=none; b=nipIGrdfEt6m1DDzjk24I3K0WDSgg/rjVM4nSGqVbA5lmNgLNp8FNfIYy6LOpqTb9kZocSL1vtgFjOED/ojnJrWhUFA6hRDPd09jwh817UbXtkVeWt40nsrL443Ro6HkystXJGImKiMj59Qzr77yzaM/8+wyLGRp/FbU0G2V2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709042879; c=relaxed/simple;
	bh=m5hM/fbX5rGbICYVQv9by6VAMbSX6dmEItuJOBX4iPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JImf3/aGTFeLqjPDIMEjT4iH0gm7FZPkOBhLgvr6/bNjY6uzZWsUubF4xgz4l5l+D1HTtK7OQupLiWZVnXTODSsn4Nz4jMi4XK6Bj1vB+kYMQ/iyK+oqJePzirApTU9yaaE9hMiQkSApsMygRi5XursGNj99fib6XcjtJwxjQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PHZP7FnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7699DC433C7;
	Tue, 27 Feb 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709042878;
	bh=m5hM/fbX5rGbICYVQv9by6VAMbSX6dmEItuJOBX4iPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PHZP7FnFMQLPguh1i2/zwK/wS72CUkgx4rVGWukvC9TSG+gTsVQAKXz2wAcUet1z1
	 sqQW8NZC9KS+coP5o0pvctgovznTqmoi22W4H4jopbWSeYcxmZnPdGca5uuWwt53/+
	 jCmVzzHMlyIT/ZsFTryh1duxiXKILxc+qKJiBvV8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Dengcheng Zhu <dzhu@wavecomp.com>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 126/245] MIPS: SMP-CPS: fix build error when HOTPLUG_CPU not set
Date: Tue, 27 Feb 2024 14:25:14 +0100
Message-ID: <20240227131619.319400822@linuxfoundation.org>
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
Content-Transfer-Encoding: 8bit

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 6f02e39fa40f16c24e7a5c599a854c0d1682788d ]

When MIPS_CPS=y, MIPS_CPS_PM is not set, HOTPLUG_CPU is not set, and
KEXEC=y, cps_shutdown_this_cpu() attempts to call cps_pm_enter_state(),
which is not built when MIPS_CPS_PM is not set.
Conditionally execute the else branch based on CONFIG_HOTPLUG_CPU
to remove the build error.
This build failure is from a randconfig file.

mips-linux-ld: arch/mips/kernel/smp-cps.o: in function `$L162':
smp-cps.c:(.text.cps_kexec_nonboot_cpu+0x31c): undefined reference to `cps_pm_enter_state'

Fixes: 1447864bee4c ("MIPS: kexec: CPS systems to halt nonboot CPUs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dengcheng Zhu <dzhu@wavecomp.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/smp-cps.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index bcd6a944b8397..f2df0cae1b4d9 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -424,9 +424,11 @@ static void cps_shutdown_this_cpu(enum cpu_death death)
 			wmb();
 		}
 	} else {
-		pr_debug("Gating power to core %d\n", core);
-		/* Power down the core */
-		cps_pm_enter_state(CPS_PM_POWER_GATED);
+		if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
+			pr_debug("Gating power to core %d\n", core);
+			/* Power down the core */
+			cps_pm_enter_state(CPS_PM_POWER_GATED);
+		}
 	}
 }
 
-- 
2.43.0




