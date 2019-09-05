Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D61BA9C18
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 09:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732185AbfIEHkX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 03:40:23 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25501 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731361AbfIEHkX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 03:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567669130; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=dhcLkStAdsTM1o4nHBlvqvbUNxZuGcQyUBirvZm4qmhgSWCaIq6TwuZb4N+RhEWsruQPJkpV5lr31JLTRGKe2NgRy0pHCmx/JXCyPqWeE/lUm4CRkf/GPP8Qs66u2BMOHt96ibGtLwkRTE8XtUlNRZDa2/WLPGjO7GWJojycFHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567669130; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=Heqr9SZkadaVS8gLSB7N1qy++ZERfguRdtxZqkfJX0A=; 
        b=TeeCahrW1FxZNnGtRY/HJ++aIRXxwzEaA1R6vuHtSYigzOWIDtpG64Embd1UxvnfnfTyUfIcb+c80fWktW4vyhoTg4rNwu0yKqnZeYaLpG+8yXzlpQAUjxcKDHUo/0WV37Uc3NkuX2cVom7V3t0mVvdXAeEHeRVsG0hlHN7/hxE=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=i2voXQ3nizZYL+xtYxnA9lL4pNt7arpQADgXeZk8KBRkG+XHjmm9js3xtqrcz9NsYWfkTb1On1BX
    +ZD+G5tdImbqQ7t6fAjhQWT+bCNoN/ILCimAZhrf8DBgaeyo2Cb8  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567669130;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=873;
        bh=Heqr9SZkadaVS8gLSB7N1qy++ZERfguRdtxZqkfJX0A=;
        b=Nb9f65AlyTRCbjP1L15gZrRZ5ns0cq40NUB1ZR2y62PwUa/zeX+S4Y/or0AAaIgI
        P7a52uJKv5F9IOlwKTxxHZPwzPBfvjk/P66XpOw8BiPV8RBYfcE12wxdfcS/qxm0SbN
        +y7S6t7ZB5SWP/2jeqNNVBsaNNnEt/bvrg9MPBTE=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1567669129342200.53823429847387; Thu, 5 Sep 2019 00:38:49 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH 3/4] dt-bindings: MMC: Add JZ4760 bindings.
Date:   Thu,  5 Sep 2019 15:38:08 +0800
Message-Id: <1567669089-88693-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the MMC bindings for the JZ4760 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/mmc/jz4740.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/jz4740.txt b/Documentation/devicetree/bindings/mmc/jz4740.txt
index 8a6f87f..13796fe 100644
--- a/Documentation/devicetree/bindings/mmc/jz4740.txt
+++ b/Documentation/devicetree/bindings/mmc/jz4740.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible: Should be one of the following:
   - "ingenic,jz4740-mmc" for the JZ4740
   - "ingenic,jz4725b-mmc" for the JZ4725B
+  - "ingenic,jz4760-mmc" for the JZ4760
   - "ingenic,jz4780-mmc" for the JZ4780
 - reg: Should contain the MMC controller registers location and length.
 - interrupts: Should contain the interrupt specifier of the MMC controller.
-- 
2.7.4


