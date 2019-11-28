Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDAC10C6F5
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfK1KnJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:43:09 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25888 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1KnJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:43:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937545; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=MzCPwZq6gSOZN/FbTKXqQEGdvX0/NJ+dd5jXRJiBEsQWmDn4Y5p+DyGFoPoHc3X/xoIX/q/gq92uyLEY+HFrclp7WnGfMwOs0M9zhgL5U2cqORu7tLyd/25vhR2r+fQ41CVnUv8OIyV0/3fjLcOtRVqiw0vxG+2SM5AxOyCcGGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937545; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=PuoTjSzI3oNt1S7DZP6JaxcVA17s93onx3wsa54Pm0c=; 
        b=nksQVw/GoOAxuzUPZbqd1xbMAT9YeJJvOUeV1FVVKYtTagvT0F5im7JTZKsQEktewKX2G7gyofdzD82+LYDpbqv2LgzgJnxwXYOV+pjAAFqwrYizDIs8t26thihTHxQMeJY00IZArpz53uZZ/NVlC6mNJz2v1XZassVISJ4U/4Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=uhhK2hDQqZhQ9yfD5rRXp9b1+S2hIRE2vL2hBoaXD07GI0V0chy5dDokXM2XSiSvDsPmdr+k8Kuv
    nUVQjl9ub3chfFHPZ6tcidPnzDkWWEWRe4c+Mc+uDxTOAAW/uiBy  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937545;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=PuoTjSzI3oNt1S7DZP6JaxcVA17s93onx3wsa54Pm0c=;
        b=faxm4Ebr2eqa0D/P0jL20ySySQ72Io4dEeYrkcmjSOTJfc3d1e/JVZb1vehbFG9B
        tRDeZ1C81hR17jjA3s0LxcSwSTenOjnyeVWqmx5kJDiWRKkNBBwCAC4U0rKO4KfoN5a
        FnXd04LeZvNiA+E/1d+6uBIC6kXRbTWM+eHvWWWw=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937542992738.5858742788587; Thu, 28 Nov 2019 02:39:02 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v5 07/10] MIPS: X1000: Add msc controller DT node.
Date:   Thu, 28 Nov 2019 18:37:44 +0800
Message-Id: <1574937467-101907-8-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the appropriate DT node to probe the msc controller driver
using the devicetree.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v5:
    New patch.

 arch/mips/boot/dts/ingenic/cu1000-neo.dts | 16 ++++++++++++
 arch/mips/boot/dts/ingenic/x1000.dtsi     | 42 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/cu1000-neo.dts b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
index aae60ce..846a2dc 100644
--- a/arch/mips/boot/dts/ingenic/cu1000-neo.dts
+++ b/arch/mips/boot/dts/ingenic/cu1000-neo.dts
@@ -43,10 +43,26 @@
 	pinctrl-0 = <&pins_uart2>;
 };
 
+&msc0 {
+	status = "okay";
+
+	bus-width = <8>;
+	max-frequency = <50000000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_msc0>;
+};
+
 &pinctrl {
 	pins_uart2: uart2 {
 		function = "uart2";
 		groups = "uart2-data-d";
 		bias-disable;
 	};
+
+	pins_msc0: msc0 {
+		function = "mmc0";
+		groups = "mmc0-1bit", "mmc0-4bit", "mmc0-8bit";
+		bias-disable;
+	};
 };
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index c432828..8b8d335 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -186,4 +186,46 @@
 
 		clocks = <&cgu X1000_CLK_PDMA>;
 	};
+
+	msc0: msc@13450000 {
+		compatible = "ingenic,x1000-mmc";
+		reg = <0x13450000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <37>;
+
+		clocks = <&cgu X1000_CLK_MSC0>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1000_DMA_MSC0_RX 0xffffffff>,
+			   <&pdma X1000_DMA_MSC0_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
+
+	msc1: msc@13460000 {
+		compatible = "ingenic,x1000-mmc";
+		reg = <0x13460000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <36>;
+
+		clocks = <&cgu X1000_CLK_MSC1>;
+		clock-names = "mmc";
+
+		cap-sd-highspeed;
+		cap-mmc-highspeed;
+		cap-sdio-irq;
+
+		dmas = <&pdma X1000_DMA_MSC1_RX 0xffffffff>,
+			   <&pdma X1000_DMA_MSC1_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+
+		status = "disabled";
+	};
 };
-- 
2.7.4


