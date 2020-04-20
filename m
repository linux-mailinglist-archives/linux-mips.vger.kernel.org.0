Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A2A1B0D26
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 15:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgDTNqs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 09:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726845AbgDTNqs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 09:46:48 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E863CC061A0C;
        Mon, 20 Apr 2020 06:46:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 550A420CDB;
        Mon, 20 Apr 2020 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587390407; bh=e4TY+GCk2Ucsw3BDFnVc289FhHp/EOQdRohUPJEc2V8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wOR1An62VbncU0CYW2EAw5uFVILzJ6aK7EWmFNrlxIt7UpuJ0zyJgKQb/u+1ZpXFM
         b7aktSdXpjWh1rIoZQN36L7XIyvn4KSnoCm3scMkYMETVysA965VfcdByYQy4RgPPd
         Zi7oGcJ1QHhkkbosMZyH0Cdr+BfQI2tePms878XWiTYEdOa5lzUYXp58Pq9xUzkLdL
         /TDxdOThySpGXqV3MNJCK8BYiCc+DS8GkCHIfOraRUD++s/WAyCxazH3pJCCkRyaEx
         KsafmJcxCEfNdPsY/+UKSx8U8wukUc0I7kpOVRE4PXpBi4KSDiWUNS0b2TUpTm/XX9
         CpN8ONb3t2VXw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] MIPS: DTS: Loongson64: Add ACPI Controller Node
Date:   Mon, 20 Apr 2020 21:45:28 +0800
Message-Id: <20200420134536.210475-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420134536.210475-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
 <20200420134536.210475-1-jiaxun.yang@flygoat.com>
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
index 45c54d555fa4..8687c4f7370a 100644
--- a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -21,6 +21,11 @@ rtc0: rtc@70 {
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

