Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8E82752E8
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 10:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgIWIGx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 04:06:53 -0400
Received: from [115.28.160.31] ([115.28.160.31]:55528 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgIWIGx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 23 Sep 2020 04:06:53 -0400
Received: from ld50.lan (unknown [101.224.80.228])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 86967607BF;
        Wed, 23 Sep 2020 16:00:04 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1600848004; bh=Af9IUpSBMFBAscGUPBLDx5VDIMdmv1td8aG4IVedo3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v/B7XnvPH9WpdRQ/AWtpFsqx8pZMpH8XhKBgdTNer9SJ/AdRxssNaC12SxNTHcyDS
         cPQJZg/eu4wyyStC0whLeKgGUm6Z+Av6/+nq6CKAnG3mNoUM9KSOGTyhjBX3CGJV/8
         WpF6qv9i8oaHSS+irXNr/QdLAmXpcdJdl3ttCisw=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/4] MIPS: Loongson64: DTS: Add RTC support to LS7A
Date:   Wed, 23 Sep 2020 15:58:44 +0800
Message-Id: <20200923075845.360974-4-git@xen0n.name>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923075845.360974-1-git@xen0n.name>
References: <20200923075845.360974-1-git@xen0n.name>
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
2.28.0

