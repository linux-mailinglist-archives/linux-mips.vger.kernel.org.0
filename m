Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16CD7274F8B
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 05:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgIWD1q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 23:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIWD1q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 23:27:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E48C061755;
        Tue, 22 Sep 2020 20:27:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id y1so13505958pgk.8;
        Tue, 22 Sep 2020 20:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=N7U/rz7S29JZC5xmfTqQaexMO/Auh04+P82WcqlBJeo=;
        b=I+kMP/B5eYkW9/tgTGBW0PHEB0Mf7xFPH+bUirN06DW1gqHexWM+qwFtVYEuGR8+OA
         vgrz+r904D3VKgRIT/cXoNV1/vlJbjozSFlZZA7VGF+6KRhJsPXDFHZl1TAudeu4TVnx
         XRwDedx4g/nZpFK0T9OiotfXSEaV1BKtowrGIvBJlQvV358WecQdtTJ3gLVNO2WqiuqO
         eKPWGldqf1uIzTiNIMgdADDC6bJnHtT+j2pbssUclq6phd7r2uTcRYjRLlQdu3BWREoE
         ITBb4KktvmZ0Zf/5UxhD1l8mSxKlElMeDorZnAWXot6ibQSzWHl0hparxkpJk8vSYAw5
         aPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=N7U/rz7S29JZC5xmfTqQaexMO/Auh04+P82WcqlBJeo=;
        b=bm6eGof+SHqv+3yjucdf9jD53xpoKnrv6Sbq12/gwcsCSCvVTOM9FkD22WL3WYIz9u
         2H7JdBBmgmGskTBOPXVgnShdKpTMmtWhtSdr1C7BF7x7kXbHETnyUgkNMMnOnc9vvcib
         06TbMWNYSo35HyNhSLvygL2KoZ3rda2T5SnqfJkPzTwXBWPJ39o4ZG9vzXNvmTrjG5el
         xxF8FAtJnqDwcN8Cll8hAPecwXz97yrMbdurtIBXXad8AjVUyQnNlM7ipF0XOdgOLnTC
         o3XdxKCS+iWiQ2L41dan5K+MAegMubNCIJMWjfeIOFhZxuQ57+/u7El+jvlkWkRBRLZm
         YNKA==
X-Gm-Message-State: AOAM533RkU9OD2+UhVfZno4+eLF1oCSQpD7hiAX0pQWu9o2/+SyF7oLr
        jS86x8rOSvxSktptKEt1RSQfZEbf5mth
X-Google-Smtp-Source: ABdhPJxzQhXsh0QnyrWga/69Pgpz4CB9jRSpU/E3goQlS+gCHdPw7NOzq4DqtvCm7VVPqL4pdMH3Jg==
X-Received: by 2002:a63:170d:: with SMTP id x13mr5864856pgl.195.1600831666043;
        Tue, 22 Sep 2020 20:27:46 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id u14sm16216681pfm.80.2020.09.22.20.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 20:27:45 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        shipujin.t@gmail.com
Subject: [PATCH] MIPS: irq: Add missing prototypes for init_IRQ()
Date:   Wed, 23 Sep 2020 11:26:50 +0800
Message-Id: <20200923032650.1546-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

init_IRQ() have no prototype, add one in irq.h

Fix the following warnings (treated as error in W=1):
arch/mips/kernel/irq.c:52:13: error: no previous prototype for 'init_IRQ' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
---
 arch/mips/include/asm/irq.h | 1 +
 arch/mips/kernel/irq.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index c5d351786416..992f8040d3d9 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -21,6 +21,7 @@
 #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
 
 extern void *irq_stack[NR_CPUS];
+void init_IRQ(void);
 
 /*
  * The highest address on the IRQ stack contains a dummy frame put down in
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 85b6c60f285d..07d2c86e7ff5 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -21,6 +21,7 @@
 #include <linux/kallsyms.h>
 #include <linux/kgdb.h>
 #include <linux/ftrace.h>
+#include <asm/irq.h>
 
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
-- 
2.18.1

