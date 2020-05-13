Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDE61D0AF0
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 10:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbgEMIi1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 04:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMIi0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 04:38:26 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED9DC061A0C
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 01:38:26 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g11so3317976plp.1
        for <linux-mips@vger.kernel.org>; Wed, 13 May 2020 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ZuT5U5K+Jmr1KhFFBa1toAHj13jIhvZlaGlRME/JSPM=;
        b=A070Bfkd6255zoqrtpNK4WuOYUYunnWTDZkN+k1VrFddyRgUqXNzrQScViG7SJRJkX
         k24DKjL2AuOE3ziFfO+fq+TXjJftgJCXzqlGf9KqHqxhsLxnhbl+tGhfeB6DyaVlAlnY
         h1BExUoeEkhF1OsTf3CKlPkhi9VGazNFp6PgZSURpet71A2SebxIshHBNmL5luudqdFo
         ArJ5ii+YL+cIklGL7UEXwJBoh92C7OG+R4V0YDnIte5mXgQ722a9nNsfI/kF/hEqvZq8
         i9EvueUQHWas1QF7JdVyhKYPOYHWtz0o7lxOFiuVmbN+XBdrK4iqsBLUzzm44ehMmSse
         MOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ZuT5U5K+Jmr1KhFFBa1toAHj13jIhvZlaGlRME/JSPM=;
        b=QYDW9SwOefWp4RjoGY1NVPZ1uWpso1yP+536jAEd/QzIyGp6dMBzxRj+P9HtneEe7G
         M4whma744Whxs7iVwS6OGHAYXNECnPXfdEYv5BvvqI3iDlgoArkD9jFsfHSA0ZzmYCFn
         EQmbvvW9KvAs4VFDNiGR2RyhOmJsyF8a7hJ22R2CFoiuXUStkvF2e1WA5D2ZpU79OlVu
         6pyWyqRupifmLkvASov0o2MORijqGRs/trjqPnoyblyUm1R1KoFTMW9P8/kYAxyZL1qJ
         Ok+v8LiUHW4QmwKQEepWfkjirwMhSiheCwpqA5z3kP91ASyMbS29x3ZD25iZzZtFN5YY
         9+4w==
X-Gm-Message-State: AGi0PuZgJAmlEw9SPXkC1wKGP6sOK0Ut1K0YI/lwF/dWr0FVby7mwdRK
        kG964eVUIWDr4CLHh7QLW1aHZ8o0IbL9/A==
X-Google-Smtp-Source: APiQypIz1Xj3PcAwXFfcloXJ0NkCcoW0dKP6Al9BNVwtw4E833gLJvQ8V0wPUOlCJ2vV0RZEyqNLEA==
X-Received: by 2002:a17:902:aa44:: with SMTP id c4mr23351074plr.302.1589359106427;
        Wed, 13 May 2020 01:38:26 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id p8sm15228329pjd.10.2020.05.13.01.38.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 May 2020 01:38:25 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/2] MIPS: Fix typos in arch/mips/Kbuild.platforms
Date:   Wed, 13 May 2020 16:38:40 +0800
Message-Id: <1589359121-1572-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
misspelled "txx9" to "tx99", so fix it.

Fixes: 26bff9eb49201aeb ("MIPS: Only include the platform file needed")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kbuild.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 5e3f6ed..c7368a8 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -36,8 +36,8 @@ platform-$(CONFIG_SIBYTE_SB1250)	+= sibyte/
 platform-$(CONFIG_SIBYTE_BCM1x55)	+= sibyte/
 platform-$(CONFIG_SIBYTE_BCM1x80)	+= sibyte/
 platform-$(CONFIG_SNI_RM)		+= sni/
-platform-$(CONFIG_MACH_TX39XX)		+= tx99/
-platform-$(CONFIG_MACH_TX49XX)		+= tx99/
+platform-$(CONFIG_MACH_TX39XX)		+= txx9/
+platform-$(CONFIG_MACH_TX49XX)		+= txx9/
 platform-$(CONFIG_MACH_VR41XX)		+= vr41xx/
 
 # include the platform specific files
-- 
2.7.0

