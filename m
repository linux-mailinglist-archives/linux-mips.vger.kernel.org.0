Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2D147F1EF
	for <lists+linux-mips@lfdr.de>; Sat, 25 Dec 2021 05:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhLYEz3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Dec 2021 23:55:29 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57938 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhLYEzZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Dec 2021 23:55:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6278960C78;
        Sat, 25 Dec 2021 04:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D298C36AED;
        Sat, 25 Dec 2021 04:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640408124;
        bh=2zgLt5m4opNmUCEFSnx0Q5KUECGIsLc07ztCDJUJaOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rDZUQlpCKFHoVJUhEmnp3qJoPD/dkCpcxPxVab4pfzGV0bRYlto9zUDaUp2sJ1p3P
         QSv1tGv3cLd55dXRVh4qwy5EZmEETgCZ1rFV3yjxwxNFu8aZjCbYc+YAx9hDz8+mkN
         2bOp4wCHmGoJaiTy/468jP53YfU7u3mC0pxDUq7pcDsyjKCQxAIZ/cWNI0CY7nPwFL
         8tudlZG/ofnsRiynAt6BU413lHOAcGFvo+f/pS6EREBv6WRvwT77vOZdpcNcgddYWl
         pgE/+XNnE4ra9oS0Yff9+X2X8ojGenuNuheE/opao+eRHssOpXJ+O/Wa4sxh84eeXF
         Dkb/jNJpaRfeA==
From:   guoren@kernel.org
To:     guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
        benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        christophe.leroy@csgroup.eu
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
        linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 7/8] sched: arm64: Remove unused TASK_SIZE_OF
Date:   Sat, 25 Dec 2021 12:54:29 +0800
Message-Id: <20211225045430.2868608-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6f41b65f9962..d24dfb49237d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -65,8 +65,6 @@
 #endif /* CONFIG_ARM64_64K_PAGES */
 #define TASK_SIZE		(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : TASK_SIZE_64)
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_32BIT) ? \
-				TASK_SIZE_32 : TASK_SIZE_64)
 #define DEFAULT_MAP_WINDOW	(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : DEFAULT_MAP_WINDOW_64)
 #else
-- 
2.25.1

