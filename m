Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A223BF74C
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jul 2021 11:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhGHJL4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jul 2021 05:11:56 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:15878 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhGHJL4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jul 2021 05:11:56 -0400
X-Greylist: delayed 539 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 05:11:56 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625734632;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XmOoR1X1Fqcmv/RQsq1gQvAxnzNyfmu3YnhqcJqI6Ng=;
    b=XBljJ7RNGBTlnVb6cHgJ95X7N4wKFz9hMllELD9VWSUBdHFzTSw5z3O6VjxBkQBcCX
    Cu2dQv0duQdoG3VLpBKAaHkgJgMvMKK8g25k0X8alsuyU68JJJxLhcTncjp4z+w0jgAe
    gDsPFX8n3GOiKfVVxxwzDfD/mgi+/06x+3l/QaWr8DFsXMIILHiuBTvEqZgpZl7SRwGj
    pLWERKWm5Jzoj23x9ZDfBhZ3eJvGZra8hUxxDJVcswuuGSFkK5Uig98tNjBHMuMwihmD
    7OqP4frMUyK3z46niOGcSIYWTXS+JCJcR5Sbi8xxUlN3ciqbhs7pTn9ctStKdd0iMNXF
    qszg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDtsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x688vCcEC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 8 Jul 2021 10:57:12 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jessica Yu <jeyu@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     letux-kernel@openphoenux.org, "H. Peter Anvin" <hpa@zytor.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 1/2] x86/tools/relocs: Fix non-POSIX regexp
Date:   Thu,  8 Jul 2021 10:57:09 +0200
Message-Id: <81c6de380d932bfb94d96fb70459dd47afd6ed5d.1625734629.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625734629.git.hns@goldelico.com>
References: <cover.1625734629.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Trying to run a cross-compiled x86 relocs tool on a BSD based
HOSTCC leads to errors like

  VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
  CC      arch/x86/boot/compressed/misc.o - due to: arch/x86/boot/compressed/../voffset.h
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1

It turns out that relocs.c uses patterns like

	"something(|_end)"

This is not valid syntax or gives undefined results according
to POSIX 9.5.3 ERE Grammar

	https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html

It seems to be silently accepted by the Linux regexp() implementation
while a BSD host complains.

Such patterns can be replaced by a transformation like

	"(|p1|p2)" -> "(p1|p2)?"

Fixes: fd952815307f ("x86-32, relocs: Whitelist more symbols for ld bug workaround")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/x86/tools/relocs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 04c5a44b96827..9ba700dc47de4 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -57,12 +57,12 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	[S_REL] =
 	"^(__init_(begin|end)|"
 	"__x86_cpu_dev_(start|end)|"
-	"(__parainstructions|__alt_instructions)(|_end)|"
-	"(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
+	"(__parainstructions|__alt_instructions)(_end)?|"
+	"(__iommu_table|__apicdrivers|__smp_locks)(_end)?|"
 	"__(start|end)_pci_.*|"
 	"__(start|end)_builtin_fw|"
-	"__(start|stop)___ksymtab(|_gpl)|"
-	"__(start|stop)___kcrctab(|_gpl)|"
+	"__(start|stop)___ksymtab(_gpl)?|"
+	"__(start|stop)___kcrctab(_gpl)?|"
 	"__(start|stop)___param|"
 	"__(start|stop)___modver|"
 	"__(start|stop)___bug_table|"
-- 
2.31.1

