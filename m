Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A16C33EDB1
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhCQJ6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:58:39 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:35256 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCQJ6T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:58:19 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1697783|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00566828-2.56148e-05-0.994306;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.JmJVfKa_1615975087;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmJVfKa_1615975087)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 17 Mar 2021 17:58:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v3 00/10] Fix bugs and add support for new Ingenic SoCs.
Date:   Wed, 17 Mar 2021 17:57:54 +0800
Message-Id: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Split [1/3] in v1 to [1/6] [2/6] [3/6] [4/6] in v2.
2.Fix the uninitialized warning.

v2->v3:
Split [6/6] in v2 to [6/10] [7/10] [8/10] [9/10] [10/10] in v3.

周琰杰 (Zhou Yanjie) (10):
  pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
  pinctrl: Ingenic: Add support for read the pin configuration of X1830.
  pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
  pinctrl: Ingenic: Reformat the code.
  dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
  pinctrl: Ingenic: Add pinctrl driver for JZ4730.
  pinctrl: Ingenic: Add pinctrl driver for JZ4750.
  pinctrl: Ingenic: Add pinctrl driver for JZ4755.
  pinctrl: Ingenic: Add pinctrl driver for JZ4775.
  pinctrl: Ingenic: Add pinctrl driver for X2000.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1381 ++++++++++++++++++--
 2 files changed, 1322 insertions(+), 82 deletions(-)

-- 
2.7.4

