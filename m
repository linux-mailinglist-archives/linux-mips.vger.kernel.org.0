Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB6F24231A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgHLAPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:15:50 -0400
Received: from crapouillou.net ([89.234.176.41]:52116 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgHLAPu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191322; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TBJe4O2M/Bbm5bjKqrnbx2BYaBZ10Szr3hxvh+t6njs=;
        b=NU/goe7ePwRJozFH4jO7+eFRrwTUmlQa36jGnk6XzeelT3vOEta76RJHuMHX1+U/zvlSOV
        vw/vARQRkJ9XBrfJT+1HLMvmfREQvmis8KXsbWM224raudrmEPFQW5/f+iMW3MBUF8qLIs
        MeEl70BTZJRHVyuLKi2weCSpa0aFPis=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 04/13] MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
Date:   Wed, 12 Aug 2020 02:15:01 +0200
Message-Id: <20200812001510.460382-5-paul@crapouillou.net>
In-Reply-To: <20200812001510.460382-1-paul@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MIPS_GENERIC symbol now won't select any other configuration option.
The MIPS_GENERIC_KERNEL will select all the options that the previous
MIPS_GENERIC option did select, and will select MIPS_GENERIC as well.

The whole point of this, is that it now becomes possible to compile a
kernel for a SoC supported by the arch/mips/generic/ code, without
making that kernel generic itself.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 arch/mips/Kconfig         | 8 ++++++--
 arch/mips/generic/Kconfig | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 880680c0df31..8d146794de1e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -94,14 +94,18 @@ config MIPS
 config MIPS_FIXUP_BIGPHYS_ADDR
 	bool
 
+config MIPS_GENERIC
+	bool
+
 menu "Machine selection"
 
 choice
 	prompt "System type"
-	default MIPS_GENERIC
+	default MIPS_GENERIC_KERNEL
 
-config MIPS_GENERIC
+config MIPS_GENERIC_KERNEL
 	bool "Generic board-agnostic MIPS kernel"
+	select MIPS_GENERIC
 	select BOOT_RAW
 	select BUILTIN_DTB
 	select CEVT_R4K
diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index fd6019802657..5216c850b7e2 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-if MIPS_GENERIC
+if MIPS_GENERIC_KERNEL
 
 config LEGACY_BOARDS
 	bool
-- 
2.28.0

