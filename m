Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85E6A2E83
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfH3EeL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:34:11 -0400
Received: from forward103j.mail.yandex.net ([5.45.198.246]:40468 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727900AbfH3EeK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:34:10 -0400
Received: from mxback29g.mail.yandex.net (mxback29g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:329])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id EA523674076C;
        Fri, 30 Aug 2019 07:34:07 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback29g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id bnaFSH0bwA-Y7IeprpS;
        Fri, 30 Aug 2019 07:34:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139647;
        bh=KqSC2kgjOwolQ3VxE+oPXlHyAIFfqyGw3F6AmU6BiBw=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=wEdYiSXzJhIH3vCjHDy5Dy99lpbq9w5Lbo582Xub18rZu6iMMJNaHEEIKr29GYzgE
         8k65AUmca+4zJvg+AoxqUexMnUNv0JskcFRyHIDielrGexEs/bswYwMsHKS9ly9dg+
         C2a0Tze/Vy5Paewexx8MZTn06Nn+TDO5tGi6D5o4=
Authentication-Results: mxback29g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-XxDG0HVq;
        Fri, 30 Aug 2019 07:34:05 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 13/18] dt-bindings: Document loongson vendor-prefix
Date:   Fri, 30 Aug 2019 12:32:27 +0800
Message-Id: <20190830043232.20191-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson is a MIPS-compatible processor vendor.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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

