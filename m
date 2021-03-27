Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166A234B5C5
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 10:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhC0JxH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 05:53:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15009 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhC0Jwr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 05:52:47 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6vG530tnzPvKd;
        Sat, 27 Mar 2021 17:50:05 +0800 (CST)
Received: from huawei.com (10.67.174.78) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Mar 2021
 17:52:29 +0800
From:   Chen Lifu <chenlifu@huawei.com>
To:     <chenlifu@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Zhang Qilong <zhangqilong3@huawei.com>
CC:     <heying24@huawei.com>, <yuehaibing@huawei.com>,
        <weiyongjun1@huawei.com>, <johnny.chenyi@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] MIPS: Alchemy: Use DEFINE_SPINLOCK() for spinlock
Date:   Sat, 27 Mar 2021 17:52:25 +0800
Message-ID: <20210327095225.104997-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.78]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Lifu Chen <chenlifu@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lifu Chen <chenlifu@huawei.com>
---
 arch/mips/alchemy/common/clock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index f0c830337104..c01be8c45271 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -111,7 +111,7 @@ static struct clk_aliastable {
 /* access locks to SYS_FREQCTRL0/1 and SYS_CLKSRC registers */
 static spinlock_t alchemy_clk_fg0_lock;
 static spinlock_t alchemy_clk_fg1_lock;
-static spinlock_t alchemy_clk_csrc_lock;
+static DEFINE_SPINLOCK(alchemy_clk_csrc_lock);
 
 /* CPU Core clock *****************************************************/
 
@@ -996,7 +996,6 @@ static int __init alchemy_clk_setup_imux(int ctype)
 	if (!a)
 		return -ENOMEM;
 
-	spin_lock_init(&alchemy_clk_csrc_lock);
 	ret = 0;
 
 	for (i = 0; i < 6; i++) {

