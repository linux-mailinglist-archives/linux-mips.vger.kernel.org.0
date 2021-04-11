Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DB435B342
	for <lists+linux-mips@lfdr.de>; Sun, 11 Apr 2021 13:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhDKLFQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Apr 2021 07:05:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43806 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231405AbhDKLFQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 11 Apr 2021 07:05:16 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxvcjV13Jg6GgGAA--.8516S2;
        Sun, 11 Apr 2021 19:04:53 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix strnlen_user access check
Date:   Sun, 11 Apr 2021 19:04:52 +0800
Message-Id: <1618139092-4018-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxvcjV13Jg6GgGAA--.8516S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFyrJF47Xw4rAr4rJw4kCrg_yoWDZFX_Ca
        y7tw4kCw4kJFW2v3ZrWr45Ary8G348Jr9Y9Fn5t34ak3sIyryUWFZ7JrsIqr4UuasFv3Wr
        ZFWDJ3yfArnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8KwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOSoAUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") brought a problem for
strnlen_user(). Jump out when checking access_ok() with condition that
(s + strlen(s)) < __UA_LIMIT <= (s + n). The old __strnlen_user_asm()
just checked (ua_limit & s) without checking (ua_limit & (s + n)).
Therefore, find strlen form s to __UA_LIMIT - 1 in that condition.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/uaccess.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 91bc7fb..85ba0c8 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -630,8 +630,15 @@ static inline long strnlen_user(const char __user *s, long n)
 {
 	long res;
 
-	if (!access_ok(s, n))
-		return -0;
+	if (unlikely(n <= 0))
+		return 0;
+
+	if (!access_ok(s, n)) {
+		if (!access_ok(s, 0))
+			return 0;
+
+		n = __UA_LIMIT - (unsigned long)s - 1;
+	}
 
 	might_fault();
 	__asm__ __volatile__(
-- 
2.1.0

