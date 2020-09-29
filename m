Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826DF27C131
	for <lists+linux-mips@lfdr.de>; Tue, 29 Sep 2020 11:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgI2JbL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Sep 2020 05:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgI2JbI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Sep 2020 05:31:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F04CC0613D1;
        Tue, 29 Sep 2020 02:31:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a9so2353100pjg.1;
        Tue, 29 Sep 2020 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CY3K0infSPStetM+I0FUeXcgnHczq+S4Ugozc1bn/9Y=;
        b=Cg/9drkbmBJTY7T/O5xREjbf17JcQ+APiFnxZxsl+u1aTiSLbLLJNr190TyB2JIV+9
         /o92Fmi9x3h0d2WKLL44uhfj1DwxsDGCcJb15XidLjyTx8RZsEjjGEUOxpUizfxvyAlX
         HRnVzioOq6df2fZkGR008JlCp+v0KNCrnRuHwCm34BJafX6CkWLVkfsMRXx4U2oC6Sj1
         WuB7R0PXQDGhjw92aEwNxaBSPj7wA7WI2F0Bd29t4TfWZc9A3+ytKy4cMb82hSXYFmvH
         FuVpXrJs1Qtg1Gmss23SyYZPrcqgv/8coPCi6fQrZlR6Mgb4GYGY9PmJfu1sMatyCELI
         zDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CY3K0infSPStetM+I0FUeXcgnHczq+S4Ugozc1bn/9Y=;
        b=BvVRb09uynfx8v3b/O3nSMszqyrRYeoJsEnu+vlfY82RVJ7fP5djyaQL4eAOZKhRXS
         as5Y6v58jes9wuodNeGpARmI+4KCNB1uZ7wwwds8d9VI0OJFBOMyloGs5o4krza7L2EB
         hWfQ5S0JZH202G6IHyfFZuVjXPEgtCSjIvXEq/VJAxUUFP+TWJFGLkaNnb5qyOAlRH1V
         Y+BtIkDJGkbVxClM0IXKg8x2WlJ4o1TqmKZxK4aJPWmDcHXhsl3I0XAT8AXyyx7vcfuG
         gjMNj0xQkTKbiPEeFRrIaK8acb5cfFjiRJDLiFzwrl6Z2fTR71KxPQi0hfw4NJ/LpyQT
         kYdQ==
X-Gm-Message-State: AOAM531aXCmaPShlwhTJqyFN84uGcVUHYy+dlwvo587N5vVTg11QKfSL
        sRktJWE2y8y8cRcvs9guKA==
X-Google-Smtp-Source: ABdhPJxUgBgcMXL1t91kfPLzO0RPdhiVCiFx2U2jxerhItTP8z5Y/ggMW1/an8echYtYpxVyIom5wQ==
X-Received: by 2002:a17:90a:2841:: with SMTP id p1mr3006013pjf.222.1601371867916;
        Tue, 29 Sep 2020 02:31:07 -0700 (PDT)
Received: from localhost.localdomain ([47.242.140.181])
        by smtp.gmail.com with ESMTPSA id e11sm1966179pjr.2.2020.09.29.02.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 02:31:07 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Yousong Zhou <yszhou4tech@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pujin Shi <shipujin.t@gmail.com>
Subject: [PATCH 2/2] MIPS: process: include exec.h header in process.c
Date:   Tue, 29 Sep 2020 17:30:47 +0800
Message-Id: <20200929093047.1425-2-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200929093047.1425-1-shipujin.t@gmail.com>
References: <20200929093047.1425-1-shipujin.t@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

  arch/mips/kernel/process.c:696:15: error: no previous prototype for 'arch_align_stack' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
---
 arch/mips/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 37f05c8605c2..75ebd8d7bd5d 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/inst.h>
 #include <asm/stacktrace.h>
 #include <asm/irq_regs.h>
+#include <asm/exec.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
 void arch_cpu_idle_dead(void)
-- 
2.18.1

