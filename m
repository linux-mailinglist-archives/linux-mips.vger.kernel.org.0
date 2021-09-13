Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEEAF408394
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 06:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238429AbhIMEjM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 00:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237214AbhIMEjK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 00:39:10 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDDEC061574
        for <linux-mips@vger.kernel.org>; Sun, 12 Sep 2021 21:37:55 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631507873;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=hCN1RuCDgbRKHGlPoDxZyZTYqyMjI1Ya6JheLfLf6lU=;
        b=vh1tUIf20Y8p8JiXvdXodr+E8PBwd4JJ+7mnLjsO3F95Q1gUI0b0mFBS2MOGjlDtO6oxPY
        rOk40ICD9L9xJYJg/mBYRkXhqMV4W+eaHIpiOyrMWngxGQKlevaAL9KY/dZqoa49dzh4XK
        PA4nA8ZJQUiKh5nB7sXAJVZinugohSc=
From:   Jackie Liu <liu.yun@linux.dev>
To:     tsbogend@alpha.franken.de
Cc:     chenhc@lemote.com, linux-mips@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH v2] MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
Date:   Mon, 13 Sep 2021 12:37:27 +0800
Message-Id: <20210913043727.549110-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

mach/loongson64 fails to build when the FPU support is disabled:

arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’

Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
Reported-by: k2ci robot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 24e374266fdc..aea3aa16a38e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1408,6 +1408,7 @@ config CPU_LOONGSON64
 	select MIPS_ASID_BITS_VARIABLE
 	select MIPS_PGD_C0_CONTEXT
 	select MIPS_L1_CACHE_SHIFT_6
+	select MIPS_FP_SUPPORT
 	select GPIOLIB
 	select SWIOTLB
 	select HAVE_KVM
-- 
2.25.1

