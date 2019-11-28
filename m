Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD28F10C6E0
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfK1Kjo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:39:44 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25806 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1Kjo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:39:44 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937505; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=eeWiQ+nlSjM7ZTYtYiOKIxWTOV9IRzhyAMk0VYZadSchdUXNRpGZCinl/2Ej/AEd+JllmGUMdRF4MQO9076aAOlUK+UF35tWrcIAnEZ+omWJhgJzWW9qph0U/4UixLV5ci0gZfMO4Ktb3rY1OvX8hqPPXoRFLOJSmNMpDb+mMMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937505; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=wHadPwzU6MOwL0ExrnPrvdv4uNIHJhuJKKav/nnKfGc=; 
        b=VjoZH0xuV/9D7mr9nNCGGEfhb0SVH2mJ2Q7dHL9Se/Y1FLZRhwuu0UVlqrwuqLaDkBY1GUQrVpTX85T0SDO+ajtrzkBCq37KBI4eDL7TLRtcNBWjSOssHhOLrn+Tb1Deipjgz6qiRmaAqQO2Uulbic1ANZ8Dqm5grRHomn5YTPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=u+nYTh997cMJS/hyo9nYVqE0iVvJQDKEkeQ9Evx4G/oux7aOGK+HmLvnvPHVh09NB2EQEmHpCemx
    vqGwnEY9WLboc+cQXWJs2vNY8FmcnujK28ClM1r7ojtHos14ulzY  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937505;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=wHadPwzU6MOwL0ExrnPrvdv4uNIHJhuJKKav/nnKfGc=;
        b=Aehn8oSh8SJKfS71nbO/+D46EbiikNl0M39aS3Lgo2FERbNZnYoO6p11IaYRQGmc
        6RnVZY89HayDg6N06A9J2qMiceCiqlKlmxGNegvaXOYy55+8zDkT6gNXm8N9m0JHH62
        uWB2TywWnYX3BVXMmDVktI4GAb5wyFSwBzNl6O1U=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 157493750328834.5981333089743; Thu, 28 Nov 2019 02:38:23 -0800 (PST)
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
Subject: [PATCH v5 02/10] dt-bindings: Document yna vendor-prefix.
Date:   Thu, 28 Nov 2019 18:37:39 +0800
Message-Id: <1574937467-101907-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
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


