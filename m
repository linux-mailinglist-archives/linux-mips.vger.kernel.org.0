Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE8E13F9B2
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 20:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgAPTnv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 16 Jan 2020 14:43:51 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:53142 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgAPTnv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 14:43:51 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1isB3O-0008V7-83; Thu, 16 Jan 2020 20:43:42 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 87FEC101226; Thu, 16 Jan 2020 20:43:41 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     paul.burton@mips.com, luto@kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] MIPS: vdso: Define BUILD_VDSO32 when building a 32bit kernel
In-Reply-To: <20190830135902.20861-3-vincenzo.frascino@arm.com>
References: <20190830135902.20861-1-vincenzo.frascino@arm.com> <20190830135902.20861-3-vincenzo.frascino@arm.com>
Date:   Thu, 16 Jan 2020 20:43:41 +0100
Message-ID: <87d0bjfaqa.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The confinement of the 32bit specific VDSO functions missed to define
BUILD_VDSO32 when building a 32bit MIPS kernel:

arch/mips/vdso/vgettimeofday.c: In function ‘__vdso_clock_gettime’:
arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of function ‘__cvdso_clock_gettime32’

arch/mips/vdso/vgettimeofday.c: In function ‘__vdso_clock_getres’:
arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of function ‘__cvdso_clock_getres_time32’

Force the define for 32bit builds in the VDSO Makefile.

Fixes: bf279849ad59 ("lib/vdso: Build 32 bit specific functions in the right context")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/mips/vdso/Makefile |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -18,6 +18,10 @@ ccflags-vdso := \
 	$(filter -mno-loongson-%,$(KBUILD_CFLAGS)) \
 	-D__VDSO__
 
+ifndef CONFIG_64BIT
+ccflags-vdso += -DBUILD_VDSO32
+endif
+
 ifdef CONFIG_CC_IS_CLANG
 ccflags-vdso += $(filter --target=%,$(KBUILD_CFLAGS))
 endif
