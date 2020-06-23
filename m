Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6108C204D7A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 11:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732043AbgFWJGw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 05:06:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44752 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732051AbgFWJGv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jun 2020 05:06:51 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2oexvFeJ7JIAA--.33S8;
        Tue, 23 Jun 2020 17:06:44 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 6/7 RESEND] irqchip/loongson-htpic: Remove unneeded select of I8259
Date:   Tue, 23 Jun 2020 17:06:37 +0800
Message-Id: <1592903198-5505-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1592903198-5505-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592903198-5505-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf2oexvFeJ7JIAA--.33S8
X-Coremail-Antispam: 1UD129KBjvdXoWruFW3Cw13KF4kAr4DXF15CFg_yoWxAFg_C3
        9IqFZ7JFyIkry7G34agF4fWFyjyayqgFn7ur4jqryrX34xX34xtFW5Ja98Xr17GayqgF1S
        vrWfur1vkr1IyjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbCxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0
        c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2
        IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv04
        87Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67
        IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWr
        XwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4I
        xYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
        GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
        0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj4iubyAUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LOONGSON_HTPIC depends on MACH_LOONGSON64 and MACH_LOONGSON64 already
selects I8259 in arch/mips/Kconfig, so no need to select I8259 again
when config LOONGSON_HTPIC.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/irqchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 29fead2..9f57aed 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -541,7 +541,6 @@ config LOONGSON_HTPIC
 	default y
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_CHIP
-	select I8259
 	help
 	  Support for the Loongson-3 HyperTransport PIC Controller.
 
-- 
2.1.0

