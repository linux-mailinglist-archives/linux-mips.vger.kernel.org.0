Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165CA24184E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 10:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgHKIdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 04:33:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56696 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728224AbgHKIdY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 04:33:24 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeMXKVzJfOlcHAA--.16S2;
        Tue, 11 Aug 2020 16:33:16 +0800 (CST)
From:   XingxingSu <suxingxing@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: MIPS/VZ: Fix build error caused by 'kvm_run' cleanup
Date:   Tue, 11 Aug 2020 16:33:14 +0800
Message-Id: <1597134794-20611-1-git-send-email-suxingxing@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxeMXKVzJfOlcHAA--.16S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYd7k0a2IF6FyUM7kC6x804xWl14x267AK
        xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
        6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
        1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
        0487M2AExVAIFx02aVAFz4v204v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4kE6I8I3I0E14AKx2xKxVC2ax8xMxkIecxEwVAFwVW8ZwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r1j6r18MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
        cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jVUDJUUUUU=
X-CM-SenderInfo: pvx0x0xj0l0wo6or00hjvr0hdfq/1tbiAQAFC13QvMLnFwABsN
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit c34b26b98caca48ec9ee9 ("KVM: MIPS: clean up redundant 'kvm_run'
parameters") remove the 'kvm_run' parameter in kvm_vz_gpsi_lwc2.

The following build error:

arch/mips/kvm/vz.c: In function ‘kvm_trap_vz_handle_gpsi’:
arch/mips/kvm/vz.c:1243:43: error: ‘run’ undeclared (first use in this function)
   er = kvm_vz_gpsi_lwc2(inst, opc, cause, run, vcpu);
                                           ^~~
arch/mips/kvm/vz.c:1243:43: note: each undeclared identifier is reported only 
 once for each function it appears in
scripts/Makefile.build:283: recipe for target 'arch/mips/kvm/vz.o' failed
make[2]: *** [arch/mips/kvm/vz.o] Error 1
scripts/Makefile.build:500: recipe for target 'arch/mips/kvm' failed
make[1]: *** [arch/mips/kvm] Error 2
Makefile:1785: recipe for target 'arch/mips' failed
make: *** [arch/mips] Error 2


Signed-off-by: XingxingSu <suxingxing@loongson.cn>
---
 arch/mips/kvm/vz.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 3932f76..49c6a2a 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -1142,7 +1142,6 @@ static enum emulation_result kvm_vz_gpsi_cache(union mips_instruction inst,
 #ifdef CONFIG_CPU_LOONGSON64
 static enum emulation_result kvm_vz_gpsi_lwc2(union mips_instruction inst,
 					      u32 *opc, u32 cause,
-					      struct kvm_run *run,
 					      struct kvm_vcpu *vcpu)
 {
 	unsigned int rs, rd;
@@ -1240,7 +1239,7 @@ static enum emulation_result kvm_trap_vz_handle_gpsi(u32 cause, u32 *opc,
 #endif
 #ifdef CONFIG_CPU_LOONGSON64
 	case lwc2_op:
-		er = kvm_vz_gpsi_lwc2(inst, opc, cause, run, vcpu);
+		er = kvm_vz_gpsi_lwc2(inst, opc, cause, vcpu);
 		break;
 #endif
 	case spec3_op:
-- 
2.1.0

