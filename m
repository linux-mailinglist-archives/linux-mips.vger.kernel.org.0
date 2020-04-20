Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0049B1B031E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDTHfF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726036AbgDTHfF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 03:35:05 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34CBC061A0C;
        Mon, 20 Apr 2020 00:35:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 600E620CF4;
        Mon, 20 Apr 2020 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587368104; bh=Y26cj4OjcTdgIsuV6q3GSbE/66vt6PfoP6ukucJn4oo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kupFG06SDYzuFua0FAr0USkKm32SWuhwHOWjsWYEHfWK/y8NvsWe//01cUe43y/Uz
         kBj1+nBDYj5wDadELlO/xitlGcWghVaWbvyOK7Do8586c/JxubKz8i5L4UxkEjdUas
         TrxKrimuPQ/2lzFQ0ZG1ZtJT3dr1bciSBilM7NwcRZDJTwL0Ux2npDzWusl0N9IyQJ
         1ZLifIr2KO/XF4kFsx74PlHxsZoBwhEEBe8m5w4xoMg0HSf6XjVjk2EWm6Y0WMo5K/
         tU6dcI6Ws1N9c9oRTom5oTpDuaXz6TvdbVASYnJW4Qt4kFEkwGFzdfj9E2OAE020dU
         7+bnX2OoRW6zA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 4/5] MIPS: DTS: Loongson64: Add ACPI Controller Node
Date:   Mon, 20 Apr 2020 15:33:39 +0800
Message-Id: <20200420073347.157230-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add ACPI Controller Node for RS780E PCH to fit newly added driver.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
index 8766f97306c6..5e68ceae20ca 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -36,6 +36,11 @@ rtc0: rtc@70 {
 				interrupts = <8>;
 				interrupt-parent = <&htpic>;
 			};
+
+			acpi@800 {
+				compatible = "loongson,rs780e-acpi";
+				reg = <1 0x800 0x100>;
+			};
 		};
 	};
 };
-- 
2.26.0.rc2

