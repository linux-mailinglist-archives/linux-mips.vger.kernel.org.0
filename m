Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B643B623A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 16:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhF1On2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 10:43:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59592 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234491AbhF1Ol0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 10:41:26 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0L93tlgmsoZAA--.8933S3;
        Mon, 28 Jun 2021 22:38:54 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] MIPS: Loongson64: DTS: Add pm block node for Loongson-2K1000
Date:   Mon, 28 Jun 2021 22:38:52 +0800
Message-Id: <20210628143852.11504-2-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210628143852.11504-1-zhangqing@loongson.cn>
References: <20210628143852.11504-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb0L93tlgmsoZAA--.8933S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF43KFWxZFyxZFW8GFWxZwb_yoWfCFg_ta
        s293WkCrWfJF4ft3y8Xr1UGFy3u3y7Z3WrCFn8XF10qa90vFn3JFWUAayDCr1fWFyY9rs3
        Xr4kWr18AF1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbf8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF
        7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F4
        0Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC
        6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ry5MxAIw28IcxkI7VAKI4
        8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
        Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
        AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8M7K3UUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The module is now supported, enable it.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..e31176ac0ac2 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -101,6 +101,15 @@ uart0: serial@1fe00000 {
 			no-loopback-test;
 		};
 
+		pm: power-controller {
+			device_type = "power management";
+			compatible = "loongson, reset-controller";
+			reg = <0 0x1fe0700c 0 0x8>,
+				<0 0x1fe07014 0 0x8>,
+				<0 0x1fe07030 0 0x8>;
+			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls2k-pci";
 			device_type = "pci";
-- 
2.31.0

