Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D8910A303
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 18:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfKZRI3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 12:08:29 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25805 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbfKZRI3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 12:08:29 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574788024; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=jptWWbh0pXigtHC8trHJFtqz5+KRVM1Eh5Lu9i2KPvhC9w3svUO+k5NQ58/mEpk7G7cm+L3PjScqvIh5Bfn1WhTQGBpYh7qSpUyMEaoB7gC6rCs3zheckcEN6lhl/mKwAh0/egN/ZM5LvijQDGNZEw2s5K97a3D/CLTsOO05GIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574788024; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=fCu7mhMHSN5oFkRm647heujwgRCsMayXSIV1DvJcJvU=; 
        b=IR2g8MbAipXtb3AzxLHaM9+wO5YJCm/EgcRBjUbyZlWHjz2+tlXvch024nzwN61SDTRli92zy054Nvp9M2lh+eKn5x1qUk1oTUMzpkgZBz5XsAC/nueCjXv613Oecuy90hXzdaO3fzP3ay+Y1EJzbC+o2NUJmvWrVUU48dxMxL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=R7trRMaCPi3m4fR0fGw/p08z+uTHf5KQ4+KyZbfxZz1D1tdiMaeqSSAY0baQwLFIsYLbFWbQX0+s
    kJ/YYsm+8/di6SdQ67DMfV0fa/xyCDMWhtmCykRvMUap6ICN8b/7  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574788024;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=fCu7mhMHSN5oFkRm647heujwgRCsMayXSIV1DvJcJvU=;
        b=qNSK7DTbKtQc9jGF/WK7y1BsGYIksqAO6Hp/6ARHvroZRRjPQJbrPBmIk5EckFU4
        8YG6YKjxlc4Sqyr6xqHagbdMZ/Paz8VqAABm8InmO3RSUjbr2c1Ld3DNmriTwiEI8FG
        f0xGKT8jaSI4px/ZiyeS0yR0tnsmhWajAJXB2zfU=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.214 [171.221.112.214]) by mx.zohomail.com
        with SMTPS id 1574788023056554.3651273736727; Tue, 26 Nov 2019 09:07:03 -0800 (PST)
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
Subject: [PATCH v4 2/6] dt-bindings: Document yna vendor-prefix.
Date:   Wed, 27 Nov 2019 01:06:10 +0800
Message-Id: <1574787974-58040-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
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


