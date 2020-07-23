Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FF422A97A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 09:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgGWHU3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 03:20:29 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:55421 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgGWHU2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jul 2020 03:20:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08760107|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0079633-0.000303186-0.991734;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03273;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.I6IjCRk_1595488814;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I6IjCRk_1595488814)
          by smtp.aliyun-inc.com(10.147.42.253);
          Thu, 23 Jul 2020 15:20:25 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        keescook@chromium.org, hns@goldelico.com, ebiederm@xmission.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH] MIPS: CI20: Update defconfig for EFUSE.
Date:   Thu, 23 Jul 2020 15:19:50 +0800
Message-Id: <20200723071950.130007-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
References: <20200723071950.130007-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The commit 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
controller use NVMEM to find the default MAC address") add EFUSE
node for DM9000 in CI20, however, the EFUSE driver is not selected,
which will cause the DM9000 to fail to read the MAC address from
EFUSE, causing the following issue:

[FAILED] Failed to start Raise network interfaces.

Fix this problem by select CONFIG_JZ4780_EFUSE by default in the
ci20_defconfig.

Fixes: 19c968222934 ("MIPS: DTS: CI20: make DM9000 Ethernet
controller use NVMEM to find the default MAC address").

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index f433fad16073..ba26ba4de09a 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -140,6 +140,7 @@ CONFIG_INGENIC_OST=y
 CONFIG_MEMORY=y
 CONFIG_PWM=y
 CONFIG_PWM_JZ4740=m
+CONFIG_JZ4780_EFUSE=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_AUTOFS_FS=y
-- 
2.11.0

