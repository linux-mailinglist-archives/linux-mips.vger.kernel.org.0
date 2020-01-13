Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596491396AC
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 17:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgAMQog (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 11:44:36 -0500
Received: from out28-51.mail.aliyun.com ([115.124.28.51]:46768 "EHLO
        out28-51.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbgAMQog (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 11:44:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2512184|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0266138-0.00157687-0.971809;DS=CONTINUE|ham_system_inform|0.0297817-0.00180406-0.968414;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GbRhA7M_1578933839;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GbRhA7M_1578933839)
          by smtp.aliyun-inc.com(10.147.40.233);
          Tue, 14 Jan 2020 00:44:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, miquel.raynal@bootlin.com, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, daniel.lezcano@linaro.org,
        ebiederm@xmission.com, keescook@chromium.org, ak@linux.intel.com,
        krzk@kernel.org, paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 6/6] MIPS: CI20: Update defconfig to support SMP.
Date:   Tue, 14 Jan 2020 00:43:33 +0800
Message-Id: <1578933813-80122-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
 <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add "CONFIG_SMP=y" and "CONFIG_NR_CPUS=2" to support SMP.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
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

