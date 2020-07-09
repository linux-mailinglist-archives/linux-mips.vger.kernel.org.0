Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412A62196E8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 05:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgGIDz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 23:55:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49276 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgGIDz0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 23:55:26 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxqdQplQZfXJUAAA--.714S2;
        Thu, 09 Jul 2020 11:55:22 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tsbogend@alpha.franken.de, lixuefeng@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] MIPS: Loongson: Fix some issues of cpu_hwmon.c
Date:   Thu,  9 Jul 2020 11:55:18 +0800
Message-Id: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9CxqdQplQZfXJUAAA--.714S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
        80aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
        cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx
        0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAC
        jI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s
        026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
        JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
        v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
        j40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
        W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUTmh5UUUUU==
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v2:
  - Drop the patch "MIPS: Loongson: Add hwmon support for generic CPU"
  - Reduce possible loop times in do_thermal_timer()

v3:
  - Fix boot warning about hwmon_device_register()

Tiezhu Yang (2):
  MIPS: Loongson: Cleanup cpu_hwmon.c
  MIPS: Loongson: Reduce possible loop times and add log in
    do_thermal_timer()

Zhi Li (1):
  MIPS: Loongson: Fix boot warning about hwmon_device_register()

 drivers/platform/mips/cpu_hwmon.c | 66 +++++++++++++++------------------------
 1 file changed, 25 insertions(+), 41 deletions(-)

-- 
2.1.0

