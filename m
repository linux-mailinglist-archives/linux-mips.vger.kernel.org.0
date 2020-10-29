Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A4129E17E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 03:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgJ2CBc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 22:01:32 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:6573 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgJ2CBb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 22:01:31 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CM7w960L7zhc21;
        Thu, 29 Oct 2020 10:01:29 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 10:01:20 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <tsbogend@alpha.franken.de>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] mm/hugetlb: Make is_aligned_hugepage_range static
Date:   Thu, 29 Oct 2020 10:13:20 +0800
Message-ID: <1603937600-53015-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following sparse warning:

arch/mips/mm/hugetlbpage.c:64:5: warning:
symbol 'is_aligned_hugepage_range' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 arch/mips/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/hugetlbpage.c b/arch/mips/mm/hugetlbpage.c
index 77ffece..774c988 100644
--- a/arch/mips/mm/hugetlbpage.c
+++ b/arch/mips/mm/hugetlbpage.c
@@ -61,7 +61,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 /*
  * This function checks for proper alignment of input addr and len parameters.
  */
-int is_aligned_hugepage_range(unsigned long addr, unsigned long len)
+static int is_aligned_hugepage_range(unsigned long addr, unsigned long len)
 {
 	if (len & ~HPAGE_MASK)
 		return -EINVAL;
-- 
2.6.2

