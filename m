Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CAED9F7A
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2019 00:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390292AbfJPVz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 17:55:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733200AbfJPVz0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Oct 2019 17:55:26 -0400
Received: from localhost (unknown [192.55.54.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 690C121A4C;
        Wed, 16 Oct 2019 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571262925;
        bh=yNitP2iKn20kPjUaPAMPUQgBIanvMDCJUVUCUUEFZbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mCNoPUJ1mBrJ9+YdPUtmz9p/KUnoJhQm2tnft5IgzOImhv5qNrqesEppam24S2DTb
         GetzTDRg9oWqjcfv8O+vAqoIT/XnoeJmyfYbuuMDau+44xonIKRaRUChkCNc3D++tR
         l2DwQcji87atWsMEZIp9WjFP7VAw4KWE7sVKDSFo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Subject: [PATCH 4.9 85/92] MIPS: Disable Loongson MMI instructions for kernel build
Date:   Wed, 16 Oct 2019 14:50:58 -0700
Message-Id: <20191016214847.735987212@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016214759.600329427@linuxfoundation.org>
References: <20191016214759.600329427@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Burton <paul.burton@mips.com>

commit 2f2b4fd674cadd8c6b40eb629e140a14db4068fd upstream.

GCC 9.x automatically enables support for Loongson MMI instructions when
using some -march= flags, and then errors out when -msoft-float is
specified with:

  cc1: error: ‘-mloongson-mmi’ must be used with ‘-mhard-float’

The kernel shouldn't be using these MMI instructions anyway, just as it
doesn't use floating point instructions. Explicitly disable them in
order to fix the build with GCC 9.x.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 3702bba5eb4f ("MIPS: Loongson: Add GCC 4.4 support for Loongson2E")
Fixes: 6f7a251a259e ("MIPS: Loongson: Add basic Loongson 2F support")
Fixes: 5188129b8c9f ("MIPS: Loongson-3: Improve -march option and move it to Platform")
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: stable@vger.kernel.org # v2.6.32+
Cc: linux-mips@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/loongson64/Platform |    4 ++++
 arch/mips/vdso/Makefile       |    1 +
 2 files changed, 5 insertions(+)

--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -43,6 +43,10 @@ else
       $(call cc-option,-march=mips64r2,-mips64r2 -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
 endif
 
+# Some -march= flags enable MMI instructions, and GCC complains about that
+# support being enabled alongside -msoft-float. Thus explicitly disable MMI.
+cflags-y += $(call cc-option,-mno-loongson-mmi)
+
 #
 # Loongson Machines' Support
 #
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -8,6 +8,7 @@ ccflags-vdso := \
 	$(filter -mmicromips,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
+	$(filter -mno-loongson-%,$(KBUILD_CFLAGS)) \
 	-D__VDSO__
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \


