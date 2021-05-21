Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1033E38C39A
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 11:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236954AbhEUJoc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 May 2021 05:44:32 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:45740 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236983AbhEUJoU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 May 2021 05:44:20 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 0D7BFD1C96;
        Fri, 21 May 2021 17:42:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P32531T140356614080256S1621590174661695_;
        Fri, 21 May 2021 17:42:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <497d9d64bde1557a321f80d0295321b8>
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
Subject: [PATCH 5/5] mips: dts: loongson: fix DTC unit name warnings
Date:   Fri, 21 May 2021 17:42:52 +0800
Message-Id: <20210521094252.28446-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following W=1 kernel build warning(s):
arch/mips/boot/dts/loongson/rs780e-pch.dtsi:24.7-41.5: Warning (unit_address_vs_reg): /bus@10000000/isa: node has a reg or ranges property, but no unit name
arch/mips/boot/dts/loongson/rs780e-pch.dtsi:24.7-41.5: Warning (simple_bus_reg): /bus@10000000/isa: simple-bus unit address format error, expected "18000000"

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
index 871c866e0423..6f459511e6c9 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -21,7 +21,7 @@
 				 <0x02000000 0 0x40000000 0 0x40000000 0 0x40000000>;
 		};
 
-		isa {
+		isa@18000000 {
 			compatible = "isa";
 			#address-cells = <2>;
 			#size-cells = <1>;
-- 
2.20.1



