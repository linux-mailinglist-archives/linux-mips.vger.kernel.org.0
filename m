Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899273174BD
	for <lists+linux-mips@lfdr.de>; Thu, 11 Feb 2021 00:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhBJXvS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 18:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbhBJXvK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 18:51:10 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2D0C061756
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 15:50:30 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id q20so2399859pfu.8
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 15:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nB1yr3qDkVCTdVwm0nMnu9V13Apgu7MWUiqtmhmYKfU=;
        b=NqRxjjBmEQAsi72++zhFkSNWvTAzx4aeqOdq4X5j9yO2mOZ3h0Zb5P11tpAJGkFnFL
         ha/C2bPPtrF5JxWXqkIMJ8dsB1cBqZct1OfiSFmxlhuousjJvkvM+NM86BlTAgwfBb2h
         rbW8wkedyqGfjWz3bW5gc4yN+EUjGxyNfXCzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nB1yr3qDkVCTdVwm0nMnu9V13Apgu7MWUiqtmhmYKfU=;
        b=J7cj5RDpckHB9w3yrgffYDCAZLgW8XKX8Q/AfJobhq2k2sUebxaqheX23SyQI3jNqO
         PRWRvZWFDGras8qQi109E+LMtEeGJfKpZ4BDz9hkTQmqovvxzShqyzcP3+/xUqA2aaZ9
         li1v20CrAKfOHL1y2AE18KtiU94urSUGOI5f99gB/MGynTUEENF0A0EYyp5Gd0zlhlul
         Lk8z2t3pOvl3u6Dcs3ta7BL7y6fAK9EcHzjRxnjHtoUJrh6Rf1C3yYKbnCJ6nIglb04e
         OIgT4iNQSRSE0nySln5MSnVJiX351VmuDcT3x6d/JEApf5i/6i+pUZqVYbrWjAtD+KE/
         OOSA==
X-Gm-Message-State: AOAM532Jvi0ZuHdJqJ0RpYkHdq2mcRpUrv6P/rTChQtcr/cntlgTByTg
        dOjW5Mia+cAdklMbeYnDJr4Se5SsCpGHkw==
X-Google-Smtp-Source: ABdhPJzmAQf7vUPz+tI9vvMsv8++6Cx9aV2f6+mzqSDesBUYlQfrTMCOY0BX/FjwTLu5q7S8VOxzdA==
X-Received: by 2002:a63:30c5:: with SMTP id w188mr1461291pgw.375.1613001029861;
        Wed, 10 Feb 2021 15:50:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s1sm3112376pjz.42.2021.02.10.15.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 15:50:29 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips: Replace lkml.org links with lore
Date:   Wed, 10 Feb 2021 15:50:25 -0800
Message-Id: <20210210235025.3072842-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=8efe7d85fb8d015b54257b9d82450ef35065287d; i=ha9t3r7ayMelqY5gYpQl2x7ZWXuPG/bR4H1jUt5wwyo=; m=kc8NgBcNkR1FdAUFoBcecPqIFWVDlhJwDI99K+gzg58=; p=nrsQ/mt1GyqOL91SUdtIh38ZJvesni7qMzMRUEqwGdQ=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmAkcUAACgkQiXL039xtwCYklxAAk3+ nqihc78kp+GELIgMfinhnaNSeOD6akvwFI4NDbGmjUbBcV+RIljnhWdDkNCfbdNZ9rgfWoK2U9Xz8 BUagZYgCOTaukjADHBEq6rCkQ72WUaEaWDNi8fjaNWBNjVe00CdQKD6ctVWIV6hNsFyQFJk5hkmsp TJOiCn30eIKRkfR3xg5uMp6j4eMvmF28LA4w+w+uUlye7S9Ys8qQWoIS1EJijKvhd3tZb/TgcfI4r GGxj7AgGblyYmtJ1mn+Xks4KpDtcWewJzrXmz3YBFu9SntQmrHq8smMrtsos7Ctdzagg4pF6KjAPC 6B+YOWqJLLbcfRhexz/zZHP4XZPaLfIzyVxnNs//PIsyxH/pOhdP4LjIECyE+10+oRFP7eL6dv1fw YiJgSEnfvofeGyL9RwWNpDYDrHWczjxQ2Lffxy3gZNtKY9M5oM7HXwMhl+y09PsJA2gZ5ZC5SnNnK F+ZRfw9Fz+VcXDrsWRrN/uTlfoZ8/ekzhz3oeYkAJ6G85BudJL4Hg5qw/bgK+LtGQ9aK2qH1nM48q vb+naXUuxxGrSme9UcXvoErE7U5tdCbyWJq0vV5eW7CDj/RkvhNEuYXXdfxmVtL6UzRFRTpwVD16G I1v0WigynBHvNEnj1SDNi57EpDT0K0s8X2CbD7wDUlOEqKX/hnikVRfXp2ng6siU=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
links with lore"), replace lkml.org links with lore to better use a
single source that's more likely to stay available long-term.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
This patch may make more sense if this entire comment and the related
code is fixed instead (gcc 3.x has been quite retired...)
---
 arch/mips/include/asm/page.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index 74082e35d57c..65acab9c41f9 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -202,14 +202,13 @@ static inline unsigned long ___pa(unsigned long x)
 /*
  * RELOC_HIDE was originally added by 6007b903dfe5f1d13e0c711ac2894bdd4a61b1ad
  * (lmo) rsp. 8431fd094d625b94d364fe393076ccef88e6ce18 (kernel.org).  The
- * discussion can be found in lkml posting
- * <a2ebde260608230500o3407b108hc03debb9da6e62c@mail.gmail.com> which is
- * archived at http://lists.linuxcoding.com/kernel/2006-q3/msg17360.html
+ * discussion can be found in
+ * https://lore.kernel.org/lkml/a2ebde260608230500o3407b108hc03debb9da6e62c@mail.gmail.com
  *
  * It is unclear if the misscompilations mentioned in
- * http://lkml.org/lkml/2010/8/8/138 also affect MIPS so we keep this one
- * until GCC 3.x has been retired before we can apply
- * https://patchwork.linux-mips.org/patch/1541/
+ * https://lore.kernel.org/lkml/1281303490-390-1-git-send-email-namhyung@gmail.com
+ * also affect MIPS so we keep this one until GCC 3.x has been retired
+ * before we can apply https://patchwork.linux-mips.org/patch/1541/
  */
 
 #ifndef __pa_symbol
-- 
2.25.1

