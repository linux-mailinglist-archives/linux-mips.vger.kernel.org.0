Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C3B230749
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 12:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgG1KHG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 06:07:06 -0400
Received: from [115.28.160.31] ([115.28.160.31]:57930 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728439AbgG1KHF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 06:07:05 -0400
Received: from ld50.lan (unknown [140.207.23.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 14BE660130;
        Tue, 28 Jul 2020 18:06:58 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595930818; bh=+eJkWelUGZtHbJQIpbNZhwtqQn98rWLv07lIHN6A55M=;
        h=From:To:Cc:Subject:Date:From;
        b=YxSOTBQB2TpJx5lwXb4fQAp1AcpmYQl6a2o1u+ep8ro88omuYaX6u7vHJA8LzEI2G
         0l/LPkpIIaQL72doMSK41ue1DWz3f7IU9Rf7cJ/PG15xp0jpv8PiLg/ETkfuy9wjCL
         NVb+7o0S8BofbZ/McZQ/n9pRJENHwwt8II5lgzo4=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 0/3] Refactor FTLBPar exception handling and add GSExc handler
Date:   Tue, 28 Jul 2020 18:06:52 +0800
Message-Id: <20200728100655.3005831-1-git@xen0n.name>
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
 arch/mips/kernel/genex.S             |  7 +++++
 arch/mips/kernel/traps.c             | 38 +++++++++++++++++++++++++++-
 6 files changed, 81 insertions(+), 1 deletion(-)

-- 
2.25.1

