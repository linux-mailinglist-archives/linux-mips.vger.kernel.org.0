Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96EC522D3A4
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 03:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgGYBqc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 21:46:32 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41896 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgGYBqb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 21:46:31 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 764361FECB;
        Sat, 25 Jul 2020 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595641591; bh=7kyPXpWNdFxYWiKuEJD7T9ohyci+Zzk/Mord055cn14=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mEBGy4Fym6NtnBXRZJkhujgwJrfCIQuHLwfOioTZs3XsccbHul6n1bfGqCAn9yaej
         lQImQ9vJXBDQmBdQ/UQunZa9PSvcScX2tDnqQgnuFy0imiOAScHRfFBe0GUN/3PZrD
         HEFQYOJpOz7T63C3QksL43ziksaOgRPoN4wWTn4aWoiB9AB3+0nK3fez+2gAm0Drtb
         26cvZlnfr9kn8YjE2mXgmxT2V7ios7of3AX2VyztTzM3CVxPAJ1r4/9i0D9cgxT4UO
         3aQDcDrO1vtrZ1h5NGPmMV3YPqv6EO6Xo3DNx0NvYbcNLSMUokzOEiDmqkduDnOj6J
         LH5aIWB/VkYgg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] MIPS: Loongson64: DTS: Fix ISA range for RS780E PCH
Date:   Sat, 25 Jul 2020 09:45:18 +0800
Message-Id: <20200725014529.1143208-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
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

