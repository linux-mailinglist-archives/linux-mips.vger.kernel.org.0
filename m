Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD6A374CAD
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 03:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhEFBFt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 21:05:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51074 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230116AbhEFBFs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 21:05:48 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 85F5D63572;
        Thu,  6 May 2021 09:04:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620263087; bh=qNMkh41741Clhd1cGymIjFugtw5DUUNvwDVm0UsONMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d7SSxdYWQEr9W0vZ1dAlFDLdwWunynk26FTku4S4zRzk/rmxDmKNuWqXLubWjXIrM
         bteSnBwSxl6pyp5QGTYB1PXBGHzGLxYJqNIY2LSfujU7hipefW55ejwSzOBoI9FWOt
         xD8h3iiKejYRHb2PvqNzQkxoOr0HsOCDQcIirQus=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/6] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Date:   Thu,  6 May 2021 09:04:34 +0800
Message-Id: <20210506010435.1333647-6-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210506010435.1333647-1-git@xen0n.name>
References: <20210506010435.1333647-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Loongson-2K RTC module is now supported, enable it.

The MMIO address is unclear from the Loongson 2K1000 user manual, I took
it from Loongson's out-of-tree fork of Linux 4.19.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..0f00080f77b9 100644
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

