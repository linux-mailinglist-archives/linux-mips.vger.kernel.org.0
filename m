Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1962281D6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 16:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbgGUOSf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 10:18:35 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41568 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOSe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 10:18:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id CF6DA1FEB4;
        Tue, 21 Jul 2020 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595341113; bh=7kyPXpWNdFxYWiKuEJD7T9ohyci+Zzk/Mord055cn14=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JAUCNyipqyESTVsdn4u+7HA0OzfLHkI6Lg99tzqNHkpPi4eQi+O4v+NlXnSu6Zw+z
         h7qnYbqAaIEO1hYX7MIw5tJbmU4laMDda4Bo9uwLSt0ozrL/dfhzXh3tzAicKcyNyb
         xSb1zwss+kI5YTuz6FUOW9RQA2KBuRQ2bJs6T3tlqPng92+uAOKOlyO/dNEXxIoSRU
         6BB7dJOpGxYFiQYTFRmO3yG5Pzt28vLxjb/KHRdOq72pEjs9pVuKQBEiTbW3YB8j4S
         nBdyQSXTjud021yuFxU/aphMZo4xcIkCpiFnVLgmqzKw361uiIPLlX/zPLp7y4E2+a
         VNHT2caz1GQKA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] MIPS: Loongson64: DTS: Fix ISA range for RS780E PCH
Date:   Tue, 21 Jul 2020 22:17:32 +0800
Message-Id: <20200721141742.996350-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ranges should express the actual physical address on bus.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
index d4c803d74036..99174b52dfb8 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -25,7 +25,7 @@ isa {
 			compatible = "isa";
 			#address-cells = <2>;
 			#size-cells = <1>;
-			ranges = <1 0 0 0 0x4000>;
+			ranges = <1 0 0 0x18000000 0x4000>;
 
 			rtc0: rtc@70 {
 				compatible = "motorola,mc146818";
-- 
2.28.0.rc1

