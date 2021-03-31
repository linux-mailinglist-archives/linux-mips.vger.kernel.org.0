Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B791A34FBFF
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 10:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbhCaI4A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 04:56:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15120 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhCaIz0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 04:55:26 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9Kpk0BkKz1BFS4;
        Wed, 31 Mar 2021 16:53:18 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:55:13 +0800
From:   Xu Jia <xujia39@huawei.com>
To:     <xujia39@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Xingxing Su <suxingxing@loongson.cn>,
        Huang Pei <huangpei@loongson.cn>
CC:     <linux-mips@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] mips: remove unused variable 'prev_state'
Date:   Wed, 31 Mar 2021 16:54:58 +0800
Message-ID: <1617180898-36838-1-git-send-email-xujia39@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

GCC reports the following warning with W=1:

arch/mips/kernel/traps.c:1593:17: warning:
 variable 'prev_state' set but not used [-Wunused-but-set-variable]
 1593 |  enum ctx_state prev_state;
      |                 ^~~~~~~~~~

This variable is not used in function , this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Jia <xujia39@huawei.com>
---
 arch/mips/kernel/traps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 808b8b61ded1..d1f23ddf0c8c 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1590,10 +1590,8 @@ asmlinkage void do_watch(struct pt_regs *regs)
 asmlinkage void do_mcheck(struct pt_regs *regs)
 {
 	int multi_match = regs->cp0_status & ST0_TS;
-	enum ctx_state prev_state;
 	mm_segment_t old_fs = get_fs();
 
-	prev_state = exception_enter();
 	show_regs(regs);
 
 	if (multi_match) {

