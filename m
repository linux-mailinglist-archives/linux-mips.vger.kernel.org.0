Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D800374CA6
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 03:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhEFBFq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 21:05:46 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51070 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229687AbhEFBFp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 21:05:45 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DD37D600BB;
        Thu,  6 May 2021 09:04:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620263086; bh=K0ehAmtye6+D5vkhbi8tBXlfgGVPJ3u4uj/lFn6bk2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YkWWtizo6+qtJqdR2OFvbJdAXcCI3xq26MIU5SMhG1vhOznPuwG4S9k6yqP25TnyJ
         POZcdA0b+pJReuyGD8NAfZkIvloS9rkxxhGEC6gaI5Gw6DU57UGWyVkNVDB2sbKD2L
         aLHP725S0xvoDrRA4ly/XVpnlMQQj0aOOIxnKzU4=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/6] MIPS: Loongson64: DTS: Add RTC support to LS7A
Date:   Thu,  6 May 2021 09:04:32 +0800
Message-Id: <20210506010435.1333647-4-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210506010435.1333647-1-git@xen0n.name>
References: <20210506010435.1333647-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The LS7A RTC module is now supported, enable it.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f99a7a11fded..39808e97e6e1 100644
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

