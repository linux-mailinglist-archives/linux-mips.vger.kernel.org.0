Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CBBF6123
	for <lists+linux-mips@lfdr.de>; Sat,  9 Nov 2019 20:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfKITRu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Nov 2019 14:17:50 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41849 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfKITRu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Nov 2019 14:17:50 -0500
Received: by mail-pg1-f193.google.com with SMTP id h4so6315059pgv.8
        for <linux-mips@vger.kernel.org>; Sat, 09 Nov 2019 11:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=;
        b=lkiCealdzclaVAPsevr74tOpi5JiABXIsPgU1ZVyWip88uN0+FOgeLeKvj1vc4lJJ9
         FT0x0EoErJL5QQFJC5uWygVLO7Sex5+OJk+TbBSgzROcaOM9R/NSkTexwy+x9ekor8mP
         egLHNr2ujeun+0/0VYIG8MRz1J0x379phIBME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMGL0/JOFpPqKkGlrsxqclkHeaNLkWbgoH9TNGWPKSw=;
        b=tVB8nPl+PX4sN7wXrWnaEdU7EhfXiBeRxQVofzPx0zxx0Nvg085GT+An+Ky9ec6YDD
         cqbQC+fHjYJ6A2br7TpHqnQ9TO2IKo0MEzy/mbx7cLIOgHtqeISP7wwfjAAhILfAF9Xr
         Mvf4Tym9ySLWEr/6gzXiVpfD4XPRMDusYJ5/Cty6ypq5cHJlUzBFiG674xSriL40cdHp
         pnn75kNRyasIZNBetANv/81fdUUoUyULZH3PjVhwE+uNWPr4T9ND8SxdxdF26H4AdjRl
         N89Sf1PjAZc14FHzezhDMH1udZkrbi22l1fNxEhf0lQylH9dra44iEjDZ5p/YytBVuA9
         kLew==
X-Gm-Message-State: APjAAAV/PG1BnM6fCsldsuwWgDQ9i7+IWUjjFqNlHan3d0Xc7PdZhG7b
        ZT+FEkweESUE885s89/OcNcNBQ==
X-Google-Smtp-Source: APXvYqxnQkGYhPWPn3X9DGYKlVL1PWVPD0psI26vKilAG8d5p0YT0qXbyIrrGS21pCS3WIFLhz/pnA==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr19382177pgk.226.1573327069085;
        Sat, 09 Nov 2019 11:17:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 11:17:48 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Paul Burton <paul.burton@mips.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     qiaochong@loongson.cn, kgdb-bugreport@lists.sourceforge.net,
        ralf@linux-mips.org, Douglas Anderson <dianders@chromium.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/5] MIPS: kdb: Remove old workaround for backtracing on other CPUs
Date:   Sat,  9 Nov 2019 11:16:40 -0800
Message-Id: <20191109111623.1.I30a0cac4d9880040c8d41495bd9a567fe3e24989@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As of commit 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs
that aren't the master") we no longer need any special case for doing
stack dumps on CPUs that are not the kdb master.  Let's remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no way to test this personally, so hopefully someone who uses
kdb/kgdb on MIPS can.

Ideally this patch should be Acked by MIPS folks and then land through
the kdb/kgdb tree since the next patch in the series, ("kdb:
kdb_current_regs should be private") depends on it.

 arch/mips/kernel/traps.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 342e41de9d64..46fbcfeaae9a 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -210,11 +210,6 @@ void show_stack(struct task_struct *task, unsigned long *sp)
 			regs.regs[29] = task->thread.reg29;
 			regs.regs[31] = 0;
 			regs.cp0_epc = task->thread.reg31;
-#ifdef CONFIG_KGDB_KDB
-		} else if (atomic_read(&kgdb_active) != -1 &&
-			   kdb_current_regs) {
-			memcpy(&regs, kdb_current_regs, sizeof(regs));
-#endif /* CONFIG_KGDB_KDB */
 		} else {
 			prepare_frametrace(&regs);
 		}
-- 
2.24.0.432.g9d3f5f5b63-goog

