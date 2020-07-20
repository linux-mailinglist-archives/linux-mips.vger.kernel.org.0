Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F122258DD
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 09:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgGTHoJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 03:44:09 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41308 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgGTHoJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 03:44:09 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id C2CAA1FEB4;
        Mon, 20 Jul 2020 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595231049; bh=1agkTCChFFKEns9U88+0HkPfubwkBpH/BY7hu2/r318=;
        h=From:To:Cc:Subject:Date:From;
        b=Up3OW7briPnLfjQc3Bd4wcOMg9f+uxow15iQh1aTiwSkdXVLeSi6EC001B4MxsCE4
         SRF08D6CL0wEFkUtmt/WmeJ4SBhCBm5ub29YkA/f/5WtdtltGbAoZ6Ik4uO+b5LvMU
         reMlv4fE8R49YLJdtp7nYt9HmOaphBKIpCHRzj1ib16MDOyLFHCLic6yYfBp77EKSB
         rsJZzxR78mwHFiDuDN3xKlWaSXs7+wbz+Riy0RZR1Qpa1UGxD2CUldoxXSfLpBux99
         u4tWpqY5ge2eCi+1OBh5xK8NH74Y697vjVPRPXDn0Ee7YWgBjXFpxn2lO1gjbFI4kl
         9bMZWpUAUMDHw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] MIPS: Loongson64: Process ISA Node in DeviceTree
Date:   Mon, 20 Jul 2020 15:42:33 +0800
Message-Id: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This series convert reservation of Loongson64 Logic PIO into DeviceTree based
method.

It can be used to replace Huacai's
"MIPS: Loongson64: Reserve legacy MMIO space according to bridge type".

Thanks.

Jiaxun Yang (5):
  of_address: Add bus type match for pci ranges parser
  MIPS: Loongson64: Process ISA Node in DeviceTree
  MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
  MIPS: Loongson64: DTS: Fix ISA range for RS780E PCH
  MIPS: Loongson64: Add ISA node for LS7A PCH

 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  7 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  2 +-
 arch/mips/include/asm/io.h                    |  3 +-
 .../mips/include/asm/mach-loongson64/spaces.h |  3 +-
 arch/mips/loongson64/init.c                   | 85 +++++++++++++------
 drivers/of/address.c                          | 15 +++-
 include/linux/of_address.h                    |  3 +
 7 files changed, 85 insertions(+), 33 deletions(-)

-- 
2.28.0.rc1

