Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB18D39D053
	for <lists+linux-mips@lfdr.de>; Sun,  6 Jun 2021 20:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhFFSKS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Jun 2021 14:10:18 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:45152 "EHLO
        out28-100.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhFFSKR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Jun 2021 14:10:17 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.249555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0109502-0.00284589-0.986204;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.KOTSOnf_1623002885;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KOTSOnf_1623002885)
          by smtp.aliyun-inc.com(10.147.40.2);
          Mon, 07 Jun 2021 02:08:23 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Subject: [PATCH 0/2] Add support for JZ4775 and rename unreasonable array name.
Date:   Mon,  7 Jun 2021 02:08:02 +0800
Message-Id: <1623002884-57244-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add the MMC bindings for the JZ4775 SoC from Ingenic.
2.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
3.When the support for JZ4775 SoC is added, there will be six compatible
  strings, so renaming "jz4740_mmc_of_match[]" to "jz4740_mmc_of_matches[]"
  is more reasonable.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: mmc: JZ4740: Add bindings for JZ4775.
  mmc: JZ4740: Add support for JZ4775 and rename unreasonable array
    name.

 .../devicetree/bindings/mmc/ingenic,mmc.yaml       |  1 +
 drivers/mmc/host/jz4740_mmc.c                      | 25 ++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.7.4

