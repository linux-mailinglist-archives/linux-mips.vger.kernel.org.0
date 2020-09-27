Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DD727A01F
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 11:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgI0J0j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 05:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0J0j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Sep 2020 05:26:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AE3C0613CE;
        Sun, 27 Sep 2020 02:26:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j7so1736914plk.11;
        Sun, 27 Sep 2020 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pA6yXzA3gbp0YSOhR5m53LA5ya/f3gk0sBhTHh1xSe4=;
        b=sWWabTOBCy19tx3G8lYZrn3AFCh17mQ9gkrcB2Q1ng2XZ1f6QMxnprzKbFvf+cZJDk
         Ba1LDHfhyVq5q8BQ4xaASpCXB2zWhkicXT0jt7OxhMBhuhjphF7cv2XuUu+LaAe1nqln
         p+C5YpnqI+J8gurtfB+r2D6/YhspzycTXCSsJMyQLEGMQFUJB3HToOupwjzzI52Izjhj
         mSkUREpelIyjxB3lLJ2WNpwD8I+Rgy6JjOY6KzIMvteMgEAKlH/pjf2KeNoyYWsdziGX
         6N8L41cT4STRdJDsrVmUatlT+OG4ao76sXLehSV03DHvShmxzgnjyaVnQ0VZQ2Qy5rO6
         VZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pA6yXzA3gbp0YSOhR5m53LA5ya/f3gk0sBhTHh1xSe4=;
        b=LDGQ6AuplFTL9+Ahrxrhl6q7qeSXx7zbmwpv2IEkS2o7m9WVBw8+7qvTrh31MYGIvF
         JM3Q6d/gD+JHN6+vr9NzibrVV44KTDqg7DrRqz7Sf4iYdFCN1li7J26OYuStZeR4Qpb/
         x1OqMuJO+Lt/m4g/AGaoWwe0vkx443sayIgqzcn5F4AEKhswU72+Ls8a9ZdAX0SCUtNs
         /ffgvfvAnMdwTn4sSoLMw0oCf0Dba+C4FW4d4l3Aw3AgwdOG/pceC44JqwPfdLJIIKbB
         JK12+Rb1fNob8vuuNesY6PV4MIqLvNd950b3VxE6m22sQ4G8vonfL2m9l1zWQupMYLCg
         Kldg==
X-Gm-Message-State: AOAM533kvvDMoGpu57+iIyyWaM8ykP7v7MqyDU/GlA6OYRAxIfYLcUU+
        Y6NGbaO/+c9pqnkQh2L9DA==
X-Google-Smtp-Source: ABdhPJyx3SGakbayI57YaH92av735mygahVZKXiNrXaasK3ixDF+bJPcxHgMN/aWBK/0VWmk65Devw==
X-Received: by 2002:a17:90b:1649:: with SMTP id il9mr4845770pjb.94.1601198798650;
        Sun, 27 Sep 2020 02:26:38 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id h15sm7910943pfo.194.2020.09.27.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 02:26:37 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Kees Cook <keescook@chromium.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        shipujin.t@gmail.com
Subject: [PATCH] MIPS: mm: Fix build error
Date:   Sun, 27 Sep 2020 17:26:10 +0800
Message-Id: <20200927092610.1378-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/mm/init.c: In function 'mem_init':
././include/linux/compiler_types.h:319:38: error: call to '__compiletime_assert_321' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
././include/linux/compiler_types.h:300:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
././include/linux/compiler_types.h:319:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
./include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^
arch/mips/mm/init.c:458:2: note: in expansion of macro 'BUILD_BUG_ON'
  BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
  ^

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
---
 arch/mips/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6c7bbfe35ba3..71dfdf1cb88a 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -455,7 +455,7 @@ void __init mem_init(void)
 	 * When _PFN_SHIFT is greater than PAGE_SHIFT we won't have enough PTE
 	 * bits to hold a full 32b physical address on MIPS32 systems.
 	 */
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
+	WARN_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
 
 #ifdef CONFIG_HIGHMEM
 #ifdef CONFIG_DISCONTIGMEM
-- 
2.18.1

