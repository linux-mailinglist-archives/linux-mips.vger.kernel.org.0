Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E94F262D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 05:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733028AbfKGEBs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 23:01:48 -0500
Received: from forward104p.mail.yandex.net ([77.88.28.107]:51509 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727279AbfKGEBs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 23:01:48 -0500
Received: from mxback14j.mail.yandex.net (mxback14j.mail.yandex.net [IPv6:2a02:6b8:0:1619::90])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 518664B0072E;
        Thu,  7 Nov 2019 07:01:45 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback14j.mail.yandex.net (mxback/Yandex) with ESMTP id gnnIXZKcO4-1ijmIAt2;
        Thu, 07 Nov 2019 07:01:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573099305;
        bh=lZEvnysBLApfP6Z6e7ziHa8XovtzkG65pRIz7PSeSMc=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=Ozx8WMuCAnniDIw1vUEOq39UU82dmqx/K8jPhhd4khDFeiY6h1xneVtFBF02Vwe1Z
         mWYNfd2Ut/LI7jwABGOtarV3M4mOunhQADxk83SOfY1FQN9KE7o9LnHd7v9BTv2FRJ
         Eg7hlb5djY40uCxtSnwV8C5Yk34sfrA7VT44ecJc=
Authentication-Results: mxback14j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id Z8DeRIVREY-1fVm9hZb;
        Thu, 07 Nov 2019 07:01:43 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/5] Loongson cleanups
Date:   Thu,  7 Nov 2019 12:01:13 +0800
Message-Id: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,
This series reduced duplicated code in Loongson platform.



Jiaxun Yang (5):
  MIPS: Drop pmon.h
  MIPS: Loongson{2ef, 32, 64} convert to generic fw cmdline
  MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED
  MIPS: Loongson2ef: Convert to early_printk_8250
  MIPS: Loongson64: Drop setup_pcimap

 arch/mips/Kconfig                             |  3 -
 .../include/asm/mach-loongson2ef/loongson.h   |  2 -
 arch/mips/include/asm/mach-loongson32/prom.h  | 20 -------
 .../include/asm/mach-loongson64/loongson.h    |  1 -
 arch/mips/include/asm/pgtable.h               | 11 ----
 arch/mips/include/asm/pmon.h                  | 46 ---------------
 arch/mips/kernel/smp-bmips.c                  |  1 -
 arch/mips/loongson2ef/Kconfig                 |  2 +
 arch/mips/loongson2ef/common/Makefile         |  3 +-
 arch/mips/loongson2ef/common/cmdline.c        | 44 --------------
 arch/mips/loongson2ef/common/early_printk.c   | 38 ------------
 arch/mips/loongson2ef/common/env.c            | 26 ++------
 arch/mips/loongson2ef/common/init.c           |  5 +-
 arch/mips/loongson2ef/common/mem.c            | 58 ------------------
 arch/mips/loongson2ef/common/uart_base.c      |  2 +
 arch/mips/loongson32/common/prom.c            | 59 ++++---------------
 arch/mips/loongson32/common/setup.c           | 11 ++--
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/cmdline.c                | 42 -------------
 arch/mips/loongson64/init.c                   |  3 +-
 arch/mips/loongson64/pci.c                    | 43 --------------
 21 files changed, 32 insertions(+), 390 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-loongson32/prom.h
 delete mode 100644 arch/mips/include/asm/pmon.h
 delete mode 100644 arch/mips/loongson2ef/common/cmdline.c
 delete mode 100644 arch/mips/loongson2ef/common/early_printk.c
 delete mode 100644 arch/mips/loongson64/cmdline.c

-- 
2.20.1

