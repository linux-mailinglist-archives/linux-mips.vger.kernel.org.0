Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BC83D4693
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhGXIbQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:31:16 -0400
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:39775 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbhGXIbP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:31:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4805021|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00965706-0.00394866-0.986394;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KpqAhCg_1627117898;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KpqAhCg_1627117898)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sat, 24 Jul 2021 17:11:44 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 0/2] Add VPU support for new Ingenic SoCs.
Date:   Sat, 24 Jul 2021 17:11:36 +0800
Message-Id: <1627117898-125239-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add the remoteproc bindings for the JZ4760 SoC, the JZ4760B SoC,
  the JZ4775 SoC, and the JZ4780 SoC from Ingenic.
2.Add support for probing the ingenic_rproc driver on the JZ4760 SoC,
  the JZ4760B SoC, the JZ4775 SoC, and the JZ4780 SoC from Ingenic.

It should be noted that the VPU of JZ4775 and JZ4780 has only one TCSM.

周琰杰 (Zhou Yanjie) (2):
  dt-bindings: remoteproc: Add bindings for new Ingenic SoCs.
  remoteproc: Ingenic: Add support for new Ingenic SoCs.

 .../bindings/remoteproc/ingenic,vpu.yaml           |  74 +++++++++----
 drivers/remoteproc/ingenic_rproc.c                 | 115 ++++++++++++++++-----
 2 files changed, 147 insertions(+), 42 deletions(-)

-- 
2.7.4

