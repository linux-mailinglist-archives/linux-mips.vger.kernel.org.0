Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3199D3F4E87
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhHWQju (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:50 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50532 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229962AbhHWQju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:50 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8FEA760130;
        Tue, 24 Aug 2021 00:31:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736312; bh=DPCQYyRloT+9gMDTjobkUPZF1BIgBb9DqryZdjnzCcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gozOfegG1jluhmPvtU7+PPD8W1r1u0kBMYbpzSEF/J08YiUHyGTRB/2PvQeUPNvM+
         upaKgIZo4s0Ssw3F3z8Q9Y16WX82dTMWk7gIWNBgcn4Vu+z26c05iY3A6x/gXZmh4q
         L4f5eNBk5rlI2jvAQgp/OGFte3P/znGRfeEBcS5Q=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 5/6] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Date:   Tue, 24 Aug 2021 00:31:41 +0800
Message-Id: <20210823163142.586529-6-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Loongson-2K RTC module is now supported, enable it.

The MMIO address is unclear from the Loongson 2K1000 user manual, I took
it from Loongson's out-of-tree fork of Linux 4.19.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: zhaoxiao <zhaoxiao@uniontech.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index bfc3d3243ee7..4a04e1dc5fda 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -52,6 +52,11 @@ package0: bus@10000000 {
 			0 0x40000000 0 0x40000000 0 0x40000000
 			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
 
+		rtc0: rtc@1fe07800 {
+			compatible = "loongson,ls2x-rtc";
+			reg = <0 0x1fe07800 0 0x78>;
+		};
+
 		liointc0: interrupt-controller@1fe11400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0 0x1fe11400 0 0x40>,
-- 
2.33.0

