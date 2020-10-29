Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC3729F10C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 17:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgJ2QQ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 12:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgJ2QQ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Oct 2020 12:16:57 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D656C0613CF
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2020 09:16:55 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id k6so3636082ilq.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Oct 2020 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=vHPUoT+r47AtTIJ/he1v+PjAmHZ1mX38eQsIitk+3MY=;
        b=XC+K1/8Y9rnPJAY8bEdW8jE9ntqlBafuz1ipUG98z2ch5mhuvpIejkK4cE8GXtQ39U
         TaX1hmOO0TEg2p4RbmMSToM2FE651C6gEGLS9fSsWQY8ot4geb9LD6HIAMXtSdg+SS3b
         90UER/LoT4EF82Ek2VsqDYxXi5Cd5CJZLwicSL/V7LV3OnUWPVOZg1eZTG0XDMACggre
         cKDkSBAjD+9fCGc1Gtj+wFe578HWGnEc9+y2Pl2pRRPJHih+GHO6+vg7f6+IFH7mcbdo
         9cyTlO/1bjD5egh3JuX3dgAdnXDJZV7xtmr0ovU/KNm+SK8VBuIFH6XsJrIuoOsVSDXs
         SDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=vHPUoT+r47AtTIJ/he1v+PjAmHZ1mX38eQsIitk+3MY=;
        b=Ib6rY2oZzH1PYKrWBtf+Tre9tkuMgG1Nu0zNxXg+lJJ4Rz0KckIV0mnE+AYFFHLNcj
         G5mbk8NjxFoe7vaZmjP1RshPankK+kA/PI0JYe16Mqplbu0Zq6kNY78zuxeLEhXgq9ZM
         T4Sopq2WtQ5lk2bXmQ60lAmPjb5LxS7YjojzjM74+lhj3XYraW9Mj+/oXyyGuc51ptw2
         EUVraUb3wP0lcPx1IJgU/+Fe+7AndHSZrVSTWTPlunqpeKAIi1Z5ZZnaPAy/q/84ivl4
         XgVe5JoKn/5kFV7rSqfmGHqKC5Jr1qmpQYTmVG+rJw8uLhp00WVstRel4QMIXdGaY8Vy
         WOmA==
X-Gm-Message-State: AOAM533a8QXyOiP3e4SKFUi+5f+E5jLSsaHgGo4qWwuI+bFesCjIYNxj
        L4gi53bGbY/d4MT2V/cgMKlBuvR9r5wHxQ==
X-Google-Smtp-Source: ABdhPJzMvIfqJj5CShQEJwuj+HTPnI9n0P05PKGzDQ/2uPi1iu3+9/VkZN5rWqnv6DN7g6eW+l2T8Q==
X-Received: by 2002:a05:6e02:52c:: with SMTP id h12mr3853451ils.196.1603988214566;
        Thu, 29 Oct 2020 09:16:54 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id z15sm2670111ioj.22.2020.10.29.09.16.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:16:54 -0700 (PDT)
To:     linux-mips@vger.kernel.org
From:   Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] mips: add support for TIF_NOTIFY_SIGNAL
Message-ID: <116773a7-acc4-0f18-9249-532a844502ef@kernel.dk>
Date:   Thu, 29 Oct 2020 10:16:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wire up TIF_NOTIFY_SIGNAL handling for mips.

Cc: linux-mips@vger.kernel.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/mips/include/asm/thread_info.h | 4 +++-
 arch/mips/kernel/signal.c           | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
index ee26f9a4575d..e2c352da3877 100644
--- a/arch/mips/include/asm/thread_info.h
+++ b/arch/mips/include/asm/thread_info.h
@@ -115,6 +115,7 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_SECCOMP		4	/* secure computing */
 #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
 #define TIF_UPROBE		6	/* breakpointed or singlestepping */
+#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
 #define TIF_RESTORE_SIGMASK	9	/* restore signal mask in do_signal() */
 #define TIF_USEDFPU		16	/* FPU was used by this task this quantum (SMP) */
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
@@ -139,6 +140,7 @@ static inline struct thread_info *current_thread_info(void)
 #define _TIF_SECCOMP		(1<<TIF_SECCOMP)
 #define _TIF_NOTIFY_RESUME	(1<<TIF_NOTIFY_RESUME)
 #define _TIF_UPROBE		(1<<TIF_UPROBE)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_USEDFPU		(1<<TIF_USEDFPU)
 #define _TIF_NOHZ		(1<<TIF_NOHZ)
 #define _TIF_FIXADE		(1<<TIF_FIXADE)
@@ -164,7 +166,7 @@ static inline struct thread_info *current_thread_info(void)
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		\
 	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | _TIF_NOTIFY_RESUME |	\
-	 _TIF_UPROBE)
+	 _TIF_UPROBE | _TIF_NOTIFY_SIGNAL)
 /* work to do on any return to u-space */
 #define _TIF_ALLWORK_MASK	(_TIF_NOHZ | _TIF_WORK_MASK |		\
 				 _TIF_WORK_SYSCALL_EXIT |		\
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 50d0515bea21..f1e985109da0 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -903,7 +903,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
 		uprobe_notify_resume(regs);
 
 	/* deal with pending signal delivery */
-	if (thread_info_flags & _TIF_SIGPENDING)
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs);
 
 	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
-- 
2.29.0

-- 
Jens Axboe

