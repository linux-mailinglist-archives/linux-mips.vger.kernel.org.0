Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C689E2C3D34
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 11:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgKYKG5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 05:06:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38438 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726284AbgKYKG5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 05:06:57 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9O8LL5fiH8WAA--.50785S2;
        Wed, 25 Nov 2020 18:06:53 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: [PATCH v2 0/2] IPS: Fix up apply_r_mips_26_rel and add KASLR support for Loongson64
Date:   Wed, 25 Nov 2020 18:06:52 +0800
Message-Id: <1606298812-6928-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxn9O8LL5fiH8WAA--.50785S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY87k0a2IF6w4kM7kC6x804xWl14x267AK
        xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
        6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
        0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z2
        80aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxE
        wVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v2
        6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
        GhF3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Abandon the third patch in v1. There are many other factors that should
be considered. If possible, I'll fix it later.

Jinyang He (2):
  MIPS: KASLR: Correcte valid bits in apply_r_mips_26_rel()
  MIPS: Loongson64: Add KASLR support

 arch/mips/Kconfig           |  5 ++++-
 arch/mips/kernel/relocate.c | 11 +++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.1.0

