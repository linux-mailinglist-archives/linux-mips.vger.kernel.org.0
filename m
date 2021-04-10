Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263EC35AFBD
	for <lists+linux-mips@lfdr.de>; Sat, 10 Apr 2021 20:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbhDJSzJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Apr 2021 14:55:09 -0400
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:38671 "EHLO
        out28-169.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbhDJSzJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Apr 2021 14:55:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1156899|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0206022-0.000130036-0.979268;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.Jy13RN2_1618080886;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jy13RN2_1618080886)
          by smtp.aliyun-inc.com(10.147.42.241);
          Sun, 11 Apr 2021 02:54:51 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v4 00/11] Fix bugs and add support for new Ingenic SoCs.
Date:   Sun, 11 Apr 2021 02:54:35 +0800
Message-Id: <1618080886-32061-1-git-send-email-zhouyanjie@wanyeetech.com>
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

周琰杰 (Zhou Yanjie) (11):
  pinctrl: Ingenic: Add missing pins to the JZ4770 MAC MII group.
  pinctrl: Ingenic: Add support for read the pin configuration of X1830.
  pinctrl: Ingenic: Adjust the sequence of X1830 SSI pin groups.
  pinctrl: Ingenic: Improve LCD pins related code.
  pinctrl: Ingenic: Reformat the code.
  dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
  pinctrl: Ingenic: Add pinctrl driver for JZ4730.
  pinctrl: Ingenic: Add pinctrl driver for JZ4750.
  pinctrl: Ingenic: Add pinctrl driver for JZ4755.
  pinctrl: Ingenic: Add pinctrl driver for JZ4775.
  pinctrl: Ingenic: Add pinctrl driver for X2000.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1538 ++++++++++++++++++--
 2 files changed, 1429 insertions(+), 132 deletions(-)

-- 
2.7.4

