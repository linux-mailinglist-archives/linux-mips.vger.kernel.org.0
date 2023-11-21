Return-Path: <linux-mips+bounces-124-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E07F22D6
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 02:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3442813B3
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 01:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319751C04;
	Tue, 21 Nov 2023 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="oWW1QkZz"
X-Original-To: linux-mips@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83F1BC;
	Mon, 20 Nov 2023 17:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700528778;
	bh=a1oDztLoqCcees2awcLjiaomu8bb0ZU8fyFhFCJHT4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oWW1QkZze+kq8dXCMwzP9xmtsiBPKW/hq5HCmqkQq67lD/f/fkTpd/U8FMenAoeLl
	 J1jHM3vpiqO6+SZ8oTRmtfdXJh/kl4ccKcHX93lWk6Fma5jYDgW+qHGJ9G1c3wWEWD
	 7wf1DanMy/hBgRK5n8rOjbSflcR7GKDrM1MFeaKqqOQQlvcOByEoS81ZnH8kRCiVRW
	 Sitlo5WEKfvTkyRjxvm6DcVAjGDg3Q0vGj0AeAoNLiUIP8cnYZXsQFMSjypuMtAUTc
	 2SzMvY2J7oKCYA9k2z45igYP3WpwqyzkKDLwx57xpFYnZrXJC9CTNoEySocvsKn9xW
	 xnByzdpmU0vWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ5mB3sycz4wd7;
	Tue, 21 Nov 2023 12:06:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ignat Korchagin <ignat@cloudflare.com>, eric.devolder@oracle.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de,
 ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dave.hansen@linux.intel.com,
 x86@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, kernel@xen0n.name,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org,
 paulmck@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 frederic@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ard
 Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
 juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk,
 linus.walleij@linaro.org, sebastian.reichel@collabora.com,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 anshuman.khandual@arm.com, ziy@nvidia.com, masahiroy@kernel.org,
 ndesaulniers@google.com, mhiramat@kernel.org, ojeda@kernel.org,
 thunder.leizhen@huawei.com, xin3.li@intel.com, tj@kernel.org, Greg KH
 <gregkh@linuxfoundation.org>, tsi@tuyoix.net, bhe@redhat.com,
 hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, kernel-team
 <kernel-team@cloudflare.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
In-Reply-To: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
Date: Tue, 21 Nov 2023 12:05:59 +1100
Message-ID: <87y1er6hl4.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ignat Korchagin <ignat@cloudflare.com> writes:
> Good day!
>
> We have recently started to evaluate Linux 6.6 and noticed that we
> cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> enabled. It seems to be related to commit 89cde455 ("kexec:
> consolidate kexec and crash options into kernel/Kconfig.kexec"), where
> a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
>
> In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> with enforced signature check to support the kernel crash dumping
> functionality and would like to keep CONFIG_KEXEC disabled for
> security reasons [1].
>
> I was reading the long commit message, but the reason for adding
> CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> believe from the implementation perspective CONFIG_KEXEC_FILE should
> suffice here (as we successfully used it for crashdumps on Linux 6.1).
>
> Is there a reason for adding this dependency or is it just an
> oversight? Would some solution of requiring either CONFIG_KEXEC or
> CONFIG_KEXEC_FILE work here?

I don't actually see any reason for CRASH_DUMP to depend on KEXEC or
KEXEC_FILE.

None of the old CRASH_DUMP symbols depended on KEXEC AFAICS. Using
something like:

 $ git diff 89cde455..95d1fef5 | grep -A 3 "^-.*config CRASH_DUMP"

It's reasonable to want to build a kernel that supports CRASH_DUMP (ie.
can be a dump kernel), but doesn't support kexec and requires a regular
reboot. Though I doubt anyone does that in practice?

cheers

