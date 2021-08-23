Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8D3F4E90
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhHWQjx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:53 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50534 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230226AbhHWQju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:50 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D897A60091;
        Tue, 24 Aug 2021 00:31:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736307; bh=V6RSRR90Ws4Iuhqs3uHJEng/UiOCuLvgTuY18AE6/2U=;
        h=From:To:Cc:Subject:Date:From;
        b=aJpnNDCZiSmdCnYl4YO84XMFJJKaEDihBxaiw+jneGZMwPyoGvvnz38lrB0JjH2/s
         K086/cVTJh5dVDI/FzbaCi+1Y23b0+DhuKtB60PNwxQEjyg1TZfIoeyVT8SUKgZbEQ
         COPLpT+T14V2w5zDs54oTlEQ5Y8HRoiCyNwQJQPI=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH RESEND v5 0/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Tue, 24 Aug 2021 00:31:36 +0800
Message-Id: <20210823163142.586529-1-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm resending the series after waiting for seven rc's without any response;
did I overlook any submission procedure? Rebased against current rtc-next
and tweaked Cc's for this submission, though.

This is all compiled and tested on a 3A4000 box, as usual. 3A3000+7A and
2K systems are tested previously, and these should not be affected. (To
Loongson employees reading this: please test on your rigs and give
feedback, for getting this done before the next merge window!)

While we're at it, I'd like to know which tree should this series go in via;
is it rtc-next or mips-next? I'd prefer mips-next, since the last 4 patches
all deal with MIPS things.


Original cover letter:

This patch series adds support for the RTC module found on various
Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
The driver is rewritten from an out-of-tree version to meet mainline
standards. I write kernel code as a hobby, though, so there might still
be overlooked issues. Any suggestions are welcome.

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


base-commit: 8158da6a33f2656c2a98c30eb9185a44e215a6b6
-- 
2.33.0

