Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914D72D302E
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 17:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgLHQtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 11:49:31 -0500
Received: from aposti.net ([89.234.176.197]:60800 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbgLHQta (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Dec 2020 11:49:30 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE() and IF_ENABLED() macros
Date:   Tue,  8 Dec 2020 16:48:20 +0000
Message-Id: <20201208164821.2686082-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce a new header <linux/if_enabled.h>, that brings two new macros:
IF_ENABLED_OR_ELSE() and IF_ENABLED().

IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO is set
to 'y' or 'm', (b) otherwise. It is used internally to define the
IF_ENABLED() macro. The (a) and (b) arguments must be of the same type.

IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
or 'm', NULL otherwise. The (ptr) argument must be a pointer.

The IF_ENABLED() macro can be very useful to help GCC drop dead code.

For instance, consider the following:

    #ifdef CONFIG_FOO_SUSPEND
    static int foo_suspend(struct device *dev)
    {
       ...
    }
    #endif

    static struct pm_ops foo_ops = {
	#ifdef CONFIG_FOO_SUSPEND
        .suspend = foo_suspend,
	#endif
    };

While this works, the foo_suspend() macro is compiled conditionally,
only when CONFIG_FOO_SUSPEND is set. This is problematic, as there could
be a build bug in this function, we wouldn't have a way to know unless
the config option is set.

An alternative is to declare foo_suspend() always, but mark it as maybe
unused:

    static int __maybe_unused foo_suspend(struct device *dev)
    {
       ...
    }

    static struct pm_ops foo_ops = {
	#ifdef CONFIG_FOO_SUSPEND
        .suspend = foo_suspend,
	#endif
    };

Again, this works, but the __maybe_unused attribute is required to
instruct the compiler that the function may not be referenced anywhere,
and is safe to remove without making a fuss about it. This makes the
programmer responsible for tagging the functions that can be
garbage-collected.

With this patch, it is now possible to write the following:

    static int foo_suspend(struct device *dev)
    {
       ...
    }

    static struct pm_ops foo_ops = {
        .suspend = IF_ENABLED(CONFIG_FOO_SUSPEND, foo_suspend),
    };

The foo_suspend() function will now be automatically dropped by the
compiler, and it does not require any specific attribute.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 include/linux/if_enabled.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 include/linux/if_enabled.h

diff --git a/include/linux/if_enabled.h b/include/linux/if_enabled.h
new file mode 100644
index 000000000000..8189d1402340
--- /dev/null
+++ b/include/linux/if_enabled.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_IF_ENABLED_H
+#define __LINUX_IF_ENABLED_H
+
+#include <linux/build_bug.h>
+#include <linux/compiler_types.h>
+#include <linux/kconfig.h>
+
+/*
+ * IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO is set
+ * to 'y' or 'm', (b) otherwise.
+ */
+#define IF_ENABLED_OR_ELSE(option, a, b) \
+	(BUILD_BUG_ON_ZERO(__same_type((a), (b))) || IS_ENABLED(option) ? (a) : (b))
+
+/*
+ * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
+ * or 'm', NULL otherwise.
+ */
+#define IF_ENABLED(option, ptr) IF_ENABLED_OR_ELSE(option, ptr, NULL)
+
+#endif /* __LINUX_IF_ENABLED_H */
-- 
2.29.2

