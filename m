Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC932ADC39
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 17:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKJQgk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 11:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKJQgj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 11:36:39 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6487AC0613CF
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 08:36:39 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id qgcd2300d4C55Sk06gcdMp; Tue, 10 Nov 2020 17:36:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcWdF-001EGA-Jd; Tue, 10 Nov 2020 17:36:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcWdE-00DwJH-Q3; Tue, 10 Nov 2020 17:36:32 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mips: Remove #include <uapi/asm/types.h> from <asm/types.h>
Date:   Tue, 10 Nov 2020 17:36:31 +0100
Message-Id: <20201110163631.3322364-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Everything in arch/mips/include/uapi/asm/types.h is protected by
"#ifndef __KERNEL__", so it's unused for kernelspace.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This is a resend of a very old patch from 2013, which is still valid.

 arch/mips/include/asm/types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/types.h b/arch/mips/include/asm/types.h
index 148d42a17f30ded6..638ef88e2f8ea4f2 100644
--- a/arch/mips/include/asm/types.h
+++ b/arch/mips/include/asm/types.h
@@ -12,6 +12,5 @@
 #define _ASM_TYPES_H
 
 #include <asm-generic/int-ll64.h>
-#include <uapi/asm/types.h>
 
 #endif /* _ASM_TYPES_H */
-- 
2.25.1

