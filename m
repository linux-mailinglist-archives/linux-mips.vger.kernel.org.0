Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD2E3BF733
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jul 2021 11:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhGHJFz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Jul 2021 05:05:55 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:15416 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbhGHJFz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Jul 2021 05:05:55 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 05:05:55 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625734632;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=iMRZVT0Tu7tx9Ozu7snuafqAPBSc8LY5A9UI4FquInw=;
    b=tvAf41S9MUBp7FDUpllh84nf/t2HA9lbS4VCw2BU/9wPj6veSxZKT6yw3AIZkGHZC1
    +UFBHDdAibv9bNnefsZw6e732Bq4+D7t+sx8fxPzAre/Tl3OKig1rl1wwpsUtOOzq892
    X4mew3WwCcZAgwaw+XbNdhTEhLnRnV1SrgjOSKk5/f2yfnRhhe2pAcWyVUkroRq+aSqE
    VF6sBKkbQr7E86yt7ChzkCaWROIeju8FCEDq07ZxlCaOmWgXH0fGStfPZghVXCNmp4Pj
    6IGoviAQoieSDZzwuyW04XhSWz4Sr3/NL8Z4cLqMMB9m2ZFV4n8XxBfMf4F+gjxGEn7S
    LHAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDtsZQ=="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x688vBcEB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 8 Jul 2021 10:57:11 +0200 (CEST)
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
Subject: [PATCH 0/2] Regex fixes for mips and x86 cross-compile
Date:   Thu,  8 Jul 2021 10:57:08 +0200
Message-Id: <cover.1625734629.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Trying to run the x86 relocs tool on a BSD based HOSTCC (cross
compilation environment) leads to errors like

  VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
  CC      arch/x86/boot/compressed/misc.o - due to: arch/x86/boot/compressed/../voffset.h
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1

and when cross compiling a MIPS kernel on a BSD based HOSTCC
we get errors like

  SYNC    include/config/auto.conf.cmd - due to: .config
egrep: empty (sub)expression
  UPD     include/config/kernel.release
  HOSTCC  scripts/dtc/dtc.o - due to target missing

It turns out that relocs.c on x86 uses patterns like

	"something(|_end)"

while MIPS uses egrep with

	(|MINOR_|PATCHLEVEL_)

In both cases it is not valid syntax or gives undefined results
according to POSIX 9.5.3 ERE Grammar

	https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html

It seems to be silently accepted by the Linux regcmp() or egrep
implementation while a BSD host complains.

Such patterns can be replaced by a transformation like

	"(|p1|p2)" -> "(p1|p2)?"

Test Linux:

root@letux:~# echo foo | egrep '^(|foo)$'
foo
root@letux:~# echo fool | egrep '^(foo)?$'
root@letux:~# echo fun | egrep '^(|foo)$'
root@letux:~# echo f | egrep '^(|foo)$'
root@letux:~# echo | egrep '^(|foo)$'

root@letux:~# echo foo | egrep '^(foo)?$'
foo
root@letux:~# echo fool | egrep '^(foo)?$'
root@letux:~# echo fun | egrep '^(foo)?$'
root@letux:~# echo f | egrep '^(foo)?$'
root@letux:~# echo | egrep '^(foo)?$'

root@letux:~# 

Test BSD:

iMac:master hns$ echo foo | egrep '^(|foo)$'
egrep: empty (sub)expression
iMac:master hns$ echo fool | egrep '^(foo)?$'
egrep: empty (sub)expression
iMac:master hns$ echo fun | egrep '^(|foo)$'
egrep: empty (sub)expression
iMac:master hns$ echo f | egrep '^(|foo)$'
egrep: empty (sub)expression
iMac:master hns$ echo | egrep '^(|foo)$'
egrep: empty (sub)expression
iMac:master hns$ echo foo | egrep '^(foo)?$'
foo
iMac:master hns$ echo fool | egrep '^(foo)?$'
iMac:master hns$ echo fun | egrep '^(foo)?$'
iMac:master hns$ echo f | egrep '^(foo)?$'
iMac:master hns$ echo | egrep '^(foo)?$'

iMac:master hns$ 


H. Nikolaus Schaller (2):
  x86/tools/relocs: Fix non-POSIX regexp
  arch: mips: Fix non-POSIX regexp

 arch/mips/Makefile      | 2 +-
 arch/x86/tools/relocs.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.31.1

