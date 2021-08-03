Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5423DF1ED
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbhHCP7K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 11:59:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:36076 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237131AbhHCP7J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Aug 2021 11:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628006307;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=mU3eT7eyGsL5o6LF8h+YK7bclXW4GXpf5fpmDUrcIzU=;
    b=nlZQVoanb18I3z7wIRRMbvOjqNJXGdBzEiIlUkhXUsWy76YbvNAsAfvfBgjOdRKEaD
    U29d7bn6ardkbbrpOq1Zqqz3Gh0jnE00shaf+vEjFcBY2WLTdd6ajrcGNrVNdku0E/oS
    z3EP2PWzZ4E0bqt8Xuy4JM/fArKzo4CH2EDI4iFg4SRRi6HQcx+0Jk23kLaLt4pC1oGc
    dM0S6TURFE+bKosjdfOw1MPAK1BMjVMavaJyqxeNv6p8srMQjmSMhhJPQwyGoXe4jhN7
    htFB2QF/uVeiR8s2okhFIuGGcKuRZaQzUw2302hT5o0sGaw5ae5LGL7yf7ou7YjDZqTr
    bfvw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDOqAdo="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.30.1 DYNA|AUTH)
    with ESMTPSA id K060b1x73FwN0fL
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 3 Aug 2021 17:58:23 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/2] Regex fixes for mips and x86 cross-compile
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAKwvOd=FdZsQZCGqqpnbzgVZ+s2=ffyh337RwqyTAzHMcjUb+w@mail.gmail.com>
Date:   Tue, 3 Aug 2021 17:58:22 +0200
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jessica Yu <jeyu@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFB4FABC-60B7-445D-ACEB-4AAE177AF8D4@goldelico.com>
References: <cover.1625734629.git.hns@goldelico.com>
 <4AC1CCE9-CCAF-4D4B-BAD5-CEB9E5155FDF@goldelico.com>
 <CAKwvOd=FdZsQZCGqqpnbzgVZ+s2=ffyh337RwqyTAzHMcjUb+w@mail.gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,
any chance to get that reviewed and merged into v5.15-rc1 and backported =
to stable?
Thank you,
Nikolaus Schaller


> Am 19.07.2021 um 22:37 schrieb Nick Desaulniers =
<ndesaulniers@google.com>:
>=20
> + Masahiro, linux-kbuild (EOM)
>=20
> On Mon, Jul 19, 2021 at 12:07 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>=20
>> Any chance that it gets merged?
>>=20
>>> Am 08.07.2021 um 10:57 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>> Trying to run the x86 relocs tool on a BSD based HOSTCC (cross
>>> compilation environment) leads to errors like
>>>=20
>>> VOFFSET arch/x86/boot/compressed/../voffset.h - due to: vmlinux
>>> CC      arch/x86/boot/compressed/misc.o - due to: =
arch/x86/boot/compressed/../voffset.h
>>> OBJCOPY arch/x86/boot/compressed/vmlinux.bin - due to: vmlinux
>>> RELOCS  arch/x86/boot/compressed/vmlinux.relocs - due to: vmlinux
>>> empty (sub)expressionarch/x86/boot/compressed/Makefile:118: recipe =
for target 'arch/x86/boot/compressed/vmlinux.relocs' failed
>>> make[3]: *** [arch/x86/boot/compressed/vmlinux.relocs] Error 1
>>>=20
>>> and when cross compiling a MIPS kernel on a BSD based HOSTCC
>>> we get errors like
>>>=20
>>> SYNC    include/config/auto.conf.cmd - due to: .config
>>> egrep: empty (sub)expression
>>> UPD     include/config/kernel.release
>>> HOSTCC  scripts/dtc/dtc.o - due to target missing
>>>=20
>>> It turns out that relocs.c on x86 uses patterns like
>>>=20
>>>      "something(|_end)"
>>>=20
>>> while MIPS uses egrep with
>>>=20
>>>      (|MINOR_|PATCHLEVEL_)
>>>=20
>>> In both cases it is not valid syntax or gives undefined results
>>> according to POSIX 9.5.3 ERE Grammar
>>>=20
>>>      =
https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
>>>=20
>>> It seems to be silently accepted by the Linux regcmp() or egrep
>>> implementation while a BSD host complains.
>>>=20
>>> Such patterns can be replaced by a transformation like
>>>=20
>>>      "(|p1|p2)" -> "(p1|p2)?"
>>>=20
>>> Test Linux:
>>>=20
>>> root@letux:~# echo foo | egrep '^(|foo)$'
>>> foo
>>> root@letux:~# echo fool | egrep '^(foo)?$'
>>> root@letux:~# echo fun | egrep '^(|foo)$'
>>> root@letux:~# echo f | egrep '^(|foo)$'
>>> root@letux:~# echo | egrep '^(|foo)$'
>>>=20
>>> root@letux:~# echo foo | egrep '^(foo)?$'
>>> foo
>>> root@letux:~# echo fool | egrep '^(foo)?$'
>>> root@letux:~# echo fun | egrep '^(foo)?$'
>>> root@letux:~# echo f | egrep '^(foo)?$'
>>> root@letux:~# echo | egrep '^(foo)?$'
>>>=20
>>> root@letux:~#
>>>=20
>>> Test BSD:
>>>=20
>>> iMac:master hns$ echo foo | egrep '^(|foo)$'
>>> egrep: empty (sub)expression
>>> iMac:master hns$ echo fool | egrep '^(foo)?$'
>>> egrep: empty (sub)expression
>>> iMac:master hns$ echo fun | egrep '^(|foo)$'
>>> egrep: empty (sub)expression
>>> iMac:master hns$ echo f | egrep '^(|foo)$'
>>> egrep: empty (sub)expression
>>> iMac:master hns$ echo | egrep '^(|foo)$'
>>> egrep: empty (sub)expression
>>> iMac:master hns$ echo foo | egrep '^(foo)?$'
>>> foo
>>> iMac:master hns$ echo fool | egrep '^(foo)?$'
>>> iMac:master hns$ echo fun | egrep '^(foo)?$'
>>> iMac:master hns$ echo f | egrep '^(foo)?$'
>>> iMac:master hns$ echo | egrep '^(foo)?$'
>>>=20
>>> iMac:master hns$
>>>=20
>>>=20
>>> H. Nikolaus Schaller (2):
>>> x86/tools/relocs: Fix non-POSIX regexp
>>> arch: mips: Fix non-POSIX regexp
>>>=20
>>> arch/mips/Makefile      | 2 +-
>>> arch/x86/tools/relocs.c | 8 ++++----
>>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>>=20
>>> --
>>> 2.31.1
>>>=20
>>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers

