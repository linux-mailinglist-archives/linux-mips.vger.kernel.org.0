Return-Path: <linux-mips+bounces-125-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A77F234F
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 02:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABDE41C216E9
	for <lists+linux-mips@lfdr.de>; Tue, 21 Nov 2023 01:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399C3847F;
	Tue, 21 Nov 2023 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h35Vxiqr"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46463DC
	for <linux-mips@vger.kernel.org>; Mon, 20 Nov 2023 17:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700531418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y3Q3tLM9OGu607uvr6IkvxoBRGupiz4hQd2uNEc6wxU=;
	b=h35Vxiqr1QITmJY7boN3uZO1bPYrOgJMJvd+9sbm8tZ47J8t72x9BolqdjlchhsEEzXaSc
	EHQogQThJQNIqpBk0/VXB0ZaDI4uYCrl9PlsKDeXcgjUBGrYP+Ig+TBcgrlk7CpaV7owwd
	Ptne/zjbqdKAgOgfQYItq3EcjBbF464=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-dGxeOKufP0OB-17nBSQkQA-1; Mon, 20 Nov 2023 20:50:15 -0500
X-MC-Unique: dGxeOKufP0OB-17nBSQkQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0F9811E7B;
	Tue, 21 Nov 2023 01:50:14 +0000 (UTC)
Received: from localhost (unknown [10.72.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2267D2026D4C;
	Tue, 21 Nov 2023 01:50:10 +0000 (UTC)
Date: Tue, 21 Nov 2023 09:50:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>, eric_devolder@yahoo.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, geert@linux-m68k.org,
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
Message-ID: <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Eric DeVolder's Oracle mail address is not available anymore, add his
current mail address he told me. 

On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
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

I searched the patch history, found Eric didn't add the dependency on
CONFIG_KEXEC at the beginning. Later a linux-next building failure with
randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency for
CRASH_DUMP. Please see below link for more details:

https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com/T/#u

And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
cpu/memory hotplug hapened.

Thanks
Baoquan


