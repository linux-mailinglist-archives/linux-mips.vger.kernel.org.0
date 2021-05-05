Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914F53743B1
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhEEQvc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 12:51:32 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46570 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236091AbhEEQrl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 12:47:41 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 May 2021 12:47:31 EDT
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 18EEE63573;
        Thu,  6 May 2021 00:39:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232790; bh=qNMkh41741Clhd1cGymIjFugtw5DUUNvwDVm0UsONMQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cxGar7PRQWVVBN1Qq/veSroQqe/JctA5smZ77V5FU+apBGDTcVYmf+/ueuJtwzw0b
         Pe57ErHtn3jl1k3MIlWE0MHCNy5DXHf7895JuuSTrXNm6XUzMfHssNAb4G9/3Emd35
         HGfxzrzxq3QwfeoS4Hd9RFmh77OUR9Ie1rmwrUaM=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/6] MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
Date:   Thu,  6 May 2021 00:39:04 +0800
Message-Id: <20210505163905.1199923-6-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210505163905.1199923-1-git@xen0n.name>
References: <20210505163905.1199923-1-git@xen0n.name>
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

