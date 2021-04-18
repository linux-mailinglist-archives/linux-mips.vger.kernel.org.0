Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96AB3635F2
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 16:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhDROpN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Apr 2021 10:45:13 -0400
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:51078 "EHLO
        out28-52.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhDROpN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Apr 2021 10:45:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08555614|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00607168-7.29418e-05-0.993855;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.K.sSkG._1618757074;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.sSkG._1618757074)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sun, 18 Apr 2021 22:44:41 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v6 00/12] Fix bugs and add support for new Ingenic SoCs.
Date:   Sun, 18 Apr 2021 22:44:21 +0800
Message-Id: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
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

v3->v4:
1.Modify the format of comment.
2.Split lcd pins into several groups.
3.Drop "lcd-no-pins" which is pointless.
4.Improve the structure of some functions.
5.Adjust function names to avoid confusion.
6.Use "lcd-special" and "lcd-generic" instead "lcd-xxbit-tft".
7.Replace "lcd-rgb-xxx" with "lcd-tft-xxx" to avoid confusion.

v4->v5:
Add support for schmitt and slew.

v5->v6:
1.Add the missing lcd-24bit group.
2.Add DMIC pins support for Ingenic SoCs.
3.Adjust and simplify the code.

周琰杰 (Zhou Yanjie) (12):
  pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
  pinctrl: Ingenic: Add support for read the pin configuration of X1830.
  pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
  pinctrl: Ingenic: Improve LCD pins related code.
  pinctrl: Ingenic: Add DMIC pins support for Ingenic SoCs.
  pinctrl: Ingenic: Reformat the code.
  dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
  pinctrl: Ingenic: Add pinctrl driver for JZ4730.
  pinctrl: Ingenic: Add pinctrl driver for JZ4750.
  pinctrl: Ingenic: Add pinctrl driver for JZ4755.
  pinctrl: Ingenic: Add pinctrl driver for JZ4775.
  pinctrl: Ingenic: Add pinctrl driver for X2000.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1645 ++++++++++++++++++--
 2 files changed, 1533 insertions(+), 135 deletions(-)

-- 
2.7.4

