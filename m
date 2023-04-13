Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8156E0861
	for <lists+linux-mips@lfdr.de>; Thu, 13 Apr 2023 09:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjDMH6N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Apr 2023 03:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjDMH6M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Apr 2023 03:58:12 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2455F7AB3;
        Thu, 13 Apr 2023 00:58:00 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.110.113])
        by gateway (Coremail) with SMTP id _____8CxidkItjdkKrobAA--.31458S3;
        Thu, 13 Apr 2023 15:58:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.113])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHuQDtjdk7BciAA--.6706S3;
        Thu, 13 Apr 2023 15:57:59 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 1/7] dt-bindings: rtc: Subdivision of LS2X RTC compatible
Date:   Thu, 13 Apr 2023 15:57:33 +0800
Message-Id: <35f43a8cfc32b5a065e4a04eb6cc6abf311f2700.1681370153.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681370153.git.zhoubinbin@loongson.cn>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuQDtjdk7BciAA--.6706S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtw4fArW5Jr4DWrW3Xr15XFb_yoWkZrbE9a
        4Iy34kCws8tF1Sga1DWw4ftw13Z3y2k3W2kwnrtr4Sy34aqrs8KF97tw1akr1fuFW3u3W5
        WFs3GrZ7Z3Z7GjkaLaAFLSUrUUUU5b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        C7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
        JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jz5lbUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The LS2X RTC alarm depends on the associated registers in a separate
power management domain.

In order to define the PM domain addresses of the different chips, a
more detailed description of compatible is required.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index a3603e638c37..2928811b83a0 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -47,8 +47,11 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
-      # Loongson-2K Socs/LS7A bridge Real-time Clock
-      - loongson,ls2x-rtc
+      # Loongson LS7A bridge Real-time Clock
+      - loongson,ls7a-rtc
+      # Loongson-2K Socs Real-time Clock
+      - loongson,ls2k0500-rtc
+      - loongson,ls2k1000-rtc
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3029
       # Real Time Clock
-- 
2.39.1

