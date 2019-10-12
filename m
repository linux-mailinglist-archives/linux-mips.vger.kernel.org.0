Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D54D6D4D31
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfJLFQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:16:53 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25441 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLFQw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:16:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857304; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=og8Z0iLjQrQ1a+eGc5mQaLkXaL2dqJXyVn9kML8R3Cl8G4DitK7Hf7cQl7ELKewo34ZeEjne81HOD0nizck0aAUUcZpW6ZP0Vfo5wjjtlmtoERoNv0sdNtPVgd/0WRQWv0b0uyquhaR2cUjuKmU/9GEm34pDqXjTd7eXCJQ1Wm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857304; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=KFYQcdgcXC9B1WkAHZsdC5Ju3diJLqLVfUVt06xuMHc=; 
        b=SaPMV99ITpnz2RP7lQvtryzh21Zg8Rap8dftnDWhuccZOld7xLbp/H33O6cKw8478Lna79c86MnMshuhUFPqKvRO/V/WvDMJflwstUBiWfu1/rMfyaaBUR4GulRNhP9ZjGyYXkAUI7lo4kBU7y9TY1EhhRt7uqkwtz+00myi59c=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=PNsfRz1mE7646HixXca2ESvv3TZgG57oL1CYoL73nu7uE2OYwxzio+iSlr86loaL3Oo2SVRAlbUJ
    ihaNAk+9CCHBbt/eBT8iK4A2BSaF+Ei1gQw+StR0YNoirkIF+HrN  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857304;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1350; bh=KFYQcdgcXC9B1WkAHZsdC5Ju3diJLqLVfUVt06xuMHc=;
        b=MQ6vTdZble2Ojbfbk3WdIOVdQ06su536BqOW8FBYsSfmaIUftWy5bt47U8J4OOYs
        RKV8emrqCt+aQJ0rSX4cDBhVBgyUyLrOA5Y29m9x9M1gkEOmBPcGpWn3yp/GMESrecQ
        XuUM+OnaEk0WBMLXEBqDCpgGoHIEYA2VBxUvNc7g=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857303707410.1200901788326; Fri, 11 Oct 2019 22:15:03 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: [PATCH 4/6 v2] dt-bindings: MMC: Add X1000 bindings.
Date:   Sat, 12 Oct 2019 13:13:18 +0800
Message-Id: <1570857203-49192-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the MMC bindings for the X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/mmc/jz4740.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/jz4740.txt b/Documentation/devicetree/bindings/mmc/jz4740.txt
index 13796fe..453d3b9 100644
--- a/Documentation/devicetree/bindings/mmc/jz4740.txt
+++ b/Documentation/devicetree/bindings/mmc/jz4740.txt
@@ -1,8 +1,8 @@
-* Ingenic JZ47xx MMC controllers
+* Ingenic XBurst MMC controllers
 
 This file documents the device tree properties used for the MMC controller in
-Ingenic JZ4740/JZ4780 SoCs. These are in addition to the core MMC properties
-described in mmc.txt.
+Ingenic JZ4740/JZ4760/JZ4780/X1000 SoCs. These are in addition to the core MMC
+properties described in mmc.txt.
 
 Required properties:
 - compatible: Should be one of the following:
@@ -10,6 +10,7 @@ Required properties:
   - "ingenic,jz4725b-mmc" for the JZ4725B
   - "ingenic,jz4760-mmc" for the JZ4760
   - "ingenic,jz4780-mmc" for the JZ4780
+  - "ingenic,x1000-mmc" for the X1000
 - reg: Should contain the MMC controller registers location and length.
 - interrupts: Should contain the interrupt specifier of the MMC controller.
 - clocks: Clock for the MMC controller.
-- 
2.7.4


