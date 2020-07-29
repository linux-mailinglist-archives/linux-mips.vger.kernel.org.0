Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD880231F12
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 15:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2NOd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 09:14:33 -0400
Received: from [115.28.160.31] ([115.28.160.31]:44456 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbgG2NOd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 09:14:33 -0400
Received: from ld50.lan (unknown [140.207.23.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 36EE360130;
        Wed, 29 Jul 2020 21:14:22 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1596028462; bh=9S5AgGM+gZJ0G9/uvNqcMrJry6DVjx5+esCqv6MwYVs=;
        h=From:To:Cc:Subject:Date:From;
        b=i3nNzfrmAp8hvw5UEJaqxbZi8ZExqFfKC8IqAIyeEHjiogwcgr1dUsnZ7DD4Y0XTj
         GfhrzJPRCE7355LBZhicVIXHT1UUMw+f0LKErofppf6o9eBm4Z1rpe4ZlPTb2NWmhh
         TaViSfKcIVue4TTZ85mFSRkupEg9oeWr1AOBJdgk=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v5 0/3] Refactor FTLBPar exception handling and add GSExc handler
Date:   Wed, 29 Jul 2020 21:14:13 +0800
Message-Id: <20200729131417.4000213-1-git@xen0n.name>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It was found that some undocumented unprivileged instructions could
crash the kernel with a "FTLB parity error" on Loongson-3A4000, but the
error registers were garbage:

[  896.970419] FTLB error exception, cp0_ecc=0x00000002:
[  896.975446] cp0_errorepc == ffffffffffffffff
[  896.979755] c0_cacheerr == 00000000
[  896.983277] Decoded c0_cacheerr: primary cache fault in insn reference.
[  896.989963] Cache error exception:
[  896.993396] cp0_errorepc == ffffffffffffffff
[  896.997707] c0_cacheerr == 00000000
[  897.001228] Decoded c0_cacheerr: primary cache fault in insn reference.
[  897.007916] Error bits: 
[  897.010467] IDX: 0x00000000
[  897.013284] Kernel panic - not syncing: Can't handle the cache error!
[  897.019807] ---[ end Kernel panic - not syncing: Can't handle the cache error! ]---

Turns out the FTLBPar exception code is actually implementation-specific.
On Loongson cores the exception is "GSExc" instead, and is non-fatal in
Loongson's linux-3.10 fork. So we dynamically register the correct handler
for the exception, and do not panic on the specific undocumented case.

P.S. There is not much space left in the cpuinfo_mips.options flag. We
should consider moving to something like x86's feature flags that is
extensible.

v5:
- Fixed broken build on pre-MIPS32 configs where mfc0 can't have
  selector, pointed out by Thomas. Build-tested ip22_defconfig.

v4:
- Added Reviewed-by tags from Huacai
- Dropped bouncing Cc addresses from the first patch
- Fixed "MFC0" -> "mfc0" in genex.S, as that CP0 register is 32-bit
  according to Loongson's manuals

v3:
- Simplified declaration of cpu_has_gsexcex, as suggested by Huacai

v2:
- Removed stray GSExc logic in cpu_probe_legacy, pointed out by Huacai

WANG Xuerui (3):
  MIPS: only register FTLBPar exception handler for supported models
  MIPS: add definitions for Loongson-specific CP0.Diag1 register
  MIPS: handle Loongson-specific GSExc exception

 arch/mips/include/asm/cpu-features.h |  8 ++++++
 arch/mips/include/asm/cpu.h          |  2 ++
 arch/mips/include/asm/mipsregs.h     | 11 ++++++++
 arch/mips/kernel/cpu-probe.c         | 16 ++++++++++++
 arch/mips/kernel/genex.S             | 14 ++++++++++
 arch/mips/kernel/traps.c             | 38 +++++++++++++++++++++++++++-
 6 files changed, 88 insertions(+), 1 deletion(-)

-- 
2.25.1

