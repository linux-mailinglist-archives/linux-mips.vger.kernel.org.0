Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7142C138ECD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgAMKPi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:15:38 -0500
Received: from forward100o.mail.yandex.net ([37.140.190.180]:49762 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbgAMKPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:15:38 -0500
Received: from mxback7j.mail.yandex.net (mxback7j.mail.yandex.net [IPv6:2a02:6b8:0:1619::110])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id AB8EB4AC1730;
        Mon, 13 Jan 2020 13:15:35 +0300 (MSK)
Received: from myt4-ee976ce519ac.qloud-c.yandex.net (myt4-ee976ce519ac.qloud-c.yandex.net [2a02:6b8:c00:1da4:0:640:ee97:6ce5])
        by mxback7j.mail.yandex.net (mxback/Yandex) with ESMTP id ZDulr1oRqN-FZkakkFO;
        Mon, 13 Jan 2020 13:15:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910535;
        bh=YfizjYxlV5Q/zSWO3Voct7ZQ0gYO9260ZL6PffmuiVE=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=wjHzoUKt+rd/shkJKNGuyonVWE1xqnOn90pFBYiO6tW/SeIqCn4k7hKyjdTpcyPvy
         aXaTqLRdTG4SkqA7Cw8uvzzxulawMCwLpVlggFx2lJ4fXBKWiu6ucDENvQemQpAEnG
         KingDql5PY7DSPjf6NYkZ22sZkNyrxXH6ee3zQtY=
Authentication-Results: mxback7j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt4-ee976ce519ac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 2dzM4Y3ZVr-FTWKjnf0;
        Mon, 13 Jan 2020 13:15:32 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/3] MIPS: Loongson64: Disable exec hazard
Date:   Mon, 13 Jan 2020 18:15:01 +0800
Message-Id: <20200113101501.37985-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113101501.37985-1-jiaxun.yang@flygoat.com>
References: <20200113101501.37985-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson64 has hardware mechanism to prevent hazard issue,
so we can simply disable exec hazard in cpu-features.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 7dc8d75445a9..23aa8ed7cb9e 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -46,5 +46,6 @@
 #define cpu_has_wsbh		1
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
+#define cpu_has_mips_r2_exec_hazard 0
 
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
-- 
2.24.1

