Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5688B1DF7B0
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 15:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbgEWNhR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 09:37:17 -0400
Received: from [115.28.160.31] ([115.28.160.31]:60620 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S2387860AbgEWNhR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 May 2020 09:37:17 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B3BB960117;
        Sat, 23 May 2020 21:37:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590241034; bh=jiErD79j8jI7exEGHJfF3TMmJiuObYzQQ9MNIDgwOpA=;
        h=From:To:Cc:Subject:Date:From;
        b=UHUrgHY7ZOG/wbUNIsSPSm8lUEx98vIoHSj2exaIqfH187qPt0DcoCUgp0SYB6wPK
         xuiTyZfw2v/QuieRJRclSqq7POLYUq5whk0UAWBvXOdhyHhlU0hMcnqjOfGIoJMbnj
         kJtFm+CnUuOR1y0N/lQBGQ1QV8ppuR4teiha9xNY=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>
Subject: [PATCH v4 0/1] CPUCFG emulation on older Loongson64 cores
Date:   Sat, 23 May 2020 21:37:00 +0800
Message-Id: <20200523133701.40367-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch brings the CPUCFG instruction to older Loongson64 cores,
enabling a unified way to query processor characteristics on Loongson64
systems. Previous question of how to best integrate machtype-specific
and machtype-agnostic cpu probe logic is resolved. (thanks Thomas for
reviewing!)

Tested on Loongson-3A3000.

Also, to aid userspace in determining CPUCFG availability without having
to handle SIGILL or parse /proc/cpuinfo, a new HWCAP flag is to be added
in a later patch. I am waiting for consensus before implementing this,
as it would be part of userspace ABI.

v4:
- Fixed line wrapping as suggested by Huacai

v3:
- Fixed build on !CONFIG_MACH_LOONGSON64
- Refactored to minimize intrusion to machtype-agnostic cpu probe logic
- Minor tweaks to comment and Kconfig wording
- Dropped Reviewed-by and Tested-by from Jiaxun as the code is
  refactored significantly

v2:
- Fixed one more typo in loongson_regs.h
- Merged simulate_loongson3_csr and simulate_loongson3_csr_cpucfg into
  one (simulate_loongson3_cpucfg), per Huacai's suggestion

WANG Xuerui (1):
  MIPS: emulate CPUCFG instruction on older Loongson64 cores

 arch/mips/Kconfig                             |  12 +
 arch/mips/include/asm/cpu-info.h              |   9 +
 .../include/asm/mach-loongson64/cpucfg-emul.h |  63 +++++
 arch/mips/kernel/cpu-probe.c                  |   9 +
 arch/mips/kernel/traps.c                      |  45 ++++
 arch/mips/loongson64/Makefile                 |   1 +
 arch/mips/loongson64/cpucfg-emul.c            | 217 ++++++++++++++++++
 7 files changed, 356 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
 create mode 100644 arch/mips/loongson64/cpucfg-emul.c

-- 
2.21.0

