Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C065A2E50
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfH3E1V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:27:21 -0400
Received: from forward100p.mail.yandex.net ([77.88.28.100]:52473 "EHLO
        forward100p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725901AbfH3E1V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:27:21 -0400
Received: from mxback17g.mail.yandex.net (mxback17g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:317])
        by forward100p.mail.yandex.net (Yandex) with ESMTP id 3F4D65980269;
        Fri, 30 Aug 2019 07:27:18 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback17g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id bljEyuLEXc-RHY88MgL;
        Fri, 30 Aug 2019 07:27:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139238;
        bh=3ncFV5CIf6z1hcaq7XFDclunuP2nn4MnLCLFu4xo8FA=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Er/vno7wPe4Um+ihec8f4BzfLv1NOxhzQxGCFDFJbUCeNMkRTqFhI6amez8qZypdb
         tol9/m6snwauSqXleSEowGGPD/mKv4+iFuhqf3hDrIwA3pADc5iugFHRDpnWAR9UI+
         4EKFkqgw9K2SjHbNOtPy0zenHLXEsPPMOptPlW/U=
Authentication-Results: mxback17g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 77UXTEcPDw-R8T0EPYX;
        Fri, 30 Aug 2019 07:27:15 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 03/18] MAINTAINERS: Fix entries for new loongson64 path
Date:   Fri, 30 Aug 2019 12:25:53 +0800
Message-Id: <20190830042608.19569-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
References: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As we sepreated the code of loongson2ef/loongson3a, they can
now have their own entries.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 MAINTAINERS | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2c343ee3b2c..d5d4fed632e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10747,17 +10747,16 @@ F:	arch/mips/include/asm/mach-loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/*/*/*loongson1*
 
-MIPS/LOONGSON2 ARCHITECTURE
+MIPS/LOONGSON2E/F ARCHITECTURE
 M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-F:	arch/mips/loongson64/fuloong-2e/
-F:	arch/mips/loongson64/lemote-2f/
-F:	arch/mips/include/asm/mach-loongson64/
+F:	arch/mips/loongson2ef/
+F:	arch/mips/include/asm/mach-loongson2ef/
 F:	drivers/*/*loongson2*
 F:	drivers/*/*/*loongson2*
 
-MIPS/LOONGSON3 ARCHITECTURE
+MIPS/LOONGSON64 ARCHITECTURE
 M:	Huacai Chen <chenhc@lemote.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-- 
2.22.0

