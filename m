Return-Path: <linux-mips+bounces-7472-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F8A1313E
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 03:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA9B7A22AC
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 02:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6402A8635B;
	Thu, 16 Jan 2025 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="enh1Crvi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391B5FDA7
	for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2025 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994013; cv=none; b=h+fDmEWVu2rXb90XaVNwDBxE01QqRQvAvYBai/N2PYDpC7yheZIgCpnTBqI14twrJ99Z9J8FkHwzgc9r6qEqJ2FKQDGprRKzOVW3XqoPh6+fYbTO4n2/tyfA4+sR5zn+j0SDt5D4uVNuV/ztqwDx1a1SSG/39oNaKWEFXI4Ot1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994013; c=relaxed/simple;
	bh=Pw15srYt8+MWpPPmoJehL4juw0VEUT4PG0GHz5BjmNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gke76x08ZXS7Qn6jpS1zAusR5mOa9oCoG0fQ+rVMWG8bKSuV1Pqk4nfZhMc4lWkAvax6M03U9ZUo0MUJy8wUwly1QaEMTJ4Kr3NUX6Zh/F+efjurWJYQBmW/nCdNIjGplXMY+Fxk8ngX3gJeooZwgWLu3QZE+nHQ2c+srHKuzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=enh1Crvi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21634338cfdso8353975ad.2
        for <linux-mips@vger.kernel.org>; Wed, 15 Jan 2025 18:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736994007; x=1737598807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fSeCZdQhm9gsDo9x4mCdX/gIYtNCLSrunBW4bVeNiY=;
        b=enh1Crvi/U/8D94HiIy8EOsPhA9jJJzbvbNPaj9FLQosrv0nK7D703B6JLAKsYinkB
         wKIzltTWFeX24/OD87iEFIx2GGVNmF6MIDvBBQS5WOAUiGT7lIroJ9JYnhZZ78x5xFcu
         grHe37dZRCDmGbIq3ah3vHTplo5kUovuKI+/DN3jG5ISIhdiN4ExtvHQVvnxcQE9pbHf
         BwPnOYbdpqk6/3w7bujAhoBYcshZtY9v0NSf7rhX/+2fD79namA163YeFXLGcTkbNsu+
         EXu30vMkXZSCO4a+vR3rDBAmdJCUc6dBvLinCJ1Et/JvLhgDqbcLS3SVVnSAhKxp350J
         GduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736994007; x=1737598807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fSeCZdQhm9gsDo9x4mCdX/gIYtNCLSrunBW4bVeNiY=;
        b=dX7I1WS+73HJTJPYjmNa420uIl50KW4SkC3H9GJ49JIs2RgXqMN8U9Ohq4n0QxU8f8
         HdFYep8B9SLmDypzSyD8RNhdnLfOeeaxHHxi2mVElz7QXkg+dyYXGAJrAOTbW+KfTHOi
         CmUXluaY/ogkij/QbEr1QECPt8T754uD9IqfwVSUdqL57Gx7e1xbGQWKG8Si89/SoB/m
         e8bmTyNZRW2l6ImLlVa/3PhfML4PNieC48jcE6MyqcJvLu49dfsJrScxIbuFz4P3shW6
         sEJxb6AeSA8jVArwvEuEH4j9kwOhtgey6ivNXgBNhsIwyAqnZx6dRQDyPE4zXvQXZ5/E
         50oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzBG97z7W1UaiKtTyAfodMYgy7OZAwcD7qfW4UTDO0cJSiwxR4uG7lO3rktUNOIUU+sSuJuE73rS1n@vger.kernel.org
X-Gm-Message-State: AOJu0YyqsOj/S/lgi4f/uxXq70FIDNViYF1QfwXvPf3S3eK0dCTPn3Gw
	yLywA59FPBiOkxqInoZPfIVNir15effwdhIOQZCs3mYOpzr6W2NQOWIyGQE2kls=
X-Gm-Gg: ASbGnct8FdPipD30IGk9JMmbD6QFHLN9I3Q7Iw3Ot3U1K2vD6WA4u/dKS1O7xGIbgP1
	T4jk27pObpSKFqXVy/6jyuIRMukg5ZKRgqtb1RhsOodxirz3PL/XfYlGX7rIX0DV6NOvCcHnoUI
	+JPnvNqaKfqAzgUA/LGL7rGmH2Ii2rNjuFvorJd6yLp8uHaCr6F5lODgZzEBYO6twLVwq9K9JTD
	Y0p9jBAxWVFMsohJEAChXjOQGdEsErNBoIzSOwaqyvtxaA=
X-Google-Smtp-Source: AGHT+IG2iJViDjIXN/MIil+T+MrVrX+exq0uA4y6qY7j2BWAir2l1c6Zqr9kSueuyp3qmDsRK279Sw==
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr485898695ad.35.1736994006875;
        Wed, 15 Jan 2025 18:20:06 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10def6sm89028935ad.38.2025.01.15.18.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 18:20:06 -0800 (PST)
Date: Wed, 15 Jan 2025 18:20:01 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 3/7] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
Message-ID: <Z4hs0X8RhGTuevnn@ghost>
References: <20250113170925.GA392@strace.io>
 <20250113171140.GC589@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113171140.GC589@strace.io>

On Mon, Jan 13, 2025 at 07:11:40PM +0200, Dmitry V. Levin wrote:
> These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
> 
> This partially reverts commit 7962c2eddbfe ("arch: remove unused
> function syscall_set_arguments()") by reusing some of old
> syscall_set_arguments() implementations.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
> 
> Note that I'm not a MIPS expert, I just added mips_set_syscall_arg() by
> looking at mips_get_syscall_arg() and the result passes tests in qemu on
> mips O32, mips64 O32, mips64 N32, and mips64 N64.
> 
>  arch/arc/include/asm/syscall.h        | 14 +++++++++++
>  arch/arm/include/asm/syscall.h        | 13 ++++++++++
>  arch/arm64/include/asm/syscall.h      | 13 ++++++++++
>  arch/csky/include/asm/syscall.h       | 13 ++++++++++
>  arch/hexagon/include/asm/syscall.h    | 14 +++++++++++
>  arch/loongarch/include/asm/syscall.h  |  8 ++++++
>  arch/mips/include/asm/syscall.h       | 32 ++++++++++++++++++++++++
>  arch/nios2/include/asm/syscall.h      | 11 ++++++++
>  arch/openrisc/include/asm/syscall.h   |  7 ++++++
>  arch/parisc/include/asm/syscall.h     | 12 +++++++++
>  arch/powerpc/include/asm/syscall.h    | 10 ++++++++
>  arch/riscv/include/asm/syscall.h      |  9 +++++++
>  arch/s390/include/asm/syscall.h       | 12 +++++++++
>  arch/sh/include/asm/syscall_32.h      | 12 +++++++++
>  arch/sparc/include/asm/syscall.h      | 10 ++++++++
>  arch/um/include/asm/syscall-generic.h | 14 +++++++++++
>  arch/x86/include/asm/syscall.h        | 36 +++++++++++++++++++++++++++
>  arch/xtensa/include/asm/syscall.h     | 11 ++++++++
>  include/asm-generic/syscall.h         | 16 ++++++++++++
>  19 files changed, 267 insertions(+)
> 
> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
> index 9709256e31c8..89c1e1736356 100644
> --- a/arch/arc/include/asm/syscall.h
> +++ b/arch/arc/include/asm/syscall.h
> @@ -67,6 +67,20 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	}
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      unsigned long *args)
> +{
> +	unsigned long *inside_ptregs = &regs->r0;
> +	unsigned int n = 6;
> +	unsigned int i = 0;
> +
> +	while (n--) {
> +		*inside_ptregs = args[i++];
> +		inside_ptregs--;
> +	}
> +}
> +
>  static inline int
>  syscall_get_arch(struct task_struct *task)
>  {
> diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
> index fe4326d938c1..21927fa0ae2b 100644
> --- a/arch/arm/include/asm/syscall.h
> +++ b/arch/arm/include/asm/syscall.h
> @@ -80,6 +80,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->ARM_r0 + 1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->ARM_r0, args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into ARM_ORIG_r0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->ARM_ORIG_r0 = regs->ARM_r0;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	/* ARM tasks don't change audit architectures on the fly. */
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index ab8e14b96f68..76020b66286b 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -73,6 +73,19 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->regs[0], args, 6 * sizeof(args[0]));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_x0 = regs->regs[0];
> +}
> +
>  /*
>   * We don't care about endianness (__AUDIT_ARCH_LE bit) here because
>   * AArch64 has the same system calls both on little- and big- endian.
> diff --git a/arch/csky/include/asm/syscall.h b/arch/csky/include/asm/syscall.h
> index 0de5734950bf..30403f7a0487 100644
> --- a/arch/csky/include/asm/syscall.h
> +++ b/arch/csky/include/asm/syscall.h
> @@ -59,6 +59,19 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->a0, args, 6 * sizeof(regs->a0));
> +	/*
> +	 * Also copy the first argument into orig_x0
> +	 * so that syscall_get_arguments() would return it
> +	 * instead of the previous value.
> +	 */
> +	regs->orig_a0 = regs->a0;
> +}
> +
>  static inline int
>  syscall_get_arch(struct task_struct *task)
>  {
> diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
> index f6e454f18038..1024a6548d78 100644
> --- a/arch/hexagon/include/asm/syscall.h
> +++ b/arch/hexagon/include/asm/syscall.h
> @@ -33,6 +33,13 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &(&regs->r00)[0], 6 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	memcpy(&(&regs->r00)[0], args, 6 * sizeof(args[0]));
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> @@ -45,6 +52,13 @@ static inline long syscall_get_return_value(struct task_struct *task,
>  	return regs->r00;
>  }
>  
> +static inline void syscall_set_return_value(struct task_struct *task,
> +					    struct pt_regs *regs,
> +					    int error, long val)
> +{
> +	regs->r00 = (long) error ?: val;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_HEXAGON;
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
> index e286dc58476e..ff415b3c0a8e 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -61,6 +61,14 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(&args[1], &regs->regs[5], 5 * sizeof(long));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	memcpy(&regs->regs[5], &args[1], 5 * sizeof(long));
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_LOONGARCH64;
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index 2f85f2d8f754..3163d1506fae 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -76,6 +76,23 @@ static inline void mips_get_syscall_arg(unsigned long *arg,
>  #endif
>  }
>  
> +static inline void mips_set_syscall_arg(unsigned long *arg,
> +	struct task_struct *task, struct pt_regs *regs, unsigned int n)
> +{
> +#ifdef CONFIG_32BIT
> +	switch (n) {
> +	case 0: case 1: case 2: case 3:
> +		regs->regs[4 + n] = *arg;
> +		return;
> +	case 4: case 5: case 6: case 7:
> +		*arg = regs->pad0[n] = *arg;
> +		return;
> +	}
> +#else
> +	regs->regs[4 + n] = *arg;
> +#endif
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> @@ -122,6 +139,21 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  		mips_get_syscall_arg(args++, task, regs, i++);
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	unsigned int i = 0;
> +	unsigned int n = 6;
> +
> +	/* O32 ABI syscall() */
> +	if (mips_syscall_is_indirect(task, regs))
> +		i++;
> +
> +	while (n--)
> +		mips_set_syscall_arg(args++, task, regs, i++);
> +}
> +
>  extern const unsigned long sys_call_table[];
>  extern const unsigned long sys32_call_table[];
>  extern const unsigned long sysn32_call_table[];
> diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
> index fff52205fb65..526449edd768 100644
> --- a/arch/nios2/include/asm/syscall.h
> +++ b/arch/nios2/include/asm/syscall.h
> @@ -58,6 +58,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	*args   = regs->r9;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +	struct pt_regs *regs, const unsigned long *args)
> +{
> +	regs->r4 = *args++;
> +	regs->r5 = *args++;
> +	regs->r6 = *args++;
> +	regs->r7 = *args++;
> +	regs->r8 = *args++;
> +	regs->r9 = *args;
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_NIOS2;
> diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
> index 903ed882bdec..e6383be2a195 100644
> --- a/arch/openrisc/include/asm/syscall.h
> +++ b/arch/openrisc/include/asm/syscall.h
> @@ -57,6 +57,13 @@ syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  	memcpy(args, &regs->gpr[3], 6 * sizeof(args[0]));
>  }
>  
> +static inline void
> +syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +		      const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_OPENRISC;
> diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
> index 00b127a5e09b..b146d0ae4c77 100644
> --- a/arch/parisc/include/asm/syscall.h
> +++ b/arch/parisc/include/asm/syscall.h
> @@ -29,6 +29,18 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
>  	args[0] = regs->gr[26];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *tsk,
> +					 struct pt_regs *regs,
> +					 unsigned long *args)
> +{
> +	regs->gr[21] = args[5];
> +	regs->gr[22] = args[4];
> +	regs->gr[23] = args[3];
> +	regs->gr[24] = args[2];
> +	regs->gr[25] = args[1];
> +	regs->gr[26] = args[0];
> +}
> +
>  static inline long syscall_get_error(struct task_struct *task,
>  				     struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 422d7735ace6..521f279e6b33 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -114,6 +114,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	memcpy(&regs->gpr[3], args, 6 * sizeof(args[0]));
> +
> +	/* Also copy the first argument into orig_gpr3 */
> +	regs->orig_gpr3 = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	if (is_tsk_32bit_task(task))
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce..8d389ba995c8 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -66,6 +66,15 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->orig_a0 = args[0];
> +	args++;
> +	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> +}

Looks good for riscv.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com

> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #ifdef CONFIG_64BIT
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index 27e3d804b311..b3dd883699e7 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -78,6 +78,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[0] = regs->orig_gpr2 & mask;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int n = 6;
> +
> +	while (n-- > 0)
> +		if (n > 0)
> +			regs->gprs[2 + n] = args[n];
> +	regs->orig_gpr2 = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #ifdef CONFIG_COMPAT
> diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
> index d87738eebe30..cb51a7528384 100644
> --- a/arch/sh/include/asm/syscall_32.h
> +++ b/arch/sh/include/asm/syscall_32.h
> @@ -57,6 +57,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[0] = regs->regs[4];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->regs[1] = args[5];
> +	regs->regs[0] = args[4];
> +	regs->regs[7] = args[3];
> +	regs->regs[6] = args[2];
> +	regs->regs[5] = args[1];
> +	regs->regs[4] = args[0];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	int arch = AUDIT_ARCH_SH;
> diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
> index 20c109ac8cc9..62a5a78804c4 100644
> --- a/arch/sparc/include/asm/syscall.h
> +++ b/arch/sparc/include/asm/syscall.h
> @@ -117,6 +117,16 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; i++)
> +		regs->u_regs[UREG_I0 + i] = args[i];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  #if defined(CONFIG_SPARC64) && defined(CONFIG_COMPAT)
> diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
> index 172b74143c4b..2984feb9d576 100644
> --- a/arch/um/include/asm/syscall-generic.h
> +++ b/arch/um/include/asm/syscall-generic.h
> @@ -62,6 +62,20 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	*args   = UPT_SYSCALL_ARG6(r);
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	struct uml_pt_regs *r = &regs->regs;
> +
> +	UPT_SYSCALL_ARG1(r) = *args++;
> +	UPT_SYSCALL_ARG2(r) = *args++;
> +	UPT_SYSCALL_ARG3(r) = *args++;
> +	UPT_SYSCALL_ARG4(r) = *args++;
> +	UPT_SYSCALL_ARG5(r) = *args++;
> +	UPT_SYSCALL_ARG6(r) = *args;
> +}
> +
>  /* See arch/x86/um/asm/syscall.h for syscall_get_arch() definition. */
>  
>  #endif	/* __UM_SYSCALL_GENERIC_H */
> diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
> index 7c488ff0c764..b9c249dd9e3d 100644
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -90,6 +90,18 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	args[5] = regs->bp;
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	regs->bx = args[0];
> +	regs->cx = args[1];
> +	regs->dx = args[2];
> +	regs->si = args[3];
> +	regs->di = args[4];
> +	regs->bp = args[5];
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	return AUDIT_ARCH_I386;
> @@ -121,6 +133,30 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	}
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +# ifdef CONFIG_IA32_EMULATION
> +	if (task->thread_info.status & TS_COMPAT) {
> +		regs->bx = *args++;
> +		regs->cx = *args++;
> +		regs->dx = *args++;
> +		regs->si = *args++;
> +		regs->di = *args++;
> +		regs->bp = *args;
> +	} else
> +# endif
> +	{
> +		regs->di = *args++;
> +		regs->si = *args++;
> +		regs->dx = *args++;
> +		regs->r10 = *args++;
> +		regs->r8 = *args++;
> +		regs->r9 = *args;
> +	}
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>  	/* x32 tasks should be considered AUDIT_ARCH_X86_64. */
> diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
> index 5ee974bf8330..f9a671cbf933 100644
> --- a/arch/xtensa/include/asm/syscall.h
> +++ b/arch/xtensa/include/asm/syscall.h
> @@ -68,6 +68,17 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  		args[i] = regs->areg[reg[i]];
>  }
>  
> +static inline void syscall_set_arguments(struct task_struct *task,
> +					 struct pt_regs *regs,
> +					 const unsigned long *args)
> +{
> +	static const unsigned int reg[] = XTENSA_SYSCALL_ARGUMENT_REGS;
> +	unsigned int i;
> +
> +	for (i = 0; i < 6; ++i)
> +		regs->areg[reg[i]] = args[i];
> +}
> +
>  asmlinkage long xtensa_rt_sigreturn(void);
>  asmlinkage long xtensa_shmat(int, char __user *, int);
>  asmlinkage long xtensa_fadvise64_64(int, int,
> diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
> index 5a80fe728dc8..0f7b9a493de7 100644
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -117,6 +117,22 @@ void syscall_set_return_value(struct task_struct *task, struct pt_regs *regs,
>  void syscall_get_arguments(struct task_struct *task, struct pt_regs *regs,
>  			   unsigned long *args);
>  
> +/**
> + * syscall_set_arguments - change system call parameter value
> + * @task:	task of interest, must be in system call entry tracing
> + * @regs:	task_pt_regs() of @task
> + * @args:	array of argument values to store
> + *
> + * Changes 6 arguments to the system call.
> + * The first argument gets value @args[0], and so on.
> + *
> + * It's only valid to call this when @task is stopped for tracing on
> + * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
> + * %SYSCALL_WORK_SYSCALL_AUDIT.
> + */
> +void syscall_set_arguments(struct task_struct *task, struct pt_regs *regs,
> +			   const unsigned long *args);
> +
>  /**
>   * syscall_get_arch - return the AUDIT_ARCH for the current system call
>   * @task:	task of interest, must be blocked
> -- 
> ldv

