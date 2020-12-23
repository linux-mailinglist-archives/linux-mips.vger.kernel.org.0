Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96EC52E149E
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 03:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgLWClc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 21:41:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:52526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729979AbgLWCXY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 21:23:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D072225AB;
        Wed, 23 Dec 2020 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608690184;
        bh=w5ONGt/8KxfidV2FLhfW7qk8ftC55R9vQyakaZ64OHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GXiVuHD/Uce7lRdiBaizWeFPx2AZp7aUD0cThPHJM+oEoh7JzbmK9NzM6qp2IRv15
         dsbfH3EFJx6tbpJfybzQo24J0l0x3Ic5PyClTXEuKDfQRCn5RszCkqC6knuhuDIZbn
         TPBnsBX9wGBzKJtN4I8p/Q22OZqkv+m6zLpL+HFro/UocOgHVBnLfpnul7jU7Tq9Pc
         p5QhUI/kbsavkxWmnrsMqN+VjEHuDb9nkZTDde620I4prgZTIT0DHV3GuXlcIgYrPb
         KkjiFqw9TlcArTpoNGVLouwrm/YU9ldRuGgCSK7I91spn+LDhml9QVh4Ybth9YMdFA
         zMLEbWFXxnOBA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/66] mips: ar7: add missing iounmap() on error in ar7_gpio_init
Date:   Tue, 22 Dec 2020 21:21:55 -0500
Message-Id: <20201223022253.2793452-9-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022253.2793452-1-sashal@kernel.org>
References: <20201223022253.2793452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit 5a5aa912f687204d50455d0db36f94dd8de601c2 ]

Add the missing iounmap() of gpch->regs before return from
ar7_gpio_init() in the error handling case.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/ar7/gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ar7/gpio.c b/arch/mips/ar7/gpio.c
index 4eee7e9e26ee2..3ba58f980fec2 100644
--- a/arch/mips/ar7/gpio.c
+++ b/arch/mips/ar7/gpio.c
@@ -332,6 +332,7 @@ int __init ar7_gpio_init(void)
 	if (ret) {
 		printk(KERN_ERR "%s: failed to add gpiochip\n",
 					gpch->chip.label);
+		iounmap(gpch->regs);
 		return ret;
 	}
 	printk(KERN_INFO "%s: registered %d GPIOs\n",
-- 
2.27.0

