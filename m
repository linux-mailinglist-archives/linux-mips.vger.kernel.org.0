Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF773B9C9D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 08:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhGBG5z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 02:57:55 -0400
Received: from [115.28.160.31] ([115.28.160.31]:41730 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230041AbhGBG5y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 02:57:54 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2CF946010F;
        Fri,  2 Jul 2021 14:55:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1625208920; bh=wr8pdF/uLgE9SxIbFtGDiRnQR9+Ym3MJC/X+Rba44QM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PIYTXgYmmIaHubRfism6W9MfxuxPyR7kP68RFbZP+GUkv8tfPn5s+BGrVKA8/jizk
         SvhLkRSiwS1Hk6gJLc8slu0hGJatrGYB4obfEw4s0NmBPB5VwV2zfvnkH8eavDssXk
         nol9oifLGIuET1pe+mLBsuL8nm/FogWVTVII+SPQ=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v5 3/6] MIPS: Loongson64: DTS: Add RTC support to LS7A
Date:   Fri,  2 Jul 2021 14:54:48 +0800
Message-Id: <20210702065451.1175356-4-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210702065451.1175356-1-git@xen0n.name>
References: <20210702065451.1175356-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The LS7A RTC module is now supported, enable it.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..82035de4774f 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,6 +19,11 @@ pic: interrupt-controller@10000000 {
 			#interrupt-cells = <2>;
 		};
 
+		rtc0: rtc@100d0100 {
+			compatible = "loongson,ls2x-rtc";
+			reg = <0 0x100d0100 0 0x78>;
+		};
+
 		ls7a_uart0: serial@10080000 {
 			compatible = "ns16550a";
 			reg = <0 0x10080000 0 0x100>;
-- 
2.30.1

