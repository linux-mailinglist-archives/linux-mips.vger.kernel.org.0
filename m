Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FB221E782
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 07:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGNFdS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 01:33:18 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:53467 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGNFdQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 01:33:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1863961|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0194656-0.000730076-0.979804;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16367;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.I1QwJ79_1594704779;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I1QwJ79_1594704779)
          by smtp.aliyun-inc.com(10.147.44.145);
          Tue, 14 Jul 2020 13:33:10 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, paulburton@kernel.org,
        paul@crapouillou.net, ak@linux.intel.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 5/5] MIPS: CU1000-Neo: Refresh defconfig to support LED.
Date:   Tue, 14 Jul 2020 13:32:29 +0800
Message-Id: <20200714053229.33195-6-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Refresh CU1000-Neo's defconfig to support LED.

Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v4:
    New patch.

 arch/mips/configs/cu1000-neo_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 9b05a8fdabe1..6b471cdb16cf 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -74,6 +74,10 @@ CONFIG_JZ4740_WDT=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_MMC=y
 CONFIG_MMC_JZ4740=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_JZ4740=y
 CONFIG_DMADEVICES=y
-- 
2.11.0

