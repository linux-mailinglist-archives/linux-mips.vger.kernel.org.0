Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2F1426A3B
	for <lists+linux-mips@lfdr.de>; Fri,  8 Oct 2021 13:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240970AbhJHL4j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 07:56:39 -0400
Received: from foss.arm.com ([217.140.110.172]:46370 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240820AbhJHL4d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Oct 2021 07:56:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480F31063;
        Fri,  8 Oct 2021 04:54:37 -0700 (PDT)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C70F3F766;
        Fri,  8 Oct 2021 04:54:29 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
        song.bao.hua@hisilicon.com, tim.c.chen@linux.intel.com,
        jonathan.cameron@huawei.com, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Sergei Trofimovich <slyfox@gentoo.org>,
        David Hildenbrand <david@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Chris Down <chris@chrisdown.name>,
        Vipin Sharma <vipinsh@google.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Frederic Weisbecker <frederic@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: [PATCH 1/2] sched: Move Kconfig.preempt to sched/Kconfig
Date:   Fri,  8 Oct 2021 12:53:46 +0100
Message-Id: <20211008115347.425234-2-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008115347.425234-1-valentin.schneider@arm.com>
References: <20211008115347.425234-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Kconfig.preempt already contains more than just preemption configs (see
CONFIG_SCHED_CORE), and a subsequent patch will introduce more
scheduler-specific configs.

Move the file to the scheduler directory.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 init/Kconfig                              | 2 +-
 kernel/{Kconfig.preempt => sched/Kconfig} | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename kernel/{Kconfig.preempt => sched/Kconfig} (99%)

diff --git a/init/Kconfig b/init/Kconfig
index 11f8a845f259..4caedc821b06 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -460,7 +460,7 @@ config AUDITSYSCALL
 source "kernel/irq/Kconfig"
 source "kernel/time/Kconfig"
 source "kernel/bpf/Kconfig"
-source "kernel/Kconfig.preempt"
+source "kernel/sched/Kconfig"
 
 menu "CPU/Task time and stats accounting"
 
diff --git a/kernel/Kconfig.preempt b/kernel/sched/Kconfig
similarity index 99%
rename from kernel/Kconfig.preempt
rename to kernel/sched/Kconfig
index 60f1bfc3c7b2..c8b8e12c9c9c 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/sched/Kconfig
@@ -131,5 +131,3 @@ config SCHED_CORE
 	  SCHED_CORE is default disabled. When it is enabled and unused,
 	  which is the likely usage by Linux distributions, there should
 	  be no measurable impact on performance.
-
-
-- 
2.25.1

