Return-Path: <linux-mips+bounces-152-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270E7F4299
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5EF51C209CA
	for <lists+linux-mips@lfdr.de>; Wed, 22 Nov 2023 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084255645C;
	Wed, 22 Nov 2023 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DrqPc3I8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDF41FF5
	for <linux-mips@vger.kernel.org>; Wed, 22 Nov 2023 01:47:47 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ce627400f6so37962555ad.2
        for <linux-mips@vger.kernel.org>; Wed, 22 Nov 2023 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700646466; x=1701251266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=DrqPc3I8KAANsz2ZPzGvIzvvxPmpaOa5yJyZkEaA4qz9m26rjLAaecr6zZPQrqnzkE
         ikmaeVyhPG3Jm8EtOjttEshmOWd4T+x/XiZ3uzvvh6RziWCNDWT2WE/HFzJee0a6A+28
         LrBpbdvGCHVIcY3EbK+bonNNYhFr6g/hq6unMCbCe8ovZlrY+C+lIFHOEyy5WZw0DqZ6
         prv/5EOs0WZiAXxf9MV6hvKBendGDOYooz0HuZ49yQv6I9RgbmlezN1DF8PRB+Y032SE
         3Tq4U+9e0Jjc4bX5Urr71zJxW2o90qLWueit7zlRtMHVZWVn24YoKFe2pxOxh0JGYCN1
         LjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646466; x=1701251266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=RnYchOV6TBgr1WeMPC06ZWswBcF4kxeTOxkkO6Tnc47606oAKOCyPfV5XHWUGde1Jb
         e31aPA/L7UdC7TW58+4FSMSSU9eur7wuVnPzMpXKjyRgGNfy7PcNqdHeOinee4Vwuj/U
         ZMGEEEJrBFId2UwBtB4ZbTlljNiyt8vptkZw1JmCBv5JBIMiYH5pvS4GkCtwLnf1T/Uo
         HKZfjhlWZVeJirhq2IsxUQDKci+4NWeB3rfGWRZ5fki7ch2uen1scyE10n9EifCvvvPU
         jCotBQNPahju5XjHnAp9N+42UJMqkVhv2SXKA7+vqBR/RkztIC3PziVDw/8U30WIcZjS
         xz3g==
X-Gm-Message-State: AOJu0Yw6qfOiGeL1D1IkHbOKXANqG6U0UK4Mndt4TzUcqbdldWYtyRoH
	a13wRLEV6LGtd+fIjRWJ5DnzYxArP5BxwQHDi7zZ6Q==
X-Google-Smtp-Source: AGHT+IEoe5dhUWpYOgp49hInJ/tXkDzht17Dpr4KVAZ7DyJBSpmejqoRh7l88C3hHutZlPs8wlq5Gnw1rhenR1f8+40=
X-Received: by 2002:a17:90b:1d04:b0:27d:5946:5e2c with SMTP id
 on4-20020a17090b1d0400b0027d59465e2cmr1934810pjb.12.1700646466036; Wed, 22
 Nov 2023 01:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
 <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com> <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
In-Reply-To: <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 22 Nov 2023 09:47:34 +0000
Message-ID: <CALrw=nGadgbwuNAFacatz-agpGn9NvtgaCUXu73MzAzZq07k-g@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>
Cc: eric_devolder@yahoo.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, geert@linux-m68k.org, 
	tsbogend@alpha.franken.de, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	dave.hansen@linux.intel.com, x86@kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com, 
	juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk, 
	linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 9:34=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 11/21/23 at 09:43am, Ignat Korchagin wrote:
> > On Tue, Nov 21, 2023 at 7:53=E2=80=AFAM Ignat Korchagin <ignat@cloudfla=
re.com> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 1:50=E2=80=AFAM Baoquan He <bhe@redhat.com> w=
rote:
> > > >
> > > > Eric DeVolder's Oracle mail address is not available anymore, add h=
is
> > > > current mail address he told me.
> > >
> > > Thank you!
> > >
> > > > On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > > > > Good day!
> > > > >
> > > > > We have recently started to evaluate Linux 6.6 and noticed that w=
e
> > > > > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > > > > enabled. It seems to be related to commit 89cde455 ("kexec:
> > > > > consolidate kexec and crash options into kernel/Kconfig.kexec"), =
where
> > > > > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> > > > >
> > > > > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FIL=
E
> > > > > with enforced signature check to support the kernel crash dumping
> > > > > functionality and would like to keep CONFIG_KEXEC disabled for
> > > > > security reasons [1].
> > > > >
> > > > > I was reading the long commit message, but the reason for adding
> > > > > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And=
 I
> > > > > believe from the implementation perspective CONFIG_KEXEC_FILE sho=
uld
> > > > > suffice here (as we successfully used it for crashdumps on Linux =
6.1).
> > > > >
> > > > > Is there a reason for adding this dependency or is it just an
> > > > > oversight? Would some solution of requiring either CONFIG_KEXEC o=
r
> > > > > CONFIG_KEXEC_FILE work here?
> > > >
> > > > I searched the patch history, found Eric didn't add the dependency =
on
> > > > CONFIG_KEXEC at the beginning. Later a linux-next building failure =
with
> > > > randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> > > > CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency f=
or
> > > > CRASH_DUMP. Please see below link for more details:
> > > >
> > > > https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@or=
acle.com/T/#u
> > >
> > > Thank you for digging this up. However I'm still confused, because
> > > this is exactly how we configure Linux 6.1 (although we do have
> > > CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
> > > we did not investigate this issue properly.
> >
> > I did some preliminary investigation for this. If I patch out the
> > dependency on CONFIG_KEXEC the kernel builds just fine for x86
> > (without CONFIG_CRASH_HOTPLUG - which is probably another issue) - so
> > this was the previous behaviour. I can see that the reported error is
> > for arm architecture and was able to reproduce it with a simple cross
> > compiler in Debian. However, I think it is still somehow related to
> > this patchset as the previous kernels (up to 6.5) build fine with just
> > CONFIG_CRASH_DUMP and without CONFIG_KEXEC for arm as well. So even
> > for arm it was introduced in 6.6.
>
> Thanks for the information.
>
> I haven't run the reproducer of issue reported on Eric's old patchset,
> while checkout to kernel 6.1, only s390 selected KEXEC for CRASH_DUMP
> already. And with the ARM building breakage, the simplest idea is
> to select KEXEC only for ARM or S390 CRASH_DUMP. I plan to try the
> reproducer later. If you have any idea or draft patch, please feel free
> to post.

The thing is - before 6.6 even ARM did not require KEXEC for
CRASH_DUMP (at least to successfully compile), so I think we should
understand what changed first before adding a dependency for ARM. I'll
try to investigate more, if I have time.

> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 7aff28ded2f4..382dcd8d7a9d 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config CRASH_DUMP
>         depends on ARCH_SUPPORTS_KEXEC
>         select CRASH_CORE
>         select KEXEC_CORE
> -       select KEXEC
> +       select KEXEC if (ARM || S390)
>
>
> arch/s390/Kconfig in kernel 6.1:
> config CRASH_DUMP
>         bool "kernel crash dumps"
>         select KEXEC
>         help
>           Generate crash dump after being started by kexec.
>           Crash dump kernels are loaded in the main kernel with kexec-too=
ls
>           into a specially reserved region and then later executed after
>           a crash by kdump/kexec.
>           Refer to <file:Documentation/s390/zfcpdump.rst> for more detail=
s on this.
>           This option also enables s390 zfcpdump.
>           See also <file:Documentation/s390/zfcpdump.rst>
>
> >
> > > > And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> > > > CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> > > > cpu/memory hotplug hapened.
> > >
> > > This still feels like a regression to me: any crash dump support
> > > should be independent of KEXEC syscalls being present. While probably
> > > the common case (including us) that the crashing kernel and recovery
> > > kernel are the same, they don't have to be. We need kexec syscall in
> > > the crashing kernel, but crashdump support in the recovery kernel (bu=
t
> > > the recovery kernel not having the kexec syscalls should be totally
> > > fine). If we do require some code definitions from kexec - at most we
> > > should put them under CONFIG_KEXEC_CORE.
> > >
> > > > Thanks
> > > > Baoquan
> > > >
> >
> > Ignat
> >
>

