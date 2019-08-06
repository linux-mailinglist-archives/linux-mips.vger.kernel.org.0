Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8659D83096
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 13:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbfHFLZm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 07:25:42 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43241 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfHFLZm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Aug 2019 07:25:42 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M8k65-1hz6Jj49jd-004lXd; Tue, 06 Aug 2019 13:25:11 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: fix vdso32 build, again
Date:   Tue,  6 Aug 2019 13:24:50 +0200
Message-Id: <20190806112509.3244608-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tO/9/ogRr4bq49wvtFsjMqiEM/g67IcuFQnQPhgC0dvaFZES6do
 OlodkhyJzcaUlj8yPvV6FTl8C2G92YAL1i1PlwpwX2J6QwOiVKeGnGjHTCxRbFu30QNIbAT
 2YNZAMFaWPnxbKEM/6tW1ObaR95gkjbi70KKIAda6F3xe/4ER1qdiETHtg0gEZOd4TlmNRC
 rgTB5ChE+OglZto5/nuWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NZiPuG2SpzM=:kx7Kz5EW9wktHhBlvjg5oO
 KbOlkmhGRCPmWY46mGnIpEqazZADvwPUwH+atGnrT95d5PIJFXHVLXreejD6+dFc5nm2Ru7qu
 u8fKKpKzGQrv479Sj6JABiogwuOgKIUzHQd+hlFv2+rJNEo1xdxWsHrS0zjt1e1r/eHPto4fc
 pxIyn+/7qUssiJa9emL7400pkywPlh46nASgze+QxHaW3yU63BAV+kjiWJ1adK4Jg/Z4gQ5UU
 r7Lw4HfJ23bRWmkHrD6FV+ffGhHYRf5RWlV98oWUjNvKr4HcOa/RKUkrvDiOrNKIJs8vdq6f4
 7uDskf7o5tT62etkkklDSfeHgPkbZ1UJYhHyUe4E7kJNYRR9HCMmOTLTOMBiLALxE5Yy9mp6W
 415dCzRwRjMf1poCdb/lx481E7jKEEqoVERXfkuUsriu2y5z5nCnRqifKp0z80pMqgCkLfwcl
 XXs5pRCVZicyUopNgfkw7X6MY8EpeYIThU8TTWtnjJfSHpTehxn7rvE9BHkWl28REU5KKxD7P
 F5LxdVG/e2D7D/YiP5YaPfbGce0oE95GJcjO7NGrM/o1PigZVUtZ7LhcT1F0UmGtb8EQBKUS1
 c26hgRYddkHRhyfajRqe4nvzc0f26/Pkt6ntJcWziKwU9SUFDXY19flWwa9v6Bn39IO2NbJ/m
 F3Vph5R8IpIk5sLRnSRrudGWiD6GditAx4aHqD3NZKGbTkDx+6xzMDkHXJaeKHjaYbXgonMDA
 r8TAdcOTIxUcXqVOjQyKmbIkaX8g8r99UVnYTg==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The generic vdso support adds the same #if hack in two places,
asm/vdso/vdso.h and config-n32-o32-env.c, but only the second
is actually used. The result lacks the BUILD_VDSO32_64 macro,
and that triggers a build error:

./include/linux/page-flags-layout.h:95:2: error: #error "Not enough bits in page flags"

Move the macro into the other place, and remove the duplicated
bits.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: ee38d94a0ad8 ("page flags: prioritize kasan bits over last-cpuid")
Fixes: 24640f233b46 ("mips: Add support for generic vDSO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Please fold into the vdso patch
---
 arch/mips/include/asm/vdso/vdso.h   | 11 -----------
 arch/mips/vdso/config-n32-o32-env.c |  1 +
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index 3b96db735f7f..737ddfc3411c 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -6,17 +6,6 @@
 
 #include <asm/sgidefs.h>
 
-#if _MIPS_SIM != _MIPS_SIM_ABI64 && defined(CONFIG_64BIT)
-
-/* Building 32-bit VDSO for the 64-bit kernel. Fake a 32-bit Kconfig. */
-#define BUILD_VDSO32_64
-#undef CONFIG_64BIT
-#define CONFIG_32BIT 1
-#ifndef __ASSEMBLY__
-#include <asm-generic/atomic64.h>
-#endif
-#endif
-
 #ifndef __ASSEMBLY__
 
 #include <asm/asm.h>
diff --git a/arch/mips/vdso/config-n32-o32-env.c b/arch/mips/vdso/config-n32-o32-env.c
index da4994b2b3e5..7f8d957abd4a 100644
--- a/arch/mips/vdso/config-n32-o32-env.c
+++ b/arch/mips/vdso/config-n32-o32-env.c
@@ -12,6 +12,7 @@
 
 #define CONFIG_32BIT 1
 #define CONFIG_GENERIC_ATOMIC64 1
+#define BUILD_VDSO32_64
 
 #endif
 
-- 
2.20.0

