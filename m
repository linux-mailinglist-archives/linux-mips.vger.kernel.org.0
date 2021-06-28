Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6BF3B670E
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 18:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhF1Qy3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 12:54:29 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51256 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S231925AbhF1Qy2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 12:54:28 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B3BC960110;
        Tue, 29 Jun 2021 00:46:23 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1624898783; bh=1D8le36pNvIZZEOHon55LA/UfimI8BBPaGuhrlNC+m8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wj/KVPlo/2vt5MUO15OhEn3+obWuYxOjqedvj2iapmd7PKFcNYQ33rjsWIDXuomD3
         tLLgM3qxSK3xAD7/kHrQmE0PZfOYcg4TZzPfxiGiRTfE9QCqoxQwR+t5u7SKRdEXFP
         I2ArwUeKA0IgEWrCJaGg3NlaFXI+NdF76ITjAXSM=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v4 5/6] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Date:   Tue, 29 Jun 2021 00:45:51 +0800
Message-Id: <20210628164552.1006079-6-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210628164552.1006079-1-git@xen0n.name>
References: <20210628164552.1006079-1-git@xen0n.name>
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
2.30.1

