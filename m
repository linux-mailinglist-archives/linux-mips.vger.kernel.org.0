Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 942EF10C6FB
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfK1KoE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:44:04 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25819 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1KoE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:44:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937559; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=cvQ2hXzkNx1uUy8kItO8KbISQxEM0JST5yJxd5SEWPgB7q7+bARBxK8Kv8pTwUJe7k0Q/x0CXjMsXvqUCFWpzYEtWzy+UIPmTWld5ZmLMgDXTgql7rt6uaA808KwP4fITmLg+17UKfHovnlyPnk0f/n+XEdEr4rYma7bAlt8xoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937559; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=zGBk9XJSE65WAeQxNpQCguwwDuMiG9Wp4ppd6wZRVUM=; 
        b=LnbTcEXKwiUGcA56eM4HanOvufs7Bhfuchmr0e7LOGpiNU1IQM69ziNOXCq0inSDApwklBtHfeVnXxm+sMFimAvy8iSh3YylTuI+xIh57ZQaId8eCKvmBEsrqQcnfQm+AaU7E472R37JlzJEqG1ueerMjbl+wJF82cri7ILLeaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=u0d84m0+WsJMDZerFrdCUbiDP19PV+VgltC3vU/qCCZ5D6msQ4nLYfuPmC9rS1BfxiomS4tXVhTS
    OwhwmHJ9OfNofSr62cRP40CAQ7a5Dlk3n/lHbddHB6BgP9kP9vxZ  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937559;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=zGBk9XJSE65WAeQxNpQCguwwDuMiG9Wp4ppd6wZRVUM=;
        b=irNlRr+vlnFF3mGdL5yanRM0CZCGI3rLTIK+YDM0qf/MPoD9VbLhpR+/L56m/BXK
        I96YFZp6jC+wzwGJETV1geOxLJrYQHopz0mzG171ydWVTwIiL2DmMYUT+yahDeF4/fT
        mhyyXaPxVBO7QY1XnXiQ7RjHGDJo9nrCbkme3omU=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937558928358.2898781012931; Thu, 28 Nov 2019 02:39:18 -0800 (PST)
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
Subject: [PATCH v5 09/10] MIPS: X1000: Add rtc DT node.
Date:   Thu, 28 Nov 2019 18:37:46 +0800
Message-Id: <1574937467-101907-10-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the appropriate DT node to probe the rtc driver
using the devicetree.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v5:
    New patch.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 8b8d335..2a0810b 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -69,6 +69,17 @@
 		interrupts = <27 26 25>;
 	};
 
+	rtc: rtc@10003000 {
+		compatible = "ingenic,x1000-rtc", "ingenic,jz4780-rtc";
+		reg = <0x10003000 0x4c>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <32>;
+
+		clocks = <&cgu X1000_CLK_RTCLK>;
+		clock-names = "rtc";
+	};
+
 	pinctrl: pin-controller@10010000 {
 		compatible = "ingenic,x1000-pinctrl";
 		reg = <0x10010000 0x800>;
-- 
2.7.4


