Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC3B163F2A
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 09:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgBSIbQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 03:31:16 -0500
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:37433 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgBSIbP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 03:31:15 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2394622|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0443572-0.00237967-0.953263;DS=CONTINUE|ham_system_inform|0.00593159-0.000181337-0.993887;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03309;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.Gpe8RV3_1582100997;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gpe8RV3_1582100997)
          by smtp.aliyun-inc.com(10.147.40.2);
          Wed, 19 Feb 2020 16:30:12 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de, maz@kernel.org,
        jason@lakedaemon.net, sboyd@kernel.org, mturquette@baylibre.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH 0/4] Add support for TCU of X1000
Date:   Wed, 19 Feb 2020 16:29:30 +0800
Message-Id: <1582100974-129559-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for TCU of X1000 from Ingenic. X1000 has
a different TCU containing OST, since X1000, OST has
been independent of TCU. This patch is prepare for
later OST driver.

周琰杰 (Zhou Yanjie) (4):
  dt-bindings: timer: Add X1000 bindings.
  clk: Ingenic: Add support for TCU of X1000.
  clocksource: Ingenic: Add support for TCU of X1000.
  irqchip: Ingenic: Add support for TCU of X1000.

 Documentation/devicetree/bindings/timer/ingenic,tcu.txt | 1 +
 drivers/clk/ingenic/tcu.c                               | 8 ++++++++
 drivers/clocksource/ingenic-timer.c                     | 3 ++-
 drivers/irqchip/irq-ingenic-tcu.c                       | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.7.4

