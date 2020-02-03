Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6E415135C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2020 00:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgBCXi4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 18:38:56 -0500
Received: from alln-iport-3.cisco.com ([173.37.142.90]:44403 "EHLO
        alln-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgBCXi4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Feb 2020 18:38:56 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Feb 2020 18:38:56 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1923; q=dns/txt; s=iport;
  t=1580773136; x=1581982736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hUFPGTn9cRu8DN5zJRuwxDU3dgRsBFdvlfpb6CbZYUY=;
  b=IN42kIkOVr2vONSR8xxEzQ7Kl925e6MVlCEEZ7kt1qeMbjJPvtGwoH6j
   E3+zbeLEEN089LAbgrX8EczGCtCVVgzfjP4sXCq7HhDF+LgJfiFy0hv1f
   osOPkOD0t6J3oMisBq356ypzoOKhcJTaSvdXIv5lCHlw5Z1Pzr+NLXWxi
   g=;
X-IPAS-Result: =?us-ascii?q?A0APAwDxqzhe/4oNJK1lHAEBAQEBBwEBEQEEBAEBgXuCK?=
 =?us-ascii?q?YFAATIqljaIYJFXCQEBAQwBAS8BAYRAAoI0JDgTAgMBAQEDAgMBAQEBBAEBA?=
 =?us-ascii?q?QIBBQRthUOFZwYyAUYQUSE2GRuDC4JLAy6sK4IniCkNgiCBOIdChF4aggCBE?=
 =?us-ascii?q?YJec4IbgXeBBoUhBJd+lyBEgkWCTo9IhB4MG5sImXCQCwIEBgUCFYFpIoFYT?=
 =?us-ascii?q?SMVgydQGA2dBCADMIxGgkMBAQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; 
   d="scan'208";a="405884893"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Feb 2020 23:31:49 +0000
Received: from kamensky-p53s.cisco.com ([10.24.32.118])
        (authenticated bits=0)
        by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 013NVas7021219
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 3 Feb 2020 23:31:48 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Date:   Mon,  3 Feb 2020 15:31:32 -0800
Message-Id: <20200203233133.38613-2-kamensky@cisco.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203233133.38613-1-kamensky@cisco.com>
References: <20200203233133.38613-1-kamensky@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.32.118, [10.24.32.118]
X-Outbound-Node: alln-core-5.cisco.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Observed that when kernel is built with Yocto mips64-poky-linux-gcc,
and mips64-poky-linux-gnun32-gcc toolchain, resulting vdso contains
'jalr t9' instructions in its code and since in vdso case nobody
sets GOT table code crashes when instruction reached. On other hand
observed that when kernel is built mips-poky-linux-gcc toolchain, the
same 'jalr t9' instruction are replaced with PC relative function
calls using 'bal' instructions.

The difference boils down to -mrelax-pic-calls and -mexplicit-relocs
gcc options that gets different default values depending on gcc
target triplets and corresponding binutils. -mrelax-pic-calls got
enabled by default only in mips-poky-linux-gcc case. MIPS binuitls
ld relies on R_MIPS_JALR relocation to convert 'jalr t9' into 'bal'
and such relocation is generated only if -mrelax-pic-calls option
is on.

Solution call out -mrelax-pic-calls and -mexplicit-relocs options
explicitily while compiling MIPS vdso code. That would get correct
and consistent between different toolchains behaviour.

Reported-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 arch/mips/vdso/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b2a2e032dc99..ec6c5c645edd 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -35,7 +35,9 @@ cflags-vdso := $(ccflags-vdso) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
-	$(call cc-option, -fno-stack-protector)
+	$(call cc-option, -fno-stack-protector) \
+	$(call cc-option, -mrelax-pic-calls) \
+	$(call cc-option, -mexplicit-relocs)
 aflags-vdso := $(ccflags-vdso) \
 	-D__ASSEMBLY__ -Wa,-gdwarf-2
 
-- 
2.21.1

