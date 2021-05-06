Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72330374CA1
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 03:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhEFBFp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 21:05:45 -0400
Received: from [115.28.160.31] ([115.28.160.31]:51064 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230102AbhEFBFp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 21:05:45 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0A9BD63570;
        Thu,  6 May 2021 09:04:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620263085; bh=KyFmzNY9iME7gAnoVZLtCu1aHJKWM5wIRQgf7jjbe/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=toByllR8FbZE23iby3g19Vy7ZJ4MjpDhEKqCCJzUL2MR0Jf3jhmfFG+fbKj3W61dZ
         1syURJc48Pl9wXwC7RQ3+XOZgwBcHNmp9jV5xqyb3ipo/sMbUa1TYKIALtj5iY1AoZ
         gy7LC1o7mjuKGsB+MsQ5STWSx7VSFfuaDp3rqvAw=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: rtc: Add bindings for LS2X RTC
Date:   Thu,  6 May 2021 09:04:31 +0800
Message-Id: <20210506010435.1333647-3-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210506010435.1333647-1-git@xen0n.name>
References: <20210506010435.1333647-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document the binding for the LS2X RTC block found on the Loongson-2K SoC
and the LS7A bridge, originally appearing on the Loongson-2H.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7548d8714871..568aa89989fe 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -42,6 +42,8 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
+      # Loongson LS2X RTC
+      - loongson,ls2x-rtc
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3028
       # Real Time Clock Module with I2C-Bus
-- 
2.30.1

