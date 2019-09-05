Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880D0AA654
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389933AbfIEOrF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:47:05 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:34047 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389424AbfIEOrF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:47:05 -0400
Received: from mxback3o.mail.yandex.net (mxback3o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1d])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 3910E50603A2;
        Thu,  5 Sep 2019 17:47:01 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback3o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id TjX5gnjYE0-l0Li6rmm;
        Thu, 05 Sep 2019 17:47:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694821;
        bh=sfUEVqtYlQudHOslvo8yyOWDSfeG3nCpErW4OlCkTkk=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=wKMnqvZWZCOlbgTENcRpeqVdOeVWBrBV69DnAeOvie33r6mwPwBWUpyjP1z1UJWbN
         yg8duKERs2g3O792VmRddHTIxkygcLHx6ENnTJaWt1MTjbBXf7pZ4TyEwKwvU+0Pyj
         Hg80K8RRp62OolPRiRqc6FG1WAnrE0WzOMOBpjck=
Authentication-Results: mxback3o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-kmxWw6rt;
        Thu, 05 Sep 2019 17:46:59 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 13/19] dt-bindings: Document loongson vendor-prefix
Date:   Thu,  5 Sep 2019 22:43:10 +0800
Message-Id: <20190905144316.12527-14-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
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
index 6992bbbbffab..855d5b7a6660 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -529,6 +529,8 @@ patternProperties:
     description: Linear Technology Corporation
   "^logicpd,.*":
     description: Logic PD, Inc.
+  "^loongson,.*":
+    description: Loongson Technology Corporation Limited
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
   "^lwn,.*":
-- 
2.22.0

