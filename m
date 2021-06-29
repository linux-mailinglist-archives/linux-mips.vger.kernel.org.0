Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93783B6BFE
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 03:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhF2BVq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 21:21:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46396 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230483AbhF2BVq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 21:21:46 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0ERddpgWAYaAA--.9325S3;
        Tue, 29 Jun 2021 09:19:14 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] MIPS: Loongson64: Add pm block node for Loongson-2K1000
Date:   Tue, 29 Jun 2021 09:19:13 +0800
Message-Id: <20210629011913.18611-2-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210629011913.18611-1-zhangqing@loongson.cn>
References: <20210629011913.18611-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0ERddpgWAYaAA--.9325S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF43KFW7Xr45AFW7Gr4kZwb_yoWftrg_ta
        s2gw1kCF4fJF1ft3y8Xr1UGFy3u3y7Z3WrCF15XF10qas0vFn3JFWUAFWDCFy3XFyY9rs3
        Xr48Wr18Ar1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbS8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
        6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_KwCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnDG5UUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The module is now supported, enable it.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v4-v5:
add missing spaces

 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..38bf14f00694 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -101,6 +101,16 @@ uart0: serial@1fe00000 {
 			no-loopback-test;
 		};
 
+		pm: power-controller {
+			device_type = "power management";
+			compatible = "loongson, reset-controller";
+
+			reg = <0 0x1fe0700c 0 0x8>,
+			      <0 0x1fe07014 0 0x8>,
+			      <0 0x1fe07030 0 0x8>;
+			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls2k-pci";
 			device_type = "pci";
-- 
2.31.0

