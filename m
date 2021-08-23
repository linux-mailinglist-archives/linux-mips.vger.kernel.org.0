Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF863F4E7E
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhHWQjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:47 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50508 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229962AbhHWQjq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:46 -0400
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Aug 2021 12:39:45 EDT
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ED36160124;
        Tue, 24 Aug 2021 00:31:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736311; bh=n/bXyaMwH2pU8NoCSXDTclq26ik/VpjG92P83AgT0Xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Id9CuyR6GjcFppv5eONuPeslFYpuNXrAkZYVqnxM0ly+5MjlBl6LLIPqM4OtdrBld
         rlvG/meXtv0J9piIAt6XZyxurvSPIaaIB+t6o94CEZXu9P25dQmXSY2GDAUZcttaE5
         /NaoHZrMt7CmYDOsUeLvskACuUFkDZ5xrSPxP4Sc=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 3/6] MIPS: Loongson64: DTS: Add RTC support to LS7A
Date:   Tue, 24 Aug 2021 00:31:39 +0800
Message-Id: <20210823163142.586529-4-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The LS7A RTC module is now supported, enable it.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Qing Zhang <zhangqing@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: zhaoxiao <zhaoxiao@uniontech.com>
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
2.33.0

