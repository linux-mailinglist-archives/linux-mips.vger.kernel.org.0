Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4B91B030E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgDTHed (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725994AbgDTHec (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 03:34:32 -0400
X-Greylist: delayed 1318 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Apr 2020 00:34:32 PDT
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A83EC061A0C;
        Mon, 20 Apr 2020 00:34:32 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 69C8920CEA;
        Mon, 20 Apr 2020 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587368071; bh=gcui++ieWd7uwUAXv2hAzwbMmKtI8T9QNmQZh73J2Qk=;
        h=From:To:Cc:Subject:Date:From;
        b=XHmXv7huslucaxXmqOOJUJ/Win32d7xMmz0ZjpHmbC0Jbfd6DEG2cb+lNrY8P+XGL
         pxHRSUBpO2XZ+N7V5RXmie5d9KZuI1fS7dkHYPSUXJjGBjLhSrLmTgQWpdlBSZ+5+a
         xeqNgPtWPiTVfGg4eJMnMWAUXp1Qo+tpVJ2ZUrQv5sKJdfdDZ4GtVgEEDs5cYP9NKe
         dhTnof8mboy9kUY32glwsQJJWResjPdnOeeTIOYVsKHaIthmuGiOlMXX8XTR9b3oAZ
         iOypWNY/ki9OZyDBFYXzhY9cfu9j40Vkz02XfB+NLtuNdFU4BubiUCFRN2VMcdJjDt
         obnScb8DT0sEw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/5] Loongson64: RS780E clean-ups
Date:   Mon, 20 Apr 2020 15:33:35 +0800
Message-Id: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Basically ensure all RS780E stuff is enabled by DeviceTree.
So I can post LS7A support later on.

Hi Thomas, could you please pick them into MIPS tree?

Thanks.

Jiaxun Yang (5):
  MIPS: Loongson64: Remove dead RTC code
  MIPS: Loongson64: Make RS780E ACPI as a platform driver
  dt-bindings: Document Loongson RS780E PCH ACPI Controller
  MIPS: DTS: Loongson64: Add ACPI Controller Node
  MIPS: Loongson64: Mark RS780 HPET as broken

 .../bindings/mips/loongson/rs780e-acpi.yaml   | 40 +++++++++++++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  5 ++
 .../include/asm/mach-loongson64/mc146818rtc.h | 36 ------------
 arch/mips/loongson64/Kconfig                  | 12 +---
 arch/mips/loongson64/Makefile                 |  3 +-
 arch/mips/loongson64/rtc.c                    | 39 -------------
 arch/mips/loongson64/time.c                   |  8 +--
 drivers/platform/mips/Kconfig                 |  6 ++
 drivers/platform/mips/Makefile                |  1 +
 .../platform/mips/rs780e-acpi.c               | 58 ++++++++++++-------
 10 files changed, 95 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/rs780e-acpi.yaml
 delete mode 100644 arch/mips/include/asm/mach-loongson64/mc146818rtc.h
 delete mode 100644 arch/mips/loongson64/rtc.c
 rename arch/mips/loongson64/acpi_init.c => drivers/platform/mips/rs780e-acpi.c (70%)

-- 
2.26.0.rc2

