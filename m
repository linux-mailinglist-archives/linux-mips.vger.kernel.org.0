Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8EBD1599AF
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 20:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgBKTYt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 14:24:49 -0500
Received: from rcdn-iport-6.cisco.com ([173.37.86.77]:50692 "EHLO
        rcdn-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgBKTYt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 14:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1930; q=dns/txt; s=iport;
  t=1581449088; x=1582658688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qiGnObKQdzqvi23BX9xsys6f9vwggQBiW7mdU3LAoPo=;
  b=L3t8o29LPWN3NHscWCdOCqWvu3ftYInaZy+a3JNEKr7n2rBLk9ZLpl8m
   US8/r4a8SMHFSS1yjdd/m67sLDrBxJIgn/+YQZmr4PXwFAlwMslRVvQ4Q
   6Zk1w2OgOG1U38SnMXf4Y2IYSUkjt/iNVdBPGY7JWw38XW8btjvIKlvTQ
   c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ANAAC9/kJe/49dJa1mGwEBAQEBAQE?=
 =?us-ascii?q?FAQEBEQEBAwMBAQGBZwYBAQELAYIogUEyKow4okiBewkBAQEMAQEvAQGEQAK?=
 =?us-ascii?q?CRyQ0CQ4CAw0BAQQBAQECAQUEbYVDhWcGMgFGEFFXBgESgyaCfKsygieKP4E?=
 =?us-ascii?q?4AYdEhF4aggCBEYNRhBKGJwSYCJdqgkSCTpNyDBubD45kmyUCBAYFAhWBUjm?=
 =?us-ascii?q?BWE0jFYMnUBgNnQQgAzCMJYJDAQE?=
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; 
   d="scan'208";a="721940011"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Feb 2020 19:24:47 +0000
Received: from kamensky-p53s.cisco.com ([10.24.40.152])
        (authenticated bits=0)
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPSA id 01BJObLV004796
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 11 Feb 2020 19:24:47 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH v2 2/2] mips: vdso: add build time check that no 'jalr t9' calls left
Date:   Tue, 11 Feb 2020 11:24:34 -0800
Message-Id: <20200211192434.24871-3-kamensky@cisco.com>
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

vdso shared object cannot have GOT based PIC 'jalr t9' calls
because nobody set GOT table in vdso. Contributing into vdso
.o files are compiled in PIC mode and as result for internal
static functions calls compiler will generate 'jalr t9'
instructions. Those are supposed to be converted into PC
relative 'bal' calls by linker when relocation are processed.

Mips global GOT entries do have dynamic relocations and they
will be caught by cmd_vdso_check Makefile rule. Static PIC
calls go through mips local GOT entries that do not have
dynamic relocations. For those 'jalr t9' calls could be present
but without dynamic relocations and they need to be converted
to 'bal' calls by linker.

Add additional build time check to make sure that no 'jalr t9'
slip through because of some toolchain misconfiguration that
prevents 'jalr t9' to 'bal' conversion.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 arch/mips/vdso/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 848baeaef1f8..8d713e0ae33a 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -82,12 +82,18 @@ GCOV_PROFILE := n
 UBSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
 
+# Check that we don't have PIC 'jalr t9' calls left
+quiet_cmd_vdso_mips_check = VDSOCHK $@
+      cmd_vdso_mips_check = if $(OBJDUMP) --disassemble $@ | egrep -h "jalr.*t9" > /dev/null; \
+		       then (echo >&2 "$@: PIC 'jalr t9' calls are not supported"; \
+			     rm -f $@; /bin/false); fi
+
 #
 # Shared build commands.
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
+      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
 
 quiet_cmd_vdsold = VDSO    $@
       cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
-- 
2.24.1

