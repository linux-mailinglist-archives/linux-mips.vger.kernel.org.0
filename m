Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3046332C63
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 17:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhCIQlj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 11:41:39 -0500
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:49601 "EHLO
        out28-3.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbhCIQlf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 11:41:35 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09998201|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00577354-0.00256352-0.991663;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JibD5S0_1615308080;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JibD5S0_1615308080)
          by smtp.aliyun-inc.com(10.147.40.44);
          Wed, 10 Mar 2021 00:41:26 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 0/3] Fix bugs and add support for new Ingenic SoCs.
Date:   Wed, 10 Mar 2021 00:40:54 +0800
Message-Id: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add tabs before values to align the code in the macro definition section.
2.Fix bugs related to the MAC of JZ4770, add missing pins to the MII group.
3.Adjust the sequence of X1830's SSI related codes to make it consistent
  with other Ingenic SoCs.
4.Fix bug in "ingenic_pinconf_get()", so that it can read the configuration
  of X1830 SoC correctly.
5.Add the pinctrl bindings for the JZ4730 SoC, the JZ4750 SoC, the JZ4755 SoC,
  the JZ4775 SoC and the X2000 SoC from Ingenic.
6.Add support for probing the pinctrl-ingenic driver on the JZ4730 SoC,
  the JZ4750 SoC, the JZ4755 SoC, the JZ4775 SoC and the X2000 SoC from
  Ingenic.

周琰杰 (Zhou Yanjie) (3):
  pinctrl: Ingenic: Fix bug and reformat the code.
  dt-bindings: pinctrl: Add bindings for new Ingenic SoCs.
  pinctrl: Ingenic: Add support for new Ingenic SoCs.

 .../bindings/pinctrl/ingenic,pinctrl.yaml          |   23 +-
 drivers/pinctrl/pinctrl-ingenic.c                  | 1419 ++++++++++++++++++--
 2 files changed, 1351 insertions(+), 91 deletions(-)

-- 
2.7.4

