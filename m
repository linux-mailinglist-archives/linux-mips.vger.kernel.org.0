Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D36E72B078
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jun 2023 07:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbjFKF7R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Jun 2023 01:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFKF7J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Jun 2023 01:59:09 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC382DF
        for <linux-mips@vger.kernel.org>; Sat, 10 Jun 2023 22:59:06 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8CxvOqnYoVkv4gCAA--.5859S3;
        Sun, 11 Jun 2023 13:59:03 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxC8qnYoVk_4YRAA--.42370S2;
        Sun, 11 Jun 2023 13:59:03 +0800 (CST)
From:   Sui Jingfeng <suijingfeng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        "David S . Miller" <davem@davemloft.net>,
        Tony Nguyen <anthony.l.nguyen@intel.com>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Loongson64: loongson3_defconfig: Enable amdgpu drm driver
Date:   Sun, 11 Jun 2023 13:59:03 +0800
Message-Id: <20230611055903.802801-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxC8qnYoVk_4YRAA--.42370S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr43uw4ktFWDtw1UuFykJFc_yoWfArg_ta
        12ka1Uur45AFW7WFZ7X3s5u3s0ka4UWF18ArnrJr1xZ3yjkrnxXrZ7AFy8Grn8W34DKrW3
        AaykJFy7CF1SqosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
        s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
        cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
        vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWU
        JVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
        0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
        Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
        8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
        wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
        v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
        Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
        AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7XTmDUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As it's usuable on LS3A4000 platform. Tested with RX550, glmark2
got about 4235 score.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 6f4a52608ea4..3087e64e6ebe 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -276,6 +276,13 @@ CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
+CONFIG_DRM_AMDGPU=m
+CONFIG_DRM_AMDGPU_SI=y
+CONFIG_DRM_AMDGPU_CIK=y
+CONFIG_DRM_AMDGPU_USERPTR=y
+CONFIG_DRM_AMD_ACP=y
+CONFIG_DRM_AMD_DC=y
+CONFIG_DRM_AMD_DC_SI=y
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
-- 
2.25.1

