Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCEA3A2C36
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 14:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhFJNBC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 09:01:02 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:46198 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFJNBC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 09:01:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4741654|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00585626-0.000580943-0.993563;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KQVfrD4_1623329936;
Received: from zhouyanjie-virtual-machine.lan(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KQVfrD4_1623329936)
          by smtp.aliyun-inc.com(10.147.41.137);
          Thu, 10 Jun 2021 20:59:02 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v2 0/2] Add support for JZ4775
Date:   Thu, 10 Jun 2021 20:58:48 +0800
Message-Id: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
2.The drive clock selection and sample clock selection have been
  supported since JZ4775, not X1000. So support for these two
  functions has been added for JZ4775 and JZ4780.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: mmc: JZ4740: Add bindings for JZ4775.
  mmc: JZ4740: Add support for JZ4775.

 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 1 +
 drivers/mmc/host/jz4740_mmc.c                          | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.7.4

