Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB021E3961
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 08:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgE0Gfs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 02:35:48 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34432 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgE0Gfs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 02:35:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id A176620D28;
        Wed, 27 May 2020 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590561348; bh=8VJCyc5wm9dKhC2IY7gypReS7SA7o6U7AMsatbtINZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XZ0Zn1opBlPlBfjOREAlapSbP9ADeBrZfSfMD96IAxVJObeKG8JkmBPu0FEWasWRy
         5HuwMrMD2kSToT4+tVgQN963tCamjyLqz0jsPbheM1F0sQ0kxYAdx/tsSMC4cbjHua
         eZ6FPZjbJhIaJONnfwYRNYuDixbbitMCE87CjRKUP76JeEWWvMuQn3X5mpvxpIBqv+
         AlxC74J/sErJX23qeO0d64Mo9C+Rr1u601DWNK995ZUTJXMgwBEduAQMXkZZcBZWyr
         yG/vINsV8YRySjwA14AR/P7WGVFHUYzM2Rm8PJxbqWYI4IotPTdmGF1p7PdYQbdNVd
         67q927/Vw84Bw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] MIPS: Move kernel head into a standalone section
Date:   Wed, 27 May 2020 14:34:33 +0800
Message-Id: <20200527063438.391949-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
References: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

That's what already done by Arm64 and other architectures.
That would allow us put more things like PE headers safely into
the header.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/head.S        | 4 ++--
 arch/mips/kernel/vmlinux.lds.S | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index c7c2795837e7..8081a905a71c 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -59,6 +59,8 @@
 #endif
 	.endm
 
+	__HEAD
+_head:
 #ifndef CONFIG_NO_EXCEPT_FILL
 	/*
 	 * Reserved space for exception handlers.
@@ -67,8 +69,6 @@
 	.fill	0x400
 #endif
 
-EXPORT(_stext)
-
 	/*
 	 * Give us a fighting chance of running if execution beings at the
 	 * kernel load address.	 This is needed because this platform does
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index f185a85a27c1..b9ace667b82b 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -57,8 +57,12 @@ SECTIONS
 #endif
 	. = LINKER_LOAD_ADDRESS;
 	/* read-only */
-	_text = .;	/* Text and read-only data */
-	.text : {
+	.head.text : {
+		_text = .;
+		HEAD_TEXT
+	}
+	.text : {			/* Real text segment		*/
+		_stext = .;		/* Text and read-only data	*/
 		TEXT_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
-- 
2.27.0.rc0

