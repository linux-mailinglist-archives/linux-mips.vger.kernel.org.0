Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC34A3D9F83
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 10:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbhG2I0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 04:26:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54808 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234673AbhG2I0H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Jul 2021 04:26:07 -0400
Received: from localhost.localdomain (unknown [117.81.121.223])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0MNZgJhqNElAA--.51294S2;
        Thu, 29 Jul 2021 16:25:53 +0800 (CST)
From:   Rui Wang <wangrui@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Rui Wang <wangrui@loongson.cn>, hev <r@hev.cc>
Subject: [RFC PATCH] locking/atomic: arch/mips: Fix atomic{_64,}_sub_if_positive
Date:   Thu, 29 Jul 2021 16:25:49 +0800
Message-Id: <20210729082549.144559-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH0MNZgJhqNElAA--.51294S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4rAFy8Xry8WF1rKryxuFg_yoW3uwc_C3
        Wxtws7ur1rAFWava47Ca1FkFyIkwn7W3Z3Wrn5XrnxA34vy34UCayDJr95Jw4UCw1vyr1F
        9FyaqryYkr47GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOnmRUUUUU
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This looks like a typo and that caused atomic64 test failed.

Signed-off-by: Rui Wang <wangrui@loongson.cn>
Signed-off-by: hev <r@hev.cc>
---
 arch/mips/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index 95e1f7f3597f..a0b9e7c1e4fc 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -206,7 +206,7 @@ ATOMIC_OPS(atomic64, xor, s64, ^=, xor, lld, scd)
  * The function returns the old value of @v minus @i.
  */
 #define ATOMIC_SIP_OP(pfx, type, op, ll, sc)				\
-static __inline__ int arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
+static __inline__ type arch_##pfx##_sub_if_positive(type i, pfx##_t * v)	\
 {									\
 	type temp, result;						\
 									\
-- 
2.32.0

