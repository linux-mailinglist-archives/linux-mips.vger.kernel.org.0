Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D021A10D2A5
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfK2IvE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:51:04 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25831 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbfK2IvE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Nov 2019 03:51:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575017408; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=evDvCnoAa4bc6wobct7S9lmYOFVkw5EtvHA6lfHIjX/kvkB3U0i2kvh6h85CbIJBWB1N2mNiAy1g8UQ5cSB/c3n0hDNNDtsqWrX9s/jJKi7/0RjSTgYqZzeRo+C9x1+WbQ1OHDMdyiHyy4NWzrAXoETfsPOBZcdUv163kVYRomE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1575017408; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=57iUclPlc7SKtkm64YOFwaTJlwVeSL46JJsM1xWPauE=; 
        b=CcGHtvVH5hOHVS4+uENCaQWaGi6HVL1c+uSSM9DVDTzE7vA2ttQNB0IWdPj6VZmbQ06M/Cahsk/sG3Kv9McGD11i9k09SUzlrD4ZMR2+5+Dfo7Ub9JJ6D9VlumGHBuQg+uFc9bhMEPx7B6UItb3WjUd/f16JUxyIjP7JYwvyby8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=TNQUghc2JyNFyR/qWW1Nbi/rothz81E9UhavIdutKH4FKK5dwc7Jda57twMEd5OafKHWkW0XbVA4
    3xri/k2Ax1u0F2kZZzVtEPS1u1PjG4ma6J9eREE4TMyE162Llsvm  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575017408;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=57iUclPlc7SKtkm64YOFwaTJlwVeSL46JJsM1xWPauE=;
        b=m8PFldD9AUS4/nK6KGO6PK5pbgSKCsViWSzobFlgwaR6oIwSRopbDgFAy0gIlcH7
        C86xvGiFVcEtAXRhTN7eJ5MYL/YRwj3PZZDu1DX9t5jGrVJZOmaFO5YjqzCMH56FHCv
        wz17j1aQ8ZCLzcTYMe25M7f1GX52byKrMSZ+Bx30=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.146.46 [139.207.146.46]) by mx.zohomail.com
        with SMTPS id 1575017406601866.7397569456067; Fri, 29 Nov 2019 00:50:06 -0800 (PST)
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
Subject: [PATCH v6 02/12] dt-bindings: Document yna vendor-prefix.
Date:   Fri, 29 Nov 2019 16:48:43 +0800
Message-Id: <1575017333-29020-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
References: <1575017333-29020-1-git-send-email-zhouyanjie@zoho.com>
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
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
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


