Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F811484E2
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 13:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388523AbgAXMGS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 07:06:18 -0500
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:53981 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388400AbgAXMGR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 07:06:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2751907|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0446825-0.00421084-0.951107;DS=CONTINUE|ham_system_inform|0.0101188-0.000462388-0.989419;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03296;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=30;RT=30;SR=0;TI=SMTPD_---.Gh-0wLC_1579867533;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gh-0wLC_1579867533)
          by smtp.aliyun-inc.com(10.147.40.2);
          Fri, 24 Jan 2020 20:06:10 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
        shawnguo@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, miquel.raynal@bootlin.com,
        keescook@chromium.org, ebiederm@xmission.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        chenhc@lemote.com, jiaxun.yang@flygoat.com, paul@boddie.org.uk,
        hns@goldelico.com, mips-creator-ci20-dev@googlegroups.com,
        rick.tyliu@ingenic.com
Subject: [PATCH v3 6/6] MIPS: CI20: Update defconfig to support SMP.
Date:   Fri, 24 Jan 2020 20:05:08 +0800
Message-Id: <1579867508-81499-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add "CONFIG_SMP=y" and "CONFIG_NR_CPUS=2" to support SMP.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    No change.
    
    v2->v3:
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

