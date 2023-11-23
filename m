Return-Path: <linux-mips+bounces-199-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF57F59F8
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 09:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7841C2093D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 08:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E380199D1;
	Thu, 23 Nov 2023 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwv0s4Gw"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714DBD49
	for <linux-mips@vger.kernel.org>; Thu, 23 Nov 2023 00:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700728040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clHFl9DyukhU/KNoZLAq0QP1VqRYJXancPu2G75tCi0=;
	b=dwv0s4GwYTTp3oANrUkSlik/LXGZ+viG81ul6mJUCDrdMLxs4VNpbR/6O+M8uCd/p1+3zJ
	fovcJM0yaHQvVOUGtm7TXuVJ8luMXudaxZJichxx+Bv6xigso6XTH2u7fVV3luDymWx/w1
	YgJPIH2JHFki0f7uHTo9fpLDkjgwpLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-xbU-EiHFNt2UCn3fOV12Bg-1; Thu, 23 Nov 2023 03:27:17 -0500
X-MC-Unique: xbU-EiHFNt2UCn3fOV12Bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 574DB101A53B;
	Thu, 23 Nov 2023 08:27:16 +0000 (UTC)
Received: from localhost (unknown [10.72.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8B82026D4C;
	Thu, 23 Nov 2023 08:27:12 +0000 (UTC)
Date: Thu, 23 Nov 2023 16:27:09 +0800
From: Baoquan He <bhe@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: eric_devolder@yahoo.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, geert@linux-m68k.org,
	tsbogend@alpha.franken.de,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org,
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
	juerg.haefliger@canonical.com, arnd@arndb.de,
	rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
Message-ID: <ZV8M3aUTdt2BWaAP@MiWiFi-R3L-srv>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
 <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
 <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
 <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
 <CALrw=nGadgbwuNAFacatz-agpGn9NvtgaCUXu73MzAzZq07k-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALrw=nGadgbwuNAFacatz-agpGn9NvtgaCUXu73MzAzZq07k-g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On 11/22/23 at 09:47am, Ignat Korchagin wrote:
> On Wed, Nov 22, 2023 at 9:34 AM Baoquan He <bhe@redhat.com> wrote:
> >
> > On 11/21/23 at 09:43am, Ignat Korchagin wrote:
> > > On Tue, Nov 21, 2023 at 7:53 AM Ignat Korchagin <ignat@cloudflare.com> wrote:
> > > >
> > > > On Tue, Nov 21, 2023 at 1:50 AM Baoquan He <bhe@redhat.com> wrote:
> > > > >
> > > > > Eric DeVolder's Oracle mail address is not available anymore, add his
> > > > > current mail address he told me.
> > > >
> > > > Thank you!
> > > >
> > > > > On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > > > > > Good day!
> > > > > >
> > > > > > We have recently started to evaluate Linux 6.6 and noticed that we
> > > > > > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > > > > > enabled. It seems to be related to commit 89cde455 ("kexec:
> > > > > > consolidate kexec and crash options into kernel/Kconfig.kexec"), where
> > > > > > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> > > > > >
> > > > > > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> > > > > > with enforced signature check to support the kernel crash dumping
> > > > > > functionality and would like to keep CONFIG_KEXEC disabled for
> > > > > > security reasons [1].
> > > > > >
> > > > > > I was reading the long commit message, but the reason for adding
> > > > > > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> > > > > > believe from the implementation perspective CONFIG_KEXEC_FILE should
> > > > > > suffice here (as we successfully used it for crashdumps on Linux 6.1).
> > > > > >
> > > > > > Is there a reason for adding this dependency or is it just an
> > > > > > oversight? Would some solution of requiring either CONFIG_KEXEC or
> > > > > > CONFIG_KEXEC_FILE work here?
> > > > >
> > > > > I searched the patch history, found Eric didn't add the dependency on
> > > > > CONFIG_KEXEC at the beginning. Later a linux-next building failure with
> > > > > randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> > > > > CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency for
> > > > > CRASH_DUMP. Please see below link for more details:
> > > > >
> > > > > https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com/T/#u
> > > >
> > > > Thank you for digging this up. However I'm still confused, because
> > > > this is exactly how we configure Linux 6.1 (although we do have
> > > > CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
> > > > we did not investigate this issue properly.
> > >
> > > I did some preliminary investigation for this. If I patch out the
> > > dependency on CONFIG_KEXEC the kernel builds just fine for x86
> > > (without CONFIG_CRASH_HOTPLUG - which is probably another issue) - so
> > > this was the previous behaviour. I can see that the reported error is
> > > for arm architecture and was able to reproduce it with a simple cross
> > > compiler in Debian. However, I think it is still somehow related to
> > > this patchset as the previous kernels (up to 6.5) build fine with just
> > > CONFIG_CRASH_DUMP and without CONFIG_KEXEC for arm as well. So even
> > > for arm it was introduced in 6.6.
> >
> > Thanks for the information.
> >
> > I haven't run the reproducer of issue reported on Eric's old patchset,
> > while checkout to kernel 6.1, only s390 selected KEXEC for CRASH_DUMP
> > already. And with the ARM building breakage, the simplest idea is
> > to select KEXEC only for ARM or S390 CRASH_DUMP. I plan to try the
> > reproducer later. If you have any idea or draft patch, please feel free
> > to post.
> 
> The thing is - before 6.6 even ARM did not require KEXEC for
> CRASH_DUMP (at least to successfully compile), so I think we should
> understand what changed first before adding a dependency for ARM. I'll
> try to investigate more, if I have time.

I did a cross compiling of arm on x86_64, it clearly requires KEXEC for
CRASH_DUMP if the select of KEXEC for CRASH_DUMP is removed and
CONFIG_KEXEC=n is set.

1) building error, only copy the first one:
==========================================
In file included from ../include/linux/ima.h:13,
                 from ../security/keys/key.c:16:
../include/linux/kexec.h:38:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
   38 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
      |  ^~~~~
../include/linux/kexec.h:42:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
   42 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
      |  ^~~~~
../include/linux/kexec.h:46:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
   46 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
      |  ^~~~~
../include/linux/kexec.h:54:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
   54 | #error KEXEC_CONTROL_PAGE_SIZE not defined
      |  ^~~~~
../include/linux/kexec.h:58:2: error: #error KEXEC_ARCH not defined
   58 | #error KEXEC_ARCH not defined
      |  ^~~~~
In file included from ../drivers/misc/pvpanic/pvpanic.c:13:

2) Kconfig items I enabled:
====
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_KEXEC is not set
CONFIG_CRASH_DUMP=y



3) KEXEC select is dropped so as not to enable KEXEC automatically:
=====
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 7aff28ded2f4..1cc3b1c595d7 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -97,7 +97,6 @@ config CRASH_DUMP
        depends on ARCH_SUPPORTS_KEXEC
        select CRASH_CORE
        select KEXEC_CORE
-       select KEXEC
        help
          Generate crash dump after being started by kexec.
          This should be normally only set in special crash dump kernels
> 
> > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > index 7aff28ded2f4..382dcd8d7a9d 100644
> > --- a/kernel/Kconfig.kexec
> > +++ b/kernel/Kconfig.kexec
> > @@ -97,7 +97,7 @@ config CRASH_DUMP
> >         depends on ARCH_SUPPORTS_KEXEC
> >         select CRASH_CORE
> >         select KEXEC_CORE
> > -       select KEXEC
> > +       select KEXEC if (ARM || S390)
> >
> >
> > arch/s390/Kconfig in kernel 6.1:
> > config CRASH_DUMP
> >         bool "kernel crash dumps"
> >         select KEXEC
> >         help
> >           Generate crash dump after being started by kexec.
> >           Crash dump kernels are loaded in the main kernel with kexec-tools
> >           into a specially reserved region and then later executed after
> >           a crash by kdump/kexec.
> >           Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
> >           This option also enables s390 zfcpdump.
> >           See also <file:Documentation/s390/zfcpdump.rst>
> >
> > >
> > > > > And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> > > > > CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> > > > > cpu/memory hotplug hapened.
> > > >
> > > > This still feels like a regression to me: any crash dump support
> > > > should be independent of KEXEC syscalls being present. While probably
> > > > the common case (including us) that the crashing kernel and recovery
> > > > kernel are the same, they don't have to be. We need kexec syscall in
> > > > the crashing kernel, but crashdump support in the recovery kernel (but
> > > > the recovery kernel not having the kexec syscalls should be totally
> > > > fine). If we do require some code definitions from kexec - at most we
> > > > should put them under CONFIG_KEXEC_CORE.
> > > >
> > > > > Thanks
> > > > > Baoquan
> > > > >
> > >
> > > Ignat
> > >
> >
> 


