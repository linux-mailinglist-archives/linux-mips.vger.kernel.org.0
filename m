Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094F43743B5
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235381AbhEEQvd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 12:51:33 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46576 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236098AbhEEQrp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 12:47:45 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2E50063570;
        Thu,  6 May 2021 00:39:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232782; bh=KyFmzNY9iME7gAnoVZLtCu1aHJKWM5wIRQgf7jjbe/k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Efqv1MbsVXO+1vqRjDtYNX25rJ8YLkP2T/AcvMbPCSoOgER5194M45eXfpIL7jGaL
         jPubZl0WdKBO8m+qE47RjgZemqc5ZBya/pNNM/ChMAexlmmVs0Nep73vqBCI8BbIya
         YwmEPFVaTiVXCeg4RLnbhClpTK0GHpmV0MN8VGyE=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: rtc: Add bindings for LS2X RTC
Date:   Thu,  6 May 2021 00:39:01 +0800
Message-Id: <20210505163905.1199923-3-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210505163905.1199923-1-git@xen0n.name>
References: <20210505163905.1199923-1-git@xen0n.name>
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

