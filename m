Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8553B9C8A
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 08:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhGBG5k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 02:57:40 -0400
Received: from [115.28.160.31] ([115.28.160.31]:41716 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230177AbhGBG5h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 02:57:37 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BE9A760105;
        Fri,  2 Jul 2021 14:55:01 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1625208901; bh=8ef0sNiNdWr1zsdqyvom2aHGjqFBvVkkpTBEzmSJGXk=;
        h=From:To:Cc:Subject:Date:From;
        b=Ubzw4JVSmEn7K33xj9e+4xFlmw5zLRYayBt2MDU7qTz1KWeQAZBfBQ+0Edxhut2jQ
         XF0sAwMs9+3cj3vlYgyBCU71q2CzaVu9qyOVkzBZLsJmqi2t9MiM5S+Ht1TkoBqvgI
         HIg/QkZRyIqeNvAOHp+I7xYxgkjwwsY7cVnCrB/M=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 0/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Fri,  2 Jul 2021 14:54:45 +0800
Message-Id: <20210702065451.1175356-1-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series adds support for the RTC module found on various
Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
The driver is rewritten from an out-of-tree version to meet mainline
standards. I write kernel code as a hobby, though, so there might still
be overlooked issues. Any suggestions are welcome.

This series is based on next-20210628, but should apply cleanly on rtc-next
too.

v5:
- Minor changes per Nobuhiro-san's review
  - Simplified one register-write-and-return
  - Explicitly depend on OF, remove of_match_ptr usage for now
- Tested on Loongson-3A4000; 2K should work too because there's no
  functional change either

v4:
- Rebased on top of next-20210628
- Added Jiaxun's Tested-by tag for Loongson-2K; no functional changes
- Addressed all review comments from v3
  - Rewritten field operations with FIELD_GET/FIELD_PREP
  - Removed all error logs
  - Removed unnecessary spinlocking (RTC core already protects against
    concurrent device file operations)

v3:
- Fixed compile error not discovered after rebase (blame sleep
  deprivation)
- Tested on Loongson-3A4000 and Loongson-2K

v2:
- Rebased on top of latest linux-next
- Updated Huacai's e-mail address to the kernel.org one
- Added collected tags
- Added adaptation for newly upstreamed Loongson-2K platforms

WANG Xuerui (6):
  rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
  dt-bindings: rtc: Add bindings for LS2X RTC
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
  MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   5 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   5 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 180 ++++++++++++++++++
 8 files changed, 206 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c


base-commit: 3579aa488520feeda433ceca23ef4704bf8cd280
-- 
2.30.1

