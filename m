Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E41985A87
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2019 08:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbfHHGV3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Aug 2019 02:21:29 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52355 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731005AbfHHGV1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Aug 2019 02:21:27 -0400
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
        (Authenticated sender: alex@ghiti.fr)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1AE39E0004;
        Thu,  8 Aug 2019 06:21:18 +0000 (UTC)
From:   Alexandre Ghiti <alex@ghiti.fr>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v6 03/14] arm64: Consider stack randomization for mmap base only when necessary
Date:   Thu,  8 Aug 2019 02:17:45 -0400
Message-Id: <20190808061756.19712-4-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808061756.19712-1-alex@ghiti.fr>
References: <20190808061756.19712-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Do not offset mmap base address because of stack randomization if
current task does not want randomization.
Note that x86 already implements this behaviour.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/arm64/mm/mmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index bb0140afed66..e4acaead67de 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -54,7 +54,11 @@ unsigned long arch_mmap_rnd(void)
 static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
 {
 	unsigned long gap = rlim_stack->rlim_cur;
-	unsigned long pad = (STACK_RND_MASK << PAGE_SHIFT) + stack_guard_gap;
+	unsigned long pad = stack_guard_gap;
+
+	/* Account for stack randomization if necessary */
+	if (current->flags & PF_RANDOMIZE)
+		pad += (STACK_RND_MASK << PAGE_SHIFT);
 
 	/* Values close to RLIM_INFINITY can overflow. */
 	if (gap + pad > gap)
-- 
2.20.1

