Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53629661BFF
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jan 2023 02:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbjAIBgR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Jan 2023 20:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjAIBgQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Jan 2023 20:36:16 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04996B1E8;
        Sun,  8 Jan 2023 17:36:14 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8CxPuuOb7tjI2oAAA--.1112S3;
        Mon, 09 Jan 2023 09:36:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxD7+Ib7tjyngWAA--.1145S5;
        Mon, 09 Jan 2023 09:36:13 +0800 (CST)
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
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, WANG Xuerui <git@xen0n.name>
Subject: [PATCH V2 7/7] MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
Date:   Mon,  9 Jan 2023 09:36:32 +0800
Message-Id: <9711159c9a7ec2e9e2cb12b648a564a6fa5f443e.1673227292.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1673227292.git.zhoubinbin@loongson.cn>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxD7+Ib7tjyngWAA--.1145S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrur4fZFykZr43XFyUCr4Uurg_yoW3Gwc_JF
        y7K34kWr4rArWfWa4xXw4rWw1Uuw1UXF48Cry7JF15Xa9Igr13XanrCF15G3Z8W3srKr4Y
        va95CFy7ur1xKjkaLaAFLSUrUUUU5b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        E7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW3AVW8Xw1lYx0E
        x4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7
        CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2
        IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v2
        6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0oKZJUUUUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: WANG Xuerui <git@xen0n.name>

This is now supported, enable for Loongson-2K systems.
Other systems are unaffected.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/configs/loongson2k_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index 728bef666f7a..8000cf838c17 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -278,6 +278,7 @@ CONFIG_USB_SERIAL=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
+CONFIG_RTC_DRV_LS2X=y
 CONFIG_DMADEVICES=y
 # CONFIG_CPU_HWMON is not set
 CONFIG_PM_DEVFREQ=y
-- 
2.31.1

