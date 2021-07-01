Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7F63B9213
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 15:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhGANQq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 09:16:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40286 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236567AbhGANQq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Jul 2021 09:16:46 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0OZv91gKz8bAA--.11066S3;
        Thu, 01 Jul 2021 21:14:03 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/3] MIPS: Loongson64: DTS: Add pm block node for Loongson-2K1000
Date:   Thu,  1 Jul 2021 21:13:59 +0800
Message-Id: <20210701131400.4699-2-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210701131400.4699-1-zhangqing@loongson.cn>
References: <20210701131400.4699-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0OZv91gKz8bAA--.11066S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF43KFykZr1fCrWxtFy7Wrg_yoWfAwb_t3
        ZrKF1kGrZ3JFW3J34UXr1UJry3u3y7A3WrCF18XF1Yqas0ywnxJFWUAFWkGFy3JFyj9rs3
        XrW8Wr1kAFWxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbqAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
        1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
        xG6I80ewAv7VACjcxG62k0Y48FwI0_Jr0_Gr1lYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0E
        x4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02
        Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
        1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
        VmFAUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The module is now supported, enable it.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v7-v8:
No change
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 5747f171de29..6004400bb689 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -52,6 +52,11 @@ package0: bus@10000000 {
 			0 0x40000000 0 0x40000000 0 0x40000000
 			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
 
+		pm: power-controller@1fe07000 {
+			compatible = "loongson,ls2k-pm";
+			reg = <0 0x1fe07000 0 0x422>;
+		};
+
 		liointc0: interrupt-controller@1fe11400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0 0x1fe11400 0 0x40>,
-- 
2.31.0

