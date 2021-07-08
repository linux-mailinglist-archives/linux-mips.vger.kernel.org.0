Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FD83BF74B
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jul 2021 11:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhGHJLz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jul 2021 05:11:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:8720 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhGHJLx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jul 2021 05:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625734633;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=T6ETvbXoVE/hpvkyrA1LsDKpPMonbOGVOXqyXUMKr1o=;
    b=aC0LdQXdsPA9SOoqQn1OOSmMcewcyfnz9wfRA6gFvmxq9WoSJpHEN53VTo56F2yPsC
    haQiRWoex4akVnwn/K665Bx1Bq7+jbJQAMT4Caj/PBMPtVEwkU7TlskKhW8xV6cpwxfH
    u21230KZ/PIowFK4yLiuFz2VLlt0D5sHY4OFmz8krT85VvLD06lQ+lk4BpD7nJ51FdIs
    qV9o920mhaOjGUpIglhyvLpWjnQd2rPec+9Yc1Bh2aqAE6Uovxd9F3XV2/eu67vosisl
    9nAOYpoBFFCYxKgsJoojbjYRj+QaDDHcv5c+pqR73OWzAmW0b50JiXDj18pw+qxSlnPU
    vbnA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDtsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x688vCcED
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
Subject: [PATCH 2/2] arch: mips: Fix non-POSIX regexp
Date:   Thu,  8 Jul 2021 10:57:10 +0200
Message-Id: <f1be72eb0fd589df5a535792a3f21949bd46da50.1625734629.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625734629.git.hns@goldelico.com>
References: <cover.1625734629.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When cross compiling a MIPS kernel on a BSD based HOSTCC leads
to errors like

  SYNC    include/config/auto.conf.cmd - due to: .config
egrep: empty (sub)expression
  UPD     include/config/kernel.release
  HOSTCC  scripts/dtc/dtc.o - due to target missing

It turns out that egrep uses this egrep pattern:

		(|MINOR_|PATCHLEVEL_)

This is not valid syntax or gives undefined results according
to POSIX 9.5.3 ERE Grammar

	https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html

It seems to be silently accepted by the Linux egrep implementation
while a BSD host complains.

Such patterns can be replaced by a transformation like

	"(|p1|p2)" -> "(p1|p2)?"

Fixes: 48c35b2d245f ("[MIPS] There is no __GNUC_MAJOR__")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 258234c35a096..674f68d16a73f 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -321,7 +321,7 @@ KBUILD_LDFLAGS		+= -m $(ld-emul)
 
 ifdef CONFIG_MIPS
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
-	egrep -vw '__GNUC_(|MINOR_|PATCHLEVEL_)_' | \
+	egrep -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
 endif
 
-- 
2.31.1

