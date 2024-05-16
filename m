Return-Path: <linux-mips+bounces-3283-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBC8C76D0
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 14:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAB381C20F65
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 12:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FF4145A17;
	Thu, 16 May 2024 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="OZ6a9/Sh"
X-Original-To: linux-mips@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60461335B5;
	Thu, 16 May 2024 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715863694; cv=none; b=Crxnrm/X45q/tKYWwLJe/K8ejO7W3r4WjRtt0ZTYqLooti0w8omTF5qcalnIzvW1qwHBbKsIIFzO3J9o+2GNY81jey5Xdl0vEy3tsY+9JNu4Tdf6jwEPBD/HJ8C7zU9qX3N0QOvuZB/SwnAJevc6QkhggPW0oWdYJDw7KbLxJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715863694; c=relaxed/simple;
	bh=gKmc573CtTeaZFruajBi8whb3uaaHPFcFemzrj7BzCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dtbsVfchScDfUMjegs5etFCLLrOUAoOutkEaNzqQE9mRzMxcjKOMTDJMXo4Cqo6wWuOUefVC49cAFmTrscppdVoiUsWV5bNzSuKPI3QkF2KieowoC+L1O8BLodhZGTdNdi1OJNWAe0ghIUv/78tWDFQqpteTEUEKgnnwlt2iEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=OZ6a9/Sh; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=p5ICnfKj+P66UxcPsMwgRbXDkcNOihM/16tMz/EFdUc=;
	b=OZ6a9/Sh+KMQq8I6Jn0Ok1zxjwIg2hZIKF821g6G7A1p3E2wtTShxDNb5xr1/1
	TkOVoEMrG1csRt/95ugwzIlKX9M4RYve4sY2/4tz6YrjARue7GN0o3F7DFjD4Ti+
	rsGp4gVf40T98458RHO5XTiT9+1G2akFPRs71BHMzQMWI=
Received: from localhost.localdomain (unknown [116.128.244.171])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wDHD+tp9UVmXt_9Bw--.21873S5;
	Thu, 16 May 2024 20:01:57 +0800 (CST)
From: Genjian <zhanggenjian@126.com>
To: tsbogend@alpha.franken.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	ricardo@marliere.net
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH 2/3] MIPS: sgi-ip22: Add prototypes for several functions to header
Date: Thu, 16 May 2024 19:59:05 +0800
Message-Id: <20240516115906.1224164-2-zhanggenjian@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516115906.1224164-1-zhanggenjian@126.com>
References: <20240516115906.1224164-1-zhanggenjian@126.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHD+tp9UVmXt_9Bw--.21873S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4kXr18Zr4UZF43Cw1Dtrb_yoW8uw4fpF
	WDA3Z7GrW2grWkXa4rAryUur13Z3Z8C3yFyr4Utr9FqF1xWry5JrnYqr98Xrn8WrWDZ3WF
	gFyruanrKr4I93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
X-CM-SenderInfo: x2kd0wxjhqyxldq6ij2wof0z/1tbiHhTgfmV20wENggACsY

From: Genjian Zhang <zhanggenjian@kylinos.cn>

This fixes the following build warning:

arch/mips/sgi-ip22/ip22-time.c:119:18: error: no previous prototype for ‘indy_8254timer_irq’ [-Werror=missing-prototypes]
arch/mips/sgi-ip22/ip22-berr.c:89:6: error: no previous prototype for ‘ip22_be_interrupt’ [-Werror=missing-prototypes]
arch/mips/sgi-ip22/ip22-berr.c:113:13: error: no previous prototype for ‘ip22_be_init’ [-Werror=missing-prototypes]

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
---
 arch/mips/include/asm/sgi/ip22.h | 3 +++
 arch/mips/sgi-ip22/ip22-int.c    | 2 --
 arch/mips/sgi-ip22/ip22-setup.c  | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/sgi/ip22.h b/arch/mips/include/asm/sgi/ip22.h
index 87ec9eaa04e3..57942afb5c86 100644
--- a/arch/mips/include/asm/sgi/ip22.h
+++ b/arch/mips/include/asm/sgi/ip22.h
@@ -76,5 +76,8 @@
 
 extern unsigned short ip22_eeprom_read(unsigned int *ctrl, int reg);
 extern unsigned short ip22_nvram_read(int reg);
+extern void ip22_be_interrupt(int irq);
+extern void ip22_be_init(void) __init;
+extern void indy_8254timer_irq(void);
 
 #endif
diff --git a/arch/mips/sgi-ip22/ip22-int.c b/arch/mips/sgi-ip22/ip22-int.c
index 96798a4ab2de..11f8adc98cb5 100644
--- a/arch/mips/sgi-ip22/ip22-int.c
+++ b/arch/mips/sgi-ip22/ip22-int.c
@@ -165,8 +165,6 @@ static void __irq_entry indy_buserror_irq(void)
 #define SGI_INTERRUPTS	SGINT_LOCAL3
 #endif
 
-extern void indy_8254timer_irq(void);
-
 /*
  * IRQs on the INDY look basically (barring software IRQs which we don't use
  * at all) like:
diff --git a/arch/mips/sgi-ip22/ip22-setup.c b/arch/mips/sgi-ip22/ip22-setup.c
index b69daa02401b..e06a818fe792 100644
--- a/arch/mips/sgi-ip22/ip22-setup.c
+++ b/arch/mips/sgi-ip22/ip22-setup.c
@@ -26,8 +26,6 @@
 #include <asm/sgi/hpc3.h>
 #include <asm/sgi/ip22.h>
 
-extern void ip22_be_init(void) __init;
-
 void __init plat_mem_setup(void)
 {
 	char *ctype;
-- 
2.25.1


