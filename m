Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FFD38E0D1
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 08:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhEXGJi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 02:09:38 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:57520 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbhEXGJh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 May 2021 02:09:37 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id D2C46F446B;
        Mon, 24 May 2021 14:08:01 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P32531T140357266978560S1621836476906347_;
        Mon, 24 May 2021 14:08:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <964db94a2dc3cd6359b7afff6f6f4025>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: robh+dt@kernel.org
X-RCPT-COUNT: 9
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de
Cc:     maoxiaochuan@loongson.cn, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH 2/5] mips: dts: loongson: fix DTC unit name warnings
Date:   Mon, 24 May 2021 14:07:35 +0800
Message-Id: <a6343f728252e4134b01c2c5f63acba3b38bcdd5.1621586643.git.zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1621586643.git.zhaoxiao@uniontech.com>
References: <cover.1621586643.git.zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following W=1 kernel build warning(s):
arch/mips/boot/dts/loongson/loongson64g-package.dtsi:42.30-49.5: Warning (simple_bus_reg): /bus@1fe00000/serial@1fe001e0: simple-bus unit address format error, expected "1fe00100"
arch/mips/boot/dts/loongson/loongson64g-package.dtsi:51.30-59.5: Warning (simple_bus_reg): /bus@1fe00000/serial@1fe001e8: simple-bus unit address format error, expected "1fe00110"

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
index 38abc570cd82..d4314f62ccc2 100644
--- a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
@@ -39,7 +39,7 @@
 
 		};
 
-		cpu_uart0: serial@1fe001e0 {
+		cpu_uart0: serial@1fe00100 {
 			compatible = "ns16550a";
 			reg = <0 0x1fe00100 0x10>;
 			clock-frequency = <100000000>;
@@ -48,7 +48,7 @@
 			no-loopback-test;
 		};
 
-		cpu_uart1: serial@1fe001e8 {
+		cpu_uart1: serial@1fe00110 {
 			status = "disabled";
 			compatible = "ns16550a";
 			reg = <0 0x1fe00110 0x10>;
-- 
2.20.1



