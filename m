Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AA12418E9
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 11:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgHKJbp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 05:31:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39742 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728397AbgHKJbo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 05:31:44 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT9x6ZTJfGGAHAA--.60S2;
        Tue, 11 Aug 2020 17:31:38 +0800 (CST)
From:   Xingxing Su <suxingxing@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] KVM: MIPS/VZ: Fix build error caused by 'kvm_run' cleanup
Date:   Tue, 11 Aug 2020 17:31:37 +0800
Message-Id: <1597138297-2105-1-git-send-email-suxingxing@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT9x6ZTJfGGAHAA--.60S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYl7k0a2IF6F4UM7kC6x804xWl14x267AK
        xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
        6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
        1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
        0487M2AExVAIFx02aVAFz4v204v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwAKzVC20s0267AEwI8IwI0ExsIj0wCY02Avz4vE14v_GFWl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUJVWUGwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzMa0DUUUU
X-CM-SenderInfo: pvx0x0xj0l0wo6or00hjvr0hdfq/1tbiAQAFC13QvMLodgACsg
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

Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---
 +cc Paolo Bonzini <pbonzini@redhat.com> and kvm@vger.kernel.org.

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

