Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98ECC1DF4C4
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 06:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEWEZI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 00:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWEZI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 00:25:08 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09036C061A0E
        for <linux-mips@vger.kernel.org>; Fri, 22 May 2020 21:25:07 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id b12so5202676plz.13
        for <linux-mips@vger.kernel.org>; Fri, 22 May 2020 21:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=9qseI4rnYBd8b6/1hNjWyLSGtCUpgP7T/OPG6dMhbuY=;
        b=DSe+0rRvIp2Z5t9BSip3qbsiKKedZjBaB5ooSBL/X1btjmbBnnF577kL2EM9fRE+kT
         9Dd/paytx4bkL1f/RRX2NxoKBHJyIaABYEIyQvhPqDCwVys0qWJWlIaim/OOAu1ACoc2
         Dl8ZRqVPgEm0RcUqIRnVBh6cYjOINSKB0GxyFvLkZg5/QzYYyrrpY0yiQDmdcPx9xDZS
         7qAvSfxAt8Es4wCYOHoP7SAraP/rCi3QICDCcvEcyAqxsiJqSVvYuAiN7iliFkGthKut
         KA6bKA2aBqr2jj1UMDakd2UnwgXU5XeT36oTS0b+wDJ3MulpUEymJZoWh1s+7OaQHDnS
         g02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=9qseI4rnYBd8b6/1hNjWyLSGtCUpgP7T/OPG6dMhbuY=;
        b=MDcvFS0NsHoPRWSg9SxCdv62AQ8lw3nyEl8OZY1hgnMXlnUKlAmFMMyQkj5vQKb80Z
         OYlLnxnIevZuGrzv8aQaLvuA2BS3cZGmhkSHkhPZSOoo+7ZR6ndVYz+jJ4EBx1u83Laj
         0g8DehzeArBn52F+BcDuKAoUrSdV7pbXZLmPr97LkKN4vYAjH0OQMGXpf8kQEgJUonep
         ejw4nCAS9Qij3epdbB1UoMLjuDEPwspMN51F92p1ZcLKXZl901OCKE1dvVa+LT7Wd2+L
         zbq45CF8OTvTcly4di6te2G/frg1SIGRNq5pKhJo/Zkjq+NPYwXWRhQYoxXN60fzQ5YC
         fbGg==
X-Gm-Message-State: AOAM533HE9+WH116ny1GG/g8zJcAKfi16BKcFNApy7OXhztJLZ/dIeVc
        3FTPYoP1MPR6XV3eVlX4N6o=
X-Google-Smtp-Source: ABdhPJztaw9RbCbjzrubKmrLA/FZJ5vAHX6J/28LK/UGBbodcXpvB153dao3ss05X5oMSZ11xnvX8g==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr8705340pjb.126.1590207907397;
        Fri, 22 May 2020 21:25:07 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id j17sm7223230pgk.66.2020.05.22.21.25.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 21:25:06 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Tidy up CP0.Config6 bits definition
Date:   Sat, 23 May 2020 12:25:40 +0800
Message-Id: <1590207940-20157-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CP0.Config6 is a Vendor-defined register whose bits definitions are
different from one to another. Recently, Xuerui's Loongson-3 patch and
Serge's P5600 patch make the definitions inconsistency and unclear. To
make life easy, this patch tidy the definition up.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mipsregs.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index fe6293f..e89eeb9 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -690,6 +690,12 @@
 #define MIPS_CONF6_JRCD		(_ULCAST_(1) << 0)
 /* MIPSr6 extensions enable */
 #define MIPS_CONF6_R6		(_ULCAST_(1) << 2)
+/* Loongson-3 internal timer bit */
+#define MIPS_CONF6_INTIMER	(_ULCAST_(1) << 6)
+/* Loongson-3 external timer bit */
+#define MIPS_CONF6_EXTIMER	(_ULCAST_(1) << 7)
+/* Loongson-3 SFB on/off bit */
+#define MIPS_CONF6_SFBEN	(_ULCAST_(1) << 8)
 /* IFU Performance Control */
 #define MIPS_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
 #define MIPS_CONF6_SYND		(_ULCAST_(1) << 13)
@@ -697,16 +703,16 @@
 #define MIPS_CONF6_SPCD		(_ULCAST_(1) << 14)
 /* proAptiv FTLB on/off bit */
 #define MIPS_CONF6_FTLBEN	(_ULCAST_(1) << 15)
+/* Loongson-3's LL on exclusive cacheline */
+#define MIPS_CONF6_LLEXC	(_ULCAST_(1) << 16)
+/* Loongson-3's SC has a random delay */
+#define MIPS_CONF6_SCRAND	(_ULCAST_(1) << 17)
 /* Disable load/store bonding */
 #define MIPS_CONF6_DLSB		(_ULCAST_(1) << 21)
 /* Loongson-3 FTLB on/off bit */
 #define MIPS_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
 /* FTLB probability bits */
 #define MIPS_CONF6_FTLBP_SHIFT	(16)
-/* Loongson-3 feature bits */
-#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
-#define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
-#define MIPS_CONF6_LOONGSON_STFILL	(_ULCAST_(1) << 8)
 
 #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
 
-- 
2.7.0

