Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A6E44F106
	for <lists+linux-mips@lfdr.de>; Sat, 13 Nov 2021 04:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhKMD25 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 22:28:57 -0500
Received: from smtpbg127.qq.com ([109.244.180.96]:43670 "EHLO smtpbg.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232723AbhKMD24 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Nov 2021 22:28:56 -0500
X-QQ-mid: bizesmtp52t1636773955tyfgjv3h
Received: from localhost.localdomain (unknown [125.69.41.88])
        by esmtp6.qq.com (ESMTP) with 
        id ; Sat, 13 Nov 2021 11:25:54 +0800 (CST)
X-QQ-SSF: 01000000000000C0F000B00A0000000
X-QQ-FEAT: dpyQmELDBxGupUERX8pQOyMsiq0qH4m5YZX4EbO/tnvunhGqmMNPTEJjooxdC
        8FIjIYPMHDukFXM1Gq7kMhtFOyWW6K8vF7Pd6LDSFDE36EbhzPYdHDErAWF4jOhRuxUtvLf
        GaA+HGbfwUz1eCF2t3gwsmQUKd4tJzgYW+K3wxs7NGKeuGODDoN+ztzZgvFLyPJnf2ELzBY
        62TlwFySUvK5jyoRflscujaoO88xCuRfsPlzd6YVfCbJvjZ1at2BuisjQH4Ts2qka2NxwOI
        j1AXjLDBs7lOM90PLPQUsK6bx6eJThRyDF5QLTIqqdH/JBY1LykRr5o9BgNG6Uh60LXdmNT
        L8YgVS5jQR6Tr5oS8zgqL4zkDYR0w==
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     tsbogend@alpha.franken.de
Cc:     rdunlap@infradead.org, wangborong@cdjrlc.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Remove a repeated word in a comment
Date:   Sat, 13 Nov 2021 11:25:52 +0800
Message-Id: <20211113032552.53817-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The repeated word `the' in a comment is redundant, thus one
of them was removed from the comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/mips/mm/c-octeon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index ec2ae501539a..490322b01f91 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -332,7 +332,7 @@ static void co_cache_error_call_notifiers(unsigned long val)
 }
 
 /*
- * Called when the the exception is recoverable
+ * Called when the exception is recoverable
  */
 
 asmlinkage void cache_parity_error_octeon_recoverable(void)
-- 
2.33.0

