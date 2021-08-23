Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BD53F4E82
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 18:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhHWQjt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 12:39:49 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50524 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229454AbhHWQjs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 12:39:48 -0400
Received: from ld50.lan (unknown [101.88.30.186])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 05C4160117;
        Tue, 24 Aug 2021 00:31:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1629736310; bh=x9STX1vhrJZqW92RYjIG3Cv6d/K5dCeqO4cHgVrF4kw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rHbRd+o+ZCBbthfKm8x8e0E4cN9cnbFsJJot8IVHM6F7bqaCjpDBJFIHcj5UNkQ/o
         wu206LoZr0qIE3zJTyn68xDo15TrFTLa9VtgVCGtVW2G6HdU5EvTlWr0MLD0+h/moD
         Pt53ZfK+7kMVfgBUA95lnK8IBCy8h/9cz9qEmTxs=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH RESEND v5 2/6] dt-bindings: rtc: Add bindings for LS2X RTC
Date:   Tue, 24 Aug 2021 00:31:38 +0800
Message-Id: <20210823163142.586529-3-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210823163142.586529-1-git@xen0n.name>
References: <20210823163142.586529-1-git@xen0n.name>
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 13925bb78ec7..64f7e81e7043 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -45,6 +45,8 @@ properties:
       - isil,isl1218
       # Intersil ISL12022 Real-time Clock
       - isil,isl12022
+      # Loongson LS2X RTC
+      - loongson,ls2x-rtc
       # Real Time Clock Module with I2C-Bus
       - microcrystal,rv3028
       # Real Time Clock Module with I2C-Bus
-- 
2.33.0

