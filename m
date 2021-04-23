Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55782368B6A
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 05:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbhDWDHy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 23:07:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45888 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229943AbhDWDHy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Apr 2021 23:07:54 -0400
Received: from localhost.localdomain (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb+7bOYJgobQMAA--.4828S2;
        Fri, 23 Apr 2021 11:07:10 +0800 (CST)
From:   xiaochuan mao <maoxiaochuan@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        xiaochuan mao <maoxiaochuan@loongson.cn>
Subject: [PATCH] MIPS:DTS:Correct the license for Loongson-2K
Date:   Fri, 23 Apr 2021 11:06:56 +0800
Message-Id: <20210423030656.25632-1-maoxiaochuan@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9Dxb+7bOYJgobQMAA--.4828S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJw1kXF4DWF1xCw4xuFWUtwb_yoWxWFb_tF
        1Ikws5Ga4rWF1ft3y8Xr1UXFW7u345W3Z5CF18Xr1FqasIyr93JFWUCayDGF13Wry2vrs3
        Xrs5WF18AFWIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb2g4DUUUUU==
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

make license from GPL3.0 to GPL2.0

Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 89f079097f32..569e814def83 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-3.0
+// SPDX-License-Identifier: GPL-2.0
 
 /dts-v1/;
 
-- 
2.17.1

