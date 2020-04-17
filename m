Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C931ADBDD
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 13:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbgDQLHg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 07:07:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33870 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729468AbgDQLHg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 07:07:36 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 788EBBD8543B75C212DE;
        Fri, 17 Apr 2020 19:07:34 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 19:07:26 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <f.fainelli@gmail.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>, <justinpopo6@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH v2] irqchip/irq-bcm7038-l1: make bcm7038_l1_of_init() static
Date:   Fri, 17 Apr 2020 19:33:51 +0800
Message-ID: <20200417113351.43839-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following sparse warning:

drivers/irqchip/irq-bcm7038-l1.c:419:12: warning: symbol
'bcm7038_l1_of_init' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 v1->v2: Reindent the second line of the function

 drivers/irqchip/irq-bcm7038-l1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index eb9bce93cd05..90cac1cac177 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -416,8 +416,8 @@ static const struct irq_domain_ops bcm7038_l1_domain_ops = {
 	.map			= bcm7038_l1_map,
 };
 
-int __init bcm7038_l1_of_init(struct device_node *dn,
-			      struct device_node *parent)
+static int __init bcm7038_l1_of_init(struct device_node *dn,
+				     struct device_node *parent)
 {
 	struct bcm7038_l1_chip *intc;
 	int idx, ret;
-- 
2.21.1

