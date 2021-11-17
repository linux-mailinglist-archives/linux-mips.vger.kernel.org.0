Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785A0454343
	for <lists+linux-mips@lfdr.de>; Wed, 17 Nov 2021 10:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbhKQJHD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Nov 2021 04:07:03 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43260 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230064AbhKQJHB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Nov 2021 04:07:01 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmuRUxZRhitQAAA--.4743S2;
        Wed, 17 Nov 2021 17:03:16 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Do not define pci_remap_iospace() under MACH_LOONGSON64
Date:   Wed, 17 Nov 2021 17:03:15 +0800
Message-Id: <1637139795-3032-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxmuRUxZRhitQAAA--.4743S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4DCF45WFW8AFyUAry3XFb_yoW5tw4kpF
        sIvwn7Gr4rCr45AFWUJry5Jr98XFZ0yay3tF18JrnxZF1DuryUJr1xtF1I9ryDJFWUtayx
        XF4v9r4jqF1Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUOo7ZUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 9f76779f2418 ("MIPS: implement architecture-specific
'pci_remap_iospace()'"), there exists the following warning on the
Loongson64 platform:

    loongson-pci 1a000000.pci:       IO 0x0018020000..0x001803ffff -> 0x0000020000
    loongson-pci 1a000000.pci:      MEM 0x0040000000..0x007fffffff -> 0x0040000000
    ------------[ cut here ]------------
    WARNING: CPU: 2 PID: 1 at arch/mips/pci/pci-generic.c:55 pci_remap_iospace+0x84/0x90
    resource start address is not zero
    ...
    Call Trace:
    [<ffffffff8020dc78>] show_stack+0x40/0x120
    [<ffffffff80cf4a0c>] dump_stack_lvl+0x58/0x74
    [<ffffffff8023a0b0>] __warn+0xe0/0x110
    [<ffffffff80cee02c>] warn_slowpath_fmt+0xa4/0xd0
    [<ffffffff80cecf24>] pci_remap_iospace+0x84/0x90
    [<ffffffff807f9864>] devm_pci_remap_iospace+0x5c/0xb8
    [<ffffffff808121b0>] devm_of_pci_bridge_init+0x178/0x1f8
    [<ffffffff807f4000>] devm_pci_alloc_host_bridge+0x78/0x98
    [<ffffffff80819454>] loongson_pci_probe+0x34/0x160
    [<ffffffff809203cc>] platform_probe+0x6c/0xe0
    [<ffffffff8091d5d4>] really_probe+0xbc/0x340
    [<ffffffff8091d8f0>] __driver_probe_device+0x98/0x110
    [<ffffffff8091d9b8>] driver_probe_device+0x50/0x118
    [<ffffffff8091dea0>] __driver_attach+0x80/0x118
    [<ffffffff8091b280>] bus_for_each_dev+0x80/0xc8
    [<ffffffff8091c6d8>] bus_add_driver+0x130/0x210
    [<ffffffff8091ead4>] driver_register+0x8c/0x150
    [<ffffffff80200a8c>] do_one_initcall+0x54/0x288
    [<ffffffff811a5320>] kernel_init_freeable+0x27c/0x2e4
    [<ffffffff80cfc380>] kernel_init+0x2c/0x134
    [<ffffffff80205a2c>] ret_from_kernel_thread+0x14/0x1c
    ---[ end trace e4a0efe10aa5cce6 ]---
    loongson-pci 1a000000.pci: error -19: failed to map resource [io  0x20000-0x3ffff]

We can see that the resource start address is 0x0000020000, because
the ISA Bridge used the zero address which is defined in the dts file
arch/mips/boot/dts/loongson/ls7a-pch.dtsi:

    ISA Bridge: /bus@10000000/isa@18000000
    IO 0x0000000018000000..0x000000001801ffff  ->  0x0000000000000000

The architecture-independent function pci_remap_iospace() works well
for Loongson64, so just do not define architecture-specific function
pci_remap_iospace() under MACH_LOONGSON64.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/pci.h | 2 ++
 arch/mips/pci/pci-generic.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 421231f..5d647cb 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -21,8 +21,10 @@
 #include <linux/of.h>
 
 #ifdef CONFIG_PCI_DRIVERS_GENERIC
+#ifndef CONFIG_MACH_LOONGSON64
 #define pci_remap_iospace pci_remap_iospace
 #endif
+#endif
 
 #ifdef CONFIG_PCI_DRIVERS_LEGACY
 
diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
index 18eb8a4..6f18071 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -47,6 +47,7 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	pci_read_bridge_bases(bus);
 }
 
+#ifndef CONFIG_MACH_LOONGSON64
 int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
 {
 	unsigned long vaddr;
@@ -60,3 +61,4 @@ int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
 	set_io_port_base(vaddr);
 	return 0;
 }
+#endif
-- 
2.1.0

