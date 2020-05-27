Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCC61E3838
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 07:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgE0F1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 01:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0F1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 01:27:51 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF798C061A0F;
        Tue, 26 May 2020 22:27:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 8425220CD7;
        Wed, 27 May 2020 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590557271; bh=hN3UCNC1oAOyNQFrDq068mmAnFijUJCN0J4zaXVDdZo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V3g2rLkLvAC/QLjcUDlFgdqwKY+LvqZPudN54UNjbZl9AclFdehPrvQ0XD08OrcXh
         mCRYdC044xrl5FHCuRD/CBYQC6rIApHVkOqWfVKvrspv0+a7ZUEKRhTimTZYBg0Ngj
         Noi+qkHVqh80v20x3kqS5Fh/V5bDHgWopvY/dBDO34geyLvh7bkGlZlWzozz6jM6B5
         sJBW1Q1fpDCPV+SBXP/km7Q/3vw2e0QUmPqpXu4JuIvkARnVF6ucjjztLtm0Hy3lNm
         eGZdOeWJ0mm+eeO9UIMckZ+wxdTOF0uglO3Jk75UvvYM50FId3iS5AUzZqFNBP7FVL
         1cYc60MY+o4zw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: head.S: Always jump to kernel_entry at head of text
Date:   Wed, 27 May 2020 13:27:18 +0800
Message-Id: <20200527052721.366704-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527052721.366704-1-jiaxun.yang@flygoat.com>
References: <20200527052721.366704-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Buggy loaders like early version of PMON2000 sometimes ignore
elf_entry and goto start of text directly.

That would help with dealing with these loaders.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/head.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 3b02ffe46304..c7c2795837e7 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -69,7 +69,6 @@
 
 EXPORT(_stext)
 
-#ifdef CONFIG_BOOT_RAW
 	/*
 	 * Give us a fighting chance of running if execution beings at the
 	 * kernel load address.	 This is needed because this platform does
@@ -77,7 +76,6 @@ EXPORT(_stext)
 	 */
 FEXPORT(__kernel_entry)
 	j	kernel_entry
-#endif /* CONFIG_BOOT_RAW */
 
 	__REF
 
-- 
2.27.0.rc0

