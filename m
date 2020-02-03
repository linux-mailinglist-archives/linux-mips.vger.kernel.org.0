Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6D215135D
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2020 00:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgBCXi5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 18:38:57 -0500
Received: from alln-iport-6.cisco.com ([173.37.142.93]:27169 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgBCXi5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Feb 2020 18:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1593; q=dns/txt; s=iport;
  t=1580773137; x=1581982737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aj2+BbFdPHRJQyZDbF2OEy0xoi5hAlCV4jADDrTJ0w0=;
  b=NMiMYoz106nAvlHQvbKebyB/M7HmL4Ijxdu1b0/cw+GwtDT3FiUe+9SW
   DaU92f2rowYCEFQbbEFRIrGb+ucN0vnUJSTilQcx+H/b9SrnxVLxToMvM
   mZUevm2sIBTwH3lZa2+TPGFACNR9PbFRTo22mNx9AyBBHmMvBruIZaJYc
   4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C5AABYrDhe/4oNJK1lHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWoEAQELAYIogUABMiqwbQkBAQEMAQEvAQGEQAKCNCQ3Bg4CAw0?=
 =?us-ascii?q?BAQQBAQECAQUEbYVDhWcGMgFGEFFXGYMmgnysK4InilaBOAGHQYReGoIAgRG?=
 =?us-ascii?q?DUYQSgQaFIQSXfpdkgkWCTpNmDBubCKl7AgQGBQIVgWgjgVhNIxWDJ1AYDZ0?=
 =?us-ascii?q?EIAMwjEaCQwEB?=
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; 
   d="scan'208";a="443037701"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 03 Feb 2020 23:31:50 +0000
Received: from kamensky-p53s.cisco.com ([10.24.32.118])
        (authenticated bits=0)
        by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 013NVas8021219
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 3 Feb 2020 23:31:49 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH 2/2] mips: vdso: add build time check that no 'jalr t9' calls left
Date:   Mon,  3 Feb 2020 15:31:33 -0800
Message-Id: <20200203233133.38613-3-kamensky@cisco.com>
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

vdso shared object cannot have GOT based PIC 'jalr t9' calls
because nobody set GOT table in vdso. Contributing into vdso
.o files are compiled in PIC mode and as result for internal
static functions calls compiler will generate 'jalr t9'
instructions. Those are supposed to be converted into PC
relative 'bal' calls by linker when relocation are processed.

Add additional build time check to make sure that no 'jalr t9'
slip through because of some toolchain misconfiguration that
prevents 'jalr t9' to 'bal' conversion.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 arch/mips/vdso/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index ec6c5c645edd..c755cdb1de57 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -83,12 +83,18 @@ GCOV_PROFILE := n
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
2.21.1

