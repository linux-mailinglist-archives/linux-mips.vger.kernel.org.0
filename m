Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3436408395
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 06:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhIMEnZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 00:43:25 -0400
Received: from out0.migadu.com ([94.23.1.103]:16368 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhIMEnY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Sep 2021 00:43:24 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631508126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=fGKBxCK0qIA9IwjVuhdcF09CqepK7/bKFkb1ss+AiHE=;
        b=WwanunWj0i+c5c3vXNgn+SvH08a1ddDIM5MpU8CvoYOGYVbqXyPDvZZm6L8aYyTHebrgMD
        rM9rJIMWBApJS6rUP7D+NKOWhGgOc9se6XQSYITQAugfdzOmg+qEC6DJK/91P1fG7ElqtM
        jlgvP53fjI76AiGLAAtQYOAsn6jlEns=
From:   Jackie Liu <liu.yun@linux.dev>
To:     tsbogend@alpha.franken.de
Cc:     chenhc@lemote.com, linux-mips@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH v3] MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
Date:   Mon, 13 Sep 2021 12:41:39 +0800
Message-Id: <20210913044139.549459-1-liu.yun@linux.dev>
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
Suggested-by: Huacai Chen <chenhc@lemote.com>
Reported-by: k2ci robot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

---
 v1->v2:
 move MIPS_FP_SUPPORT from MACH_LOONGSON64 to CPU_LOONGSON64

 v2->v3:
 add Huacai Chen <chenhc@lemote.com>'s suggest label.

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

