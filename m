Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175FF36A1E3
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbhDXQAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 12:00:45 -0400
Received: from mail-m118208.qiye.163.com ([115.236.118.208]:60036 "EHLO
        mail-m118208.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhDXQAn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 12:00:43 -0400
Received: from ubuntu.localdomain (unknown [36.152.145.182])
        by mail-m118208.qiye.163.com (Hmail) with ESMTPA id A9872E00EB;
        Sun, 25 Apr 2021 00:00:02 +0800 (CST)
From:   zhouchuangao <zhouchuangao@vivo.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        zhouchuangao <zhouchuangao@vivo.com>, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: BCM63XX: Use BUG_ON instead of condition followed by BUG.
Date:   Sat, 24 Apr 2021 08:59:50 -0700
Message-Id: <1619279992-81335-1-git-send-email-zhouchuangao@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQh5LQlZJHk1NSR5PGk5LSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NU06Lyo*Mz8VEgMDLxIxPhQz
        FTQaFAtVSlVKTUpCSUNLS0tISk5OVTMWGhIXVQETFA4YEw4aFRwaFDsNEg0UVRgUFkVZV1kSC1lB
        WUhNVUpOSVVKT05VSkNJWVdZCAFZQUlJTkI3Bg++
X-HM-Tid: 0a79049bff232c17kusna9872e00eb
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BUG_ON uses unlikely in if(), it can be optimized at compile time.

Usually, the condition in if() is not satisfied. In my opinion,
this can improve the efficiency of the multi-stage pipeline.

Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
---
 arch/mips/bcm63xx/gpio.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/mips/bcm63xx/gpio.c b/arch/mips/bcm63xx/gpio.c
index 16f353a..5c4a233 100644
--- a/arch/mips/bcm63xx/gpio.c
+++ b/arch/mips/bcm63xx/gpio.c
@@ -43,8 +43,7 @@ static void bcm63xx_gpio_set(struct gpio_chip *chip,
 	u32 *v;
 	unsigned long flags;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = gpio_out_low_reg;
@@ -70,8 +69,7 @@ static int bcm63xx_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	u32 reg;
 	u32 mask;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = gpio_out_low_reg;
@@ -92,8 +90,7 @@ static int bcm63xx_gpio_set_direction(struct gpio_chip *chip,
 	u32 tmp;
 	unsigned long flags;
 
-	if (gpio >= chip->ngpio)
-		BUG();
+	BUG_ON(gpio >= chip->ngpio);
 
 	if (gpio < 32) {
 		reg = GPIO_CTL_LO_REG;
-- 
2.7.4

