Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928E810515C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 12:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKUL05 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 06:26:57 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34924 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKUL05 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Nov 2019 06:26:57 -0500
Received: by mail-pf1-f193.google.com with SMTP id q13so1533235pff.2
        for <linux-mips@vger.kernel.org>; Thu, 21 Nov 2019 03:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FUmMpkNLSpVuy7/qSq0o0YVmZJIU4QE3QbjeY7FH5+c=;
        b=tG5QtpV5ZBcomJrrgQdVwPs7voMzdk9TqEapm63GuXSeGNgUwnyi2bqLUtEJDBCwJJ
         P0fti5DZWKqCiG3qV3GnrlX9nV1rCXzdjQYnlpxnkgEqrMzE+W+9Z3GpPu/OOQZ2/5Q9
         +XOW2zmZPGTlOHAGrFb1N9vdO5UNfdweiXMKlvBIrbmRxGCpRyXwBNpL135nEV0u7RDA
         +/Y4Tg39YM2YTcPO3zwKxuvX7EjX+UKad7Vp0vdjsUb+femxNCFT7hvg1L4gE19tsRVo
         2+mYvfqUmhQ8dRPj2qHGAy6aMXpD+L901qLJu7ePi4ivqlXREE86C22RzsNFVhZSRWBU
         gSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=FUmMpkNLSpVuy7/qSq0o0YVmZJIU4QE3QbjeY7FH5+c=;
        b=Hc+gB8/1H352AJk2SbhkXFZ8YWFBO8+CEznGScvTd0NfsTpzoGK2NI1LFr1aOkYwKZ
         2QJgyYXsHaKSjgymGEDTDTR9YD3vs8zIIOmJ196jaBx5qKjyZaZcpZ6sJ/H9izaNVbSE
         Myn5fo6LEpbNrPTt4Rhg5Za1uX2FguYO1XD6mLBxNg+utg6Nt0THYMM/ZYqJU6cm9/2r
         DdMmJmCnBazbavWi3dAhvzqs/CikPILDemOVo5iAbrpQshNgtP9qn0RHK0luy9eCiSKl
         o2Qzn+UUaz6/oDBynkCHtNMjWI8U3v1Z9GXuo/hbFE9/bq/hYcegoZibNWmIv4R1TFj1
         xsdg==
X-Gm-Message-State: APjAAAX14ERGW2/PraA0+ITTOZPnhArlnf1p21Ij99lHQ5h4Tow4qMx+
        QF4ielPPZNXrwJK4rX44xE8=
X-Google-Smtp-Source: APXvYqxtwrgJWUQEyvQJ1Kk8c90VgEwgC+yeKLUev5jkYeL5kdS2DRMRVcubJPJ6uJGg2Mk53sLmVg==
X-Received: by 2002:a65:5648:: with SMTP id m8mr9159030pgs.286.1574335616945;
        Thu, 21 Nov 2019 03:26:56 -0800 (PST)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id v14sm2747834pja.22.2019.11.21.03.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 21 Nov 2019 03:26:56 -0800 (PST)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Make sure ebase address is in KSEG0
Date:   Thu, 21 Nov 2019 19:30:20 +0800
Message-Id: <1574335820-15188-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dynamically allocated ebase address above 0x20000000 can be triggered
by some special physical memory layout, or just by a "big kernel + big
initrd + big swiotlb" configuration.

For MIPS32, ebase address above 0x20000000 is unusable, for MIPS64 it
is usable but this case is warned. However, this warning is useless
because it is unfixable in a specific system configuration. So we just
use CKSEG0 as a fallback.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/traps.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 9d9b2a4..7393f33 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2306,10 +2306,15 @@ void __init trap_init(void)
 		 * EVA is special though as it allows segments to be rearranged
 		 * and to become uncached during cache error handling.
 		 */
-		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
+		if (ebase_pa < 0x20000000)
 			ebase = CKSEG0ADDR(ebase_pa);
-		else
+		else if (IS_ENABLED(CONFIG_EVA))
 			ebase = (unsigned long)phys_to_virt(ebase_pa);
+		else {
+			memblock_free(ebase_pa, vec_size);
+			ebase = CKSEG0;
+			memblock_reserve(virt_to_phys((void *)ebase), vec_size);
+		}
 	}
 
 	if (cpu_has_mmips) {
-- 
2.7.0

