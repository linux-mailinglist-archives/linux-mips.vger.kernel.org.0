Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5B6138575
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732425AbgALIUr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:20:47 -0500
Received: from forward100j.mail.yandex.net ([5.45.198.240]:58038 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732369AbgALIUq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:20:46 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id C778150E0222;
        Sun, 12 Jan 2020 11:14:39 +0300 (MSK)
Received: from mxback5q.mail.yandex.net (mxback5q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:b716:ad89])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id BE52261E0005;
        Sun, 12 Jan 2020 11:14:39 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback5q.mail.yandex.net (mxback/Yandex) with ESMTP id tR0KhGblhy-EdcCaSf8;
        Sun, 12 Jan 2020 11:14:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816879;
        bh=pebq8GHSI7IfOohalTm91NbPof6IcZx9lXx9DQZnkKc=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=m07jpV3wts2wecQalw6r5Ip2J7np1IuKGiaBK1ZcjWyWeTvo3N/DbIKEmF5tsVKJK
         qCz6p8iinWuqHlPWc81UgUYB58UeTRNgg8be+Dz9M2Cji6iAJet46ImkwfLRW/Ld20
         yam8DCuMa1g6DHBOljBteanDPS/EuQlgXJ9EkMhA=
Authentication-Results: mxback5q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-EWV4Iv0P;
        Sun, 12 Jan 2020 11:14:38 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/10] dt-bindings: Document loongson vendor-prefix
Date:   Sun, 12 Jan 2020 16:14:07 +0800
Message-Id: <20200112081416.722218-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson is a MIPS-compatible processor vendor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 50c2b635ecfd..31b364107e60 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -545,6 +545,8 @@ patternProperties:
     description: Logic PD, Inc.
   "^longcheer,.*":
     description: Longcheer Technology (Shanghai) Co., Ltd.
+  "^loongson,.*":
+    description: Loongson Technology Corporation Limited
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
   "^lwn,.*":
-- 
2.24.1

