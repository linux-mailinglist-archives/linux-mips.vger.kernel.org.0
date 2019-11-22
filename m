Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E87CF1072DA
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 14:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfKVNNh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 08:13:37 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25836 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKVNNh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 08:13:37 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574428347; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=c6dQnarC1l68BcnbTaPWpnwENf5gi1e9xMFZf7c2C9b+HgBECzS7z7x/pB8FI1MuubX2etfRd8NAGHyyFhnOnVXmn85yv67sR8rscrvMPVuwMxPejeoWZea5GB2ESmnj/R0PpeKcLEKfiEQwoovcX2jv5z/aD51UZikuaChK+Vg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574428347; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=3YRJ9svjNvi4cz/qcwCFYmNEksmJq5/rX73zGgHkdTs=; 
        b=J+qLD9MsckPI2CeAZFS4FjP36x/mCgCmj6VgBa6awKoHpkopJYTQ7GDeWurFBg20BPMjMRXU8hOHFHZ6mNybM25MJ2w0iK5dVaix1AxCvKv4GyVsPeVYfz4GYNx58OHs1WEF/qixhe2UJVMHUN1+uSCARJQ4QHX/XeWNbjK/rRU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=rZ3ILYcV91z0jjH0oFg0sojzH68jS9Gd/RVa88b+NfU+vTktFnAK8JcFWGZgjXKlE3vZk5Aoc/7+
    Z+4zq7xbNgX75m4Ssts55iYydF3bkqGhWJS0J8b/WP4FMpv5OXYM  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574428347;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=3YRJ9svjNvi4cz/qcwCFYmNEksmJq5/rX73zGgHkdTs=;
        b=mHfOpWIzMcSCEidLY995O5qPfV7/gykLyoeFpO9EVSJnf8ImEoPLmlkizh/cCsLp
        S06WcPfYu700LZl5koyJttt/3SYKjMWhajmBkP7aPx1t+mGPO595L8D2cackUtkKTJp
        gA36XkVs92wEoY/KC7OMtLwJR+h62i0VI7Itut+I=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.83.158 [171.221.83.158]) by mx.zohomail.com
        with SMTPS id 1574428344831574.7955276837662; Fri, 22 Nov 2019 05:12:24 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com
Subject: [PATCH 2/4] dt-bindings: Document yna vendor-prefix.
Date:   Fri, 22 Nov 2019 21:11:27 +0800
Message-Id: <1574428289-21764-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
References: <1574428289-21764-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The "yna" is an acronym of the "YSH & ATIL".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..3eebb90 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1031,6 +1031,8 @@ patternProperties:
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


