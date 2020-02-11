Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7357E1599AE
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 20:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730920AbgBKTYs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 14:24:48 -0500
Received: from rcdn-iport-7.cisco.com ([173.37.86.78]:18551 "EHLO
        rcdn-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbgBKTYs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 14:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2210; q=dns/txt; s=iport;
  t=1581449087; x=1582658687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m5bd08Dg/Wh9e/1hpJpWgOpEeDFpXi15XE7WkMEbPzQ=;
  b=OVt3Jbu36DkQe2epcYKaKDOP6wVTHVHMvvDAXM7gYD8jnpbPqOGWILQf
   Y1SW9JSeLFxViPi13YLiPUlKcWQmQOUM9OHCYa19vwgMpE9YrdDYYgF94
   p9hlHBtAKsa+kONOf91J134uUj3N5JMFbtqoeLfoLoBU+LcsKdmoUdyq/
   s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AWAABt/kJe/49dJa1mGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqAgEBAQELAYIogUEyKpZAiGGRWQkBAQEMAQE?=
 =?us-ascii?q?vAQGEQAKCRyQ3Bg4CAw0BAQQBAQECAQUEbYVDhWcGMgFGEFEhNgYBEhuDC4J?=
 =?us-ascii?q?LAy6rMYIniBQNgiCBOAGHRIReGoIAgRGCXnOCG4geBJgIlyZEgkSCTo9ShCA?=
 =?us-ascii?q?MG4JIiBGQNo5kixSQEQIEBgUCFYFoI4FYTSMVgydQGA2dBCADMI5oAQE?=
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; 
   d="scan'208";a="713842324"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Feb 2020 19:24:47 +0000
Received: from kamensky-p53s.cisco.com ([10.24.40.152])
        (authenticated bits=0)
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPSA id 01BJObLU004796
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 11 Feb 2020 19:24:46 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH v2 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Date:   Tue, 11 Feb 2020 11:24:33 -0800
Message-Id: <20200211192434.24871-2-kamensky@cisco.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211192434.24871-1-kamensky@cisco.com>
References: <20200211192434.24871-1-kamensky@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.40.152, [10.24.40.152]
X-Outbound-Node: rcdn-core-7.cisco.com
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
enabled by default only in mips-poky-linux-gcc case. MIPS binutils
ld relies on R_MIPS_JALR relocation to convert 'jalr t9' into 'bal'
and such relocation is generated only if -mrelax-pic-calls option
is on.

Please note 'jalr t9' conversion to 'bal' can happen only to static
functions. These static PIC calls use mips local GOT entries that
are supposed to be filled with start of DSO value by run-time linker
(missing in VDSO case) and they do not have dynamic relocations.
Global mips GOT entries must have dynamic relocations and they should
be prevented by cmd_vdso_check Makefile rule.

Solution call out -mrelax-pic-calls and -mexplicit-relocs options
explicitly while compiling MIPS vdso code. That would get correct
and consistent between different toolchains behaviour.

Reported-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 arch/mips/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index aa89a41dc5dd..848baeaef1f8 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -33,6 +33,7 @@ endif
 cflags-vdso := $(ccflags-vdso) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
 	-O3 -g -fPIC -fno-strict-aliasing -fno-common -fno-builtin -G 0 \
+	-mrelax-pic-calls -mexplicit-relocs \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
-- 
2.24.1

