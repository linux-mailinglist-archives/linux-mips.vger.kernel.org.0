Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184BC22F5D8
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jul 2020 18:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgG0Qxt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jul 2020 12:53:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:48628 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726620AbgG0Qxt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Jul 2020 12:53:49 -0400
Received: from ld50.lan (unknown [112.64.68.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ABB5B6006D;
        Tue, 28 Jul 2020 00:51:11 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595868671; bh=0DY4w9F/JvIxZoLUyQIMs5zt2ofGuK1nyof5jeq8wA8=;
        h=From:To:Cc:Subject:Date:From;
        b=H/B/SI3wM7DNRHXHEI+N7JUkrPs09kgktnmlRN8+5fQwu+ON0iSQby9ZlEysB1N+J
         lTNrTzXVMDMt57iFoHpevTGZ6lQ+CxBjkd4MB93Eauq2yT4C9hB1wX3gsE47lObtZB
         Bb0/JtDXs5AmqEFmqc9VztJMwWTtPjdrP9tmJiTo=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 0/3] Refactor FTLBPar exception handling and add GSExc handler
Date:   Tue, 28 Jul 2020 00:51:05 +0800
Message-Id: <20200727165108.2378227-1-git@xen0n.name>
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

