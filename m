Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE1B3D4549
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhGXF4o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 01:56:44 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:48206 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhGXF4o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 01:56:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.179702|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0110593-0.00208318-0.986858;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Kpjyp2k_1627108627;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kpjyp2k_1627108627)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 14:37:14 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 0/4] Improve Ingenic pinctrl support.
Date:   Sat, 24 Jul 2021 14:36:40 +0800
Message-Id: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Improve the code to avoid misunderstandings.
2.Add missing SSI pins for JZ4755 and JZ4760.
3.Add support for the X2100 SoC.

周琰杰 (Zhou Yanjie) (4):
  pinctrl: Ingenic: Improve the code.
  pinctrl: Ingenic: Add SSI pins support for JZ4755 and JZ4760.
  dt-bindings: pinctrl: Add bindings for Ingenic X2100.
  pinctrl: Ingenic: Add pinctrl driver for X2100.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |  10 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 526 ++++++++++++++++++---
 2 files changed, 466 insertions(+), 70 deletions(-)

-- 
2.7.4

