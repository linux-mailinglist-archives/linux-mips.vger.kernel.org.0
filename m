Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55E613F24C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 19:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407142AbgAPSeZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 13:34:25 -0500
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:42644 "EHLO
        out28-219.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391658AbgAPRYh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 12:24:37 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2859474|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0287538-0.00116862-0.970078;DS=CONTINUE|ham_regular_dialog|0.0102448-0.000467264-0.989288;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03302;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.GdEQRsw_1579195452;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GdEQRsw_1579195452)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 17 Jan 2020 01:24:29 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mips-creator-ci20-dev@googlegroups.com, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com, hns@goldelico.com, paul@boddie.org.uk
Subject: [PATCH v2 6/6] MIPS: CI20: Update defconfig to support SMP.
Date:   Fri, 17 Jan 2020 01:23:49 +0800
Message-Id: <1579195429-59828-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add "CONFIG_SMP=y" and "CONFIG_NR_CPUS=2" to support SMP.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2..3aadb2e 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -1,3 +1,5 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
-- 
2.7.4

