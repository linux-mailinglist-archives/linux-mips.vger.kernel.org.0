Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71ACB38E0CF
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 08:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbhEXGJh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 02:09:37 -0400
Received: from lucky1.263xmail.com ([211.157.147.133]:33022 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbhEXGJg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 May 2021 02:09:36 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id DD920CD3AB;
        Mon, 24 May 2021 14:08:02 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
        by smtp.263.net (postfix) whith ESMTP id P32531T140357266978560S1621836476906347_;
        Mon, 24 May 2021 14:08:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0fe6ea26dfe43fb0db965d2732bd014d>
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
Subject: [PATCH 3/5] mips: dts: loongson: fix DTC unit name warnings
Date:   Mon, 24 May 2021 14:07:36 +0800
Message-Id: <3e9eb7470ebe9eced7e4ab1a714a76d62352423d.1621586643.git.zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1621586643.git.zhaoxiao@uniontech.com>
References: <cover.1621586643.git.zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following W=1 kernel build warning(s):
arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:91.7-96.5: Warning (unit_address_vs_reg): /bus@10000000/isa: node has a reg or ranges property, but no unit name
arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:91.7-96.5: Warning (simple_bus_reg): /bus@10000000/isa: simple-bus unit address format error, expected "18000000"

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
index 41f0b110d455..d0588d81e0c2 100644
--- a/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
+++ b/arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts
@@ -88,7 +88,7 @@
 			interrupt-map-mask = <0x1800 0x0 0x0  0x7>;
 		};
 
-		isa {
+		isa@18000000 {
 			compatible = "isa";
 			#address-cells = <2>;
 			#size-cells = <1>;
-- 
2.20.1



