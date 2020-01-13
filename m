Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49115138ED6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgAMKQn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:16:43 -0500
Received: from forward101p.mail.yandex.net ([77.88.28.101]:56700 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbgAMKQn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:16:43 -0500
Received: from mxback4g.mail.yandex.net (mxback4g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:165])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id D0E003281803;
        Mon, 13 Jan 2020 13:16:40 +0300 (MSK)
Received: from myt2-ea6a2e0cbf34.qloud-c.yandex.net (myt2-ea6a2e0cbf34.qloud-c.yandex.net [2a02:6b8:c00:2e8e:0:640:ea6a:2e0c])
        by mxback4g.mail.yandex.net (mxback/Yandex) with ESMTP id 94SFeUVJlu-Gea40tpZ;
        Mon, 13 Jan 2020 13:16:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910600;
        bh=TtPY94kS/Jzho/m65vWlpQBxzkqIZAkf5noHgvGvswQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=mx/nQW3Q8UTSzOK7maLX4bWqx3bVN2Fglw5ALSbOj0Tl3NgGgu6bx1pBLamjKjhzv
         CmlWU+GmTgKFhcxbCdaM3h3A0wjSMHVW+UwIrUA7+nt3sV19E/CLQOqnbfWANLulv7
         Aftey9+PBv5KIN9vwASdNcoH4Z5BTIxqnKQx7GJU=
Authentication-Results: mxback4g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt2-ea6a2e0cbf34.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id u1kiDDYFMW-GVV4YIvR;
        Mon, 13 Jan 2020 13:16:39 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Loongson64: Select mac2008 only feature
Date:   Mon, 13 Jan 2020 18:16:12 +0800
Message-Id: <20200113101612.38335-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113101612.38335-1-jiaxun.yang@flygoat.com>
References: <20200113101612.38335-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some Loongson-64 processor didn't set MAC2008 bit in fcsr,
but actually all Loongson64 processors are MAC2008 only.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 23aa8ed7cb9e..6e4ff2063971 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -47,5 +47,6 @@
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
 #define cpu_has_mips_r2_exec_hazard 0
+#define cpu_has_mac2008_only	1
 
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
-- 
2.24.1

