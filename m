Return-Path: <linux-mips+bounces-7160-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2589FABE5
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 10:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2869516537D
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 09:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888818FDAE;
	Mon, 23 Dec 2024 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Nono7JDe"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70813259489;
	Mon, 23 Dec 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734945666; cv=none; b=bKgKNsmB8mK8sZW33jKnUrFCii5ZSxSYdqnflP55jeIvVTiDJ/NzpAJcp4tvpotg4dGCuvwZ/xYNd2IRwhUqLL+X61nrEdPXXT9dI6F+eGXFfmkcilysfwSDAsLmNpJaJ2VTFJiftxn8UaXB7xvvE83nF77rhZkEAMzt6FxbY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734945666; c=relaxed/simple;
	bh=jL2/AM8qJ7rQ/cTLZlSkmzG3xiBJSY0NmPMmeI6/LB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4B5QF/6e+HX9jJxWig0qRUwxP5maRoMapJtHATLxtxeOOfP1W9YEDVpAOUFaLTPLirqC5KJIebb6EV5LbImwy+hY5Gyq18iTtn5MSaWVAb8XMDLPEJ8q8VnxXQz/f4IJ4asnIUeQjxO/DTs8TI3Fqfe85puIJl61ZYf+8jAFmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Nono7JDe; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1734945660;
	bh=/EpobADO2cbWH0eXbO0AZ2hem6tegmxPwYL+X3TKWf0=;
	h=From:To:Cc:Subject:Date:From;
	b=Nono7JDenCHLGTkSVNVL/XAX+Zol+oEDx67zcUsHEGLkv3xgpZZAX8DGh6gNvxExX
	 qw2KKZhOaCfSEI/RcRFJ4wCJzpE2UZCpAhwmj4k37WGkbgateewEy/afNwJhGOcZJr
	 fM4WIqtb6mt2C1zpIDRUYNbl5KTHyZXAAMxtA5N4=
Received: from stargazer.. (unknown [IPv6:240e:454:8310:2b55:a9fa:ac23:79e1:1bb1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 8387765CE7;
	Mon, 23 Dec 2024 04:20:53 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>,
	stable@vger.kernel.org,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH] Revert "MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT"
Date: Mon, 23 Dec 2024 17:20:41 +0800
Message-ID: <20241223092041.257941-1-xry111@xry111.site>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6.

The commit has caused two issues on Loongson 3A4000:

1. The timestamp in dmesg become erratic, like:

    [3.736957] amdgpu 0000:04:00.0: ... ...
    [3.748895] [drm] Initialized amdgpu ... ...
    [18446744073.381141] amdgpu 0000:04:00:0: ... ...
    [1.613326] igb 0000:03:00.0 enp3s0: ... ...

2. More seriously, some workloads (for example, the test
   stdlib/test-cxa_atexit2 in the Glibc test suite) triggers an RCU
   stall and hang the system with a high probably (4 hangs out of 5
   tests).

Revert this commit to use jiffie on Loongson MIPS systems and fix these
issues for now.  The root cause may need more investigation.

Cc: stable@vger.kernel.org # 6.11+
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 467b10f4361a..5078ebf071ec 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1084,7 +1084,6 @@ config CSRC_IOASIC
 
 config CSRC_R4K
 	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
-	select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
 	bool
 
 config CSRC_SB1250
-- 
2.47.1


