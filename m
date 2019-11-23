Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9233107C7D
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 03:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfKWCgP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 21:36:15 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25820 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfKWCgP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 21:36:15 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574476545; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=CWmVfKG9WuPWVYUKyct77Kp8ejdr87KxAXVZ3V4PhECUiaNBVU9DRVlWQekuD6OnjcZlQLmQRVXcL49ZTsEyPYunV2/cZyPSjh3a/YIYVfvZHlyqh86j2HqNjLm8qM6uSXJBk7vUCkrrp/bubqnNVqttZ4eQ62BvS4Fx/Slgez0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574476545; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=cEcuT57V44R79/6/6oRRkIMx9IgA5bof3LYs0xhaXm4=; 
        b=XsS5JyLtRkwA2N7Fe57P301+i8OE1K8GpmK06ta9Ep9gPr/r7tlGQkg1KESwwdc7MKd7YHk85bv/QRyqbacOaigWIzG+6MiYPQX4DEwp0iv3Xbhyilqcaw4oEjf1kv/Vz5FISX4K31QQZ4ptS9uNH6sMhlr2jGg3yaaEc/CnncQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=itIHz733L5QYpcajfFIc9jjsk2t8F0IG2ie15ukQfwx+jctiq2Og3QIbW3h5Fmz0sfa/nXWVKT7a
    N+oBuRwwWFZKjPFPSnDrI57d0yjbYFYVpAEu7MQ1zpj4Bc4K6Dgg  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574476545;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=cEcuT57V44R79/6/6oRRkIMx9IgA5bof3LYs0xhaXm4=;
        b=IhSbaOjjl+qewTkIO73Wn82qREhsBgn5rZ3fF2alsgnj4lFU42u4jt72L0t8OUvU
        JYnzp+4vLwXS9ISLSOWII5+CTs37qnj4PFgSGDGatllhL4FlYexYvPCZML6Wi3irISN
        wAAgQyf8PwZgPT8DO8FMBrH0IWhDyO226r+Dke3E=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.48.217 [182.148.48.217]) by mx.zohomail.com
        with SMTPS id 1574476543106846.453950024027; Fri, 22 Nov 2019 18:35:43 -0800 (PST)
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
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v2 2/4] dt-bindings: Document yna vendor-prefix.
Date:   Sat, 23 Nov 2019 10:32:22 +0800
Message-Id: <1574476344-62631-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
References: <1574476344-62631-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The "yna" is an acronym of the "YSH & ATIL".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v1->v2:
    No change.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c..47ddd88 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1054,6 +1054,8 @@ patternProperties:
     description: Xilinx
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
+  "^yna,.*":
+    description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
   "^ysoft,.*":
-- 
2.7.4


