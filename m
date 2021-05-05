Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9A537472F
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbhEERuO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 13:50:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:37716 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbhEERsY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 13:48:24 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 145HjRDo032362;
        Thu, 6 May 2021 02:45:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 145HjRDo032362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620236728;
        bh=ZwtjVnWqo8TSSCO4VBrdF2kvET+waOjAzWk0GOoIa3U=;
        h=From:To:Cc:Subject:Date:From;
        b=PY+gVRPOuxsBtXAAbnAinwvlMA5ksgejiITtbcGRcTKhbmO+Z35c+X1zArMi1MxvI
         QcUUOMbuFVxkHnZSVPU/vRIff9Gy+RJq2aZUZKDismP4tNMROFiG12UVywcDkHlkAE
         Zy1vxqPVXyUvoRvHpVQL7Lo3yKf3jPxiLyq924aIsHVAEB5yH7A7mMieG0gZxA4zMf
         mrg9PGe1kPi84IME7JHc9RwpfeFTYrOMconrBYDHSbRxg8xQV9cilBV+I0L/xmpgOP
         zItdvCjFmKdhpKT5dF1l0RFqsolCId+AGwzvoihp71dlZ91LeTH+bCMIWMVEOt+RXm
         6Y2+VpLwb2Lfw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, chao <chao@eero.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v2] linux/kconfig.h: replace IF_ENABLED() with PTR_IF() in <linux/kernel.h>
Date:   Thu,  6 May 2021 02:45:15 +0900
Message-Id: <20210505174515.87565-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

<linux/kconfig.h> is included from all the kernel-space source files,
including C, assembly, linker scripts. It is intended to contain a
minimal set of macros to evaluate CONFIG options.

IF_ENABLED() is an intruder here because (x ? y : z) is C code, which
should not be included from assembly files or linker scripts.

Also, <linux/kconfig.h> is no longer self-contained because NULL is
defined in <linux/stddef.h>.

Move IF_ENABLED() out to <linux/kernel.h> as PTR_IF(). PTF_IF()
takes the general boolean expression instead of a CONFIG option
so that it fits better in <linux/kernel.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Keep PTF_IF macro in pinctrl-ingenic.c

 drivers/pinctrl/pinctrl-ingenic.c | 2 ++
 include/linux/kconfig.h           | 6 ------
 include/linux/kernel.h            | 2 ++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 651a36b9dcc0..0ee69f8e20b2 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3854,6 +3854,8 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define IF_ENABLED(cfg, ptr)	PTR_IF(IS_ENABLED(cfg), (ptr))
+
 static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{
 		.compatible = "ingenic,jz4730-pinctrl",
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 24a59cb06963..cc8fa109cfa3 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -70,10 +70,4 @@
  */
 #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
 
-/*
- * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
- * or 'm', NULL otherwise.
- */
-#define IF_ENABLED(option, ptr) (IS_ENABLED(option) ? (ptr) : NULL)
-
 #endif /* __LINUX_KCONFIG_H */
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b7ed6dc99ac..8685ca4cf287 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -38,6 +38,8 @@
 #define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
 #define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
 
+#define PTR_IF(cond, ptr)	((cond) ? (ptr) : NULL)
+
 /* generic data direction definitions */
 #define READ			0
 #define WRITE			1
-- 
2.27.0

