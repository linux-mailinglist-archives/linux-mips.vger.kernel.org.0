Return-Path: <linux-mips+bounces-7473-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE2A13146
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 03:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4263A5D03
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 02:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E50913959D;
	Thu, 16 Jan 2025 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RekEOGit"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0628184D2B
	for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2025 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994016; cv=none; b=LGPJqUggiHvoV0orkgko8PR3heKydpqFdU6vdTZ6/iR2+azInxkmjnuTSpxMhG+IGy5fJbnQwSKDpZ976bFvcNSbic9y4pKopUFQLn6NJVJEF8wZQiuDrs/VUapPiydKtVdWln8CFp3CT2lXP+W+nlHS7pW1F7lW/+uqzRJ3ZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994016; c=relaxed/simple;
	bh=9gb7QjF+GFfB7j2TRVbz24JlCPtiQAv7ratwQxOb7pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwaUgS7kqxgEuKYU/NKoiOD5Xr+vjkJHUM66piHehqbn5oWUXM/jew2XQzsEmI462gSG5s2QWwLvIpliC52uU2I/Seat/ng2SAzChNPNPanKVRScY4FV4KzVK7kNu4RgqirUvoMnsUJZyb7ZyY2M9i7BfGTNZWHhZaUSI8LnhSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RekEOGit; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166022c5caso5562555ad.2
        for <linux-mips@vger.kernel.org>; Wed, 15 Jan 2025 18:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736994011; x=1737598811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ez3S9BXnTeu/QW+lwQ6ZtI7D1NAvy0HIyhXtiAEG7Sc=;
        b=RekEOGituqPYt8iw3xRto/2KU48y8GOB+h8IK6THHKLadbhEL5ZdXPJk07YVl4u8pM
         aw6C/V3k/asaPH0nJi0RopeJZHYm711O/0NOB8ekCO3qdddCiBRtWtG43V+2x/T0RrQR
         0pPNyIyA342ohR7DNrWlN7Mcx0zy4/qJfeBBm8m0VY2iaijrbaUKGu5bWF/AJn5ULhkR
         AUzj+OB0AiuVMkU0yHmwHkn/u2OjcSPLeMayCMH0EZaW3LvMlgZnbEY4VIm9YNvnIMCN
         WYDwIb61VV/9T95eL9gveRBXghTrUobOvcJBGXeGyyEPfwuSKaQZVHtEQqKKO925HTM9
         u0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736994011; x=1737598811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez3S9BXnTeu/QW+lwQ6ZtI7D1NAvy0HIyhXtiAEG7Sc=;
        b=Na+HvCBDjhy+q7fzhmQjSSwshzqx9kGdhJgNDezam/jES74swt0c0maG5rE4PO62Bn
         3LXUaygWYPohBJrWkFQ65CrG49JpGrvsEVZWhujbvDmmro9CyxtXykSGyoJO7FL1/aIA
         shU2VNMJGKGcwC3WYRjIlI4Qs3y18MMTzUCVExbxsfpT4LMTMQ0lWM/Qw8R7rKuDMSh+
         nBFTy4cA5LMiK/2R+yEgWRUFhKPDb52WaxlrpjVOtf7o7jxNu21UvV6I6gefR6JGI8qo
         576FQ63PbjA8M4HVhXDyh2Vo14cz3Yrp3vfFYVI4/tHchl01AMVtRHSyvXstNzSXxLGo
         ARBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNAqijgGPbFeDCin+XJUhqXTYqYEWlhvHYGvxjOhk/5H5AckMrMEuI0fAGGQHy4gkClXRvbI6bff96@vger.kernel.org
X-Gm-Message-State: AOJu0YxMOz0THptxp0W5VaUSqSVQPSih0OYfCNxhmag5DZhzwy/J/2z5
	0l9G0V/sZy+RpS8mAkO7qnFxaWy8MXVFMHGGsRmnd2bTX0KFksNdU593OFdvMDw=
X-Gm-Gg: ASbGnctbgaakt5g77qMakG6x1V5Cn8UFqjNpaGAp88l8Nyj66pP/yQ/Ha28FVKYHmfG
	x8neSZRZdtoZGVguTqS7rEAc44k0qX2A5FBJhwqo3eP97I4EKxjt6RHwWrUkL3c+z0UexNWHa+u
	Tlc9+3cVjTYa47ScoEH5uTifagnNkdPR9u6IUMnqct6KBw5LG8o9ul6pIg1rtMDCMMphO9j7GQS
	1oLsx/Fq1OqNVVAJn9CzK/gFt0bAeLnxuRQj8xgW3y5HUI=
X-Google-Smtp-Source: AGHT+IFMVXcsYTJs5LI0mvqNS9vcwNoD1sbBAmqyv2cZCrxZUvkWb/4+Cn54eOS/mb4G9hsClnEasg==
X-Received: by 2002:a17:903:2308:b0:216:779a:d5f3 with SMTP id d9443c01a7336-21a83f546c3mr533804055ad.14.1736994011120;
        Wed, 15 Jan 2025 18:20:11 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f137eccsm89435765ad.95.2025.01.15.18.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 18:20:10 -0800 (PST)
Date: Wed, 15 Jan 2025 18:20:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
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
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 4/7] syscall.h: introduce syscall_set_nr()
Message-ID: <Z4hs1ao9I-Q1u6MT@ghost>
References: <20250113170925.GA392@strace.io>
 <20250113171150.GD589@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113171150.GD589@strace.io>

On Mon, Jan 13, 2025 at 07:11:51PM +0200, Dmitry V. Levin wrote:
> Similar to syscall_set_arguments() that complements
> syscall_get_arguments(), introduce syscall_set_nr()
> that complements syscall_get_nr().
> 
> syscall_set_nr() is going to be needed along with
> syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
> architectures to implement PTRACE_SET_SYSCALL_INFO API.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
>  arch/arc/include/asm/syscall.h        | 11 +++++++++++
>  arch/arm/include/asm/syscall.h        | 24 ++++++++++++++++++++++++
>  arch/arm64/include/asm/syscall.h      | 16 ++++++++++++++++
>  arch/hexagon/include/asm/syscall.h    |  7 +++++++
>  arch/loongarch/include/asm/syscall.h  |  7 +++++++
>  arch/m68k/include/asm/syscall.h       |  7 +++++++
>  arch/microblaze/include/asm/syscall.h |  7 +++++++
>  arch/mips/include/asm/syscall.h       | 14 ++++++++++++++
>  arch/nios2/include/asm/syscall.h      |  5 +++++
>  arch/openrisc/include/asm/syscall.h   |  6 ++++++
>  arch/parisc/include/asm/syscall.h     |  7 +++++++
>  arch/powerpc/include/asm/syscall.h    | 10 ++++++++++
>  arch/riscv/include/asm/syscall.h      |  7 +++++++
>  arch/s390/include/asm/syscall.h       | 12 ++++++++++++
>  arch/sh/include/asm/syscall_32.h      | 12 ++++++++++++
>  arch/sparc/include/asm/syscall.h      | 12 ++++++++++++
>  arch/um/include/asm/syscall-generic.h |  5 +++++
>  arch/x86/include/asm/syscall.h        |  7 +++++++
>  arch/xtensa/include/asm/syscall.h     |  7 +++++++
>  include/asm-generic/syscall.h         | 14 ++++++++++++++
>  20 files changed, 197 insertions(+)
> 
> diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
> index 89c1e1736356..728d625a10f1 100644
> --- a/arch/arc/include/asm/syscall.h
> +++ b/arch/arc/include/asm/syscall.h
> @@ -23,6 +23,17 @@ syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  		return -1;
>  }
>  
> +static inline void
> +syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> +{
> +	/*
> +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> +	 * the target task is stopped for tracing on entering syscall, so
> +	 * there is no need to have the same check syscall_get_nr() has.
> +	 */
> +	regs->r8 = nr;
> +}
> +
>  static inline void
>  syscall_rollback(struct task_struct *task, struct pt_regs *regs)
>  {
> diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
> index 21927fa0ae2b..18b102a30741 100644
> --- a/arch/arm/include/asm/syscall.h
> +++ b/arch/arm/include/asm/syscall.h
> @@ -68,6 +68,30 @@ static inline void syscall_set_return_value(struct task_struct *task,
>  	regs->ARM_r0 = (long) error ? error : val;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	if (nr == -1) {
> +		task_thread_info(task)->abi_syscall = -1;
> +		/*
> +		 * When the syscall number is set to -1, the syscall will be
> +		 * skipped.  In this case the syscall return value has to be
> +		 * set explicitly, otherwise the first syscall argument is
> +		 * returned as the syscall return value.
> +		 */
> +		syscall_set_return_value(task, regs, -ENOSYS, 0);
> +		return;
> +	}
> +	if ((IS_ENABLED(CONFIG_AEABI) && !IS_ENABLED(CONFIG_OABI_COMPAT))) {
> +		task_thread_info(task)->abi_syscall = nr;
> +		return;
> +	}
> +	task_thread_info(task)->abi_syscall =
> +		(task_thread_info(task)->abi_syscall & ~__NR_SYSCALL_MASK) |
> +		(nr & __NR_SYSCALL_MASK);
> +}
> +
>  #define SYSCALL_MAX_ARGS 7
>  
>  static inline void syscall_get_arguments(struct task_struct *task,
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 76020b66286b..712daa90e643 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -61,6 +61,22 @@ static inline void syscall_set_return_value(struct task_struct *task,
>  	regs->regs[0] = val;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->syscallno = nr;
> +	if (nr == -1) {
> +		/*
> +		 * When the syscall number is set to -1, the syscall will be
> +		 * skipped.  In this case the syscall return value has to be
> +		 * set explicitly, otherwise the first syscall argument is
> +		 * returned as the syscall return value.
> +		 */
> +		syscall_set_return_value(task, regs, -ENOSYS, 0);
> +	}
> +}
> +
>  #define SYSCALL_MAX_ARGS 6
>  
>  static inline void syscall_get_arguments(struct task_struct *task,
> diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
> index 1024a6548d78..70637261817a 100644
> --- a/arch/hexagon/include/asm/syscall.h
> +++ b/arch/hexagon/include/asm/syscall.h
> @@ -26,6 +26,13 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return regs->r06;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->r06 = nr;
> +}
> +
>  static inline void syscall_get_arguments(struct task_struct *task,
>  					 struct pt_regs *regs,
>  					 unsigned long *args)
> diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
> index ff415b3c0a8e..81d2733f7b94 100644
> --- a/arch/loongarch/include/asm/syscall.h
> +++ b/arch/loongarch/include/asm/syscall.h
> @@ -26,6 +26,13 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return regs->regs[11];
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->regs[11] = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
> index d1453e850cdd..bf84b160c2eb 100644
> --- a/arch/m68k/include/asm/syscall.h
> +++ b/arch/m68k/include/asm/syscall.h
> @@ -14,6 +14,13 @@ static inline int syscall_get_nr(struct task_struct *task,
>  	return regs->orig_d0;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->orig_d0 = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/microblaze/include/asm/syscall.h b/arch/microblaze/include/asm/syscall.h
> index 5eb3f624cc59..b5b6b91fae3e 100644
> --- a/arch/microblaze/include/asm/syscall.h
> +++ b/arch/microblaze/include/asm/syscall.h
> @@ -14,6 +14,13 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return regs->r12;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->r12 = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index 3163d1506fae..58d68205fd2c 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -41,6 +41,20 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return task_thread_info(task)->syscall;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	/*
> +	 * New syscall number has to be assigned to regs[2] because
> +	 * syscall_trace_entry() loads it from there unconditionally.
> +	 *
> +	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
> +	 * then after this assignment the syscall will cease to be indirect.
> +	 */
> +	task_thread_info(task)->syscall = regs->regs[2] = nr;
> +}
> +
>  static inline void mips_syscall_update_nr(struct task_struct *task,
>  					  struct pt_regs *regs)
>  {
> diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
> index 526449edd768..8e3eb1d689bb 100644
> --- a/arch/nios2/include/asm/syscall.h
> +++ b/arch/nios2/include/asm/syscall.h
> @@ -15,6 +15,11 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  	return regs->r2;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> +{
> +	regs->r2 = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				struct pt_regs *regs)
>  {
> diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
> index e6383be2a195..5e037d9659c5 100644
> --- a/arch/openrisc/include/asm/syscall.h
> +++ b/arch/openrisc/include/asm/syscall.h
> @@ -25,6 +25,12 @@ syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  	return regs->orig_gpr11;
>  }
>  
> +static inline void
> +syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> +{
> +	regs->orig_gpr11 = nr;
> +}
> +
>  static inline void
>  syscall_rollback(struct task_struct *task, struct pt_regs *regs)
>  {
> diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
> index b146d0ae4c77..c11222798ab2 100644
> --- a/arch/parisc/include/asm/syscall.h
> +++ b/arch/parisc/include/asm/syscall.h
> @@ -17,6 +17,13 @@ static inline long syscall_get_nr(struct task_struct *tsk,
>  	return regs->gr[20];
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *tsk,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->gr[20] = nr;
> +}
> +
>  static inline void syscall_get_arguments(struct task_struct *tsk,
>  					 struct pt_regs *regs,
>  					 unsigned long *args)
> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index 521f279e6b33..7505dcfed247 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -39,6 +39,16 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  		return -1;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> +{
> +	/*
> +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> +	 * the target task is stopped for tracing on entering syscall, so
> +	 * there is no need to have the same check syscall_get_nr() has.
> +	 */
> +	regs->gpr[0] = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8d389ba995c8..a5281cdf2b10 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -30,6 +30,13 @@ static inline int syscall_get_nr(struct task_struct *task,
>  	return regs->a7;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->a7 = nr;
> +}

Looks good for riscv.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
> index b3dd883699e7..12cd0c60c07b 100644
> --- a/arch/s390/include/asm/syscall.h
> +++ b/arch/s390/include/asm/syscall.h
> @@ -24,6 +24,18 @@ static inline long syscall_get_nr(struct task_struct *task,
>  		(regs->int_code & 0xffff) : -1;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	/*
> +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> +	 * the target task is stopped for tracing on entering syscall, so
> +	 * there is no need to have the same check syscall_get_nr() has.
> +	 */
> +	regs->int_code = (regs->int_code & ~0xffff) | (nr & 0xffff);
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
> index cb51a7528384..7027d87d901d 100644
> --- a/arch/sh/include/asm/syscall_32.h
> +++ b/arch/sh/include/asm/syscall_32.h
> @@ -15,6 +15,18 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return (regs->tra >= 0) ? regs->regs[3] : -1L;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	/*
> +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> +	 * the target task is stopped for tracing on entering syscall, so
> +	 * there is no need to have the same check syscall_get_nr() has.
> +	 */
> +	regs->regs[3] = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
> index 62a5a78804c4..b0233924d323 100644
> --- a/arch/sparc/include/asm/syscall.h
> +++ b/arch/sparc/include/asm/syscall.h
> @@ -25,6 +25,18 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return (syscall_p ? regs->u_regs[UREG_G1] : -1L);
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	/*
> +	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
> +	 * the target task is stopped for tracing on entering syscall, so
> +	 * there is no need to have the same check syscall_get_nr() has.
> +	 */
> +	regs->u_regs[UREG_G1] = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
> index 2984feb9d576..bcd73bcfe577 100644
> --- a/arch/um/include/asm/syscall-generic.h
> +++ b/arch/um/include/asm/syscall-generic.h
> @@ -21,6 +21,11 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  	return PT_REGS_SYSCALL_NR(regs);
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
> +{
> +	PT_REGS_SYSCALL_NR(regs) = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
> index b9c249dd9e3d..c10dbb74cd00 100644
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -38,6 +38,13 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
>  	return regs->orig_ax;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->orig_ax = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
> index f9a671cbf933..7db3b489c8ad 100644
> --- a/arch/xtensa/include/asm/syscall.h
> +++ b/arch/xtensa/include/asm/syscall.h
> @@ -28,6 +28,13 @@ static inline long syscall_get_nr(struct task_struct *task,
>  	return regs->syscall;
>  }
>  
> +static inline void syscall_set_nr(struct task_struct *task,
> +				  struct pt_regs *regs,
> +				  int nr)
> +{
> +	regs->syscall = nr;
> +}
> +
>  static inline void syscall_rollback(struct task_struct *task,
>  				    struct pt_regs *regs)
>  {
> diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
> index 0f7b9a493de7..e33fd4e783c1 100644
> --- a/include/asm-generic/syscall.h
> +++ b/include/asm-generic/syscall.h
> @@ -37,6 +37,20 @@ struct pt_regs;
>   */
>  int syscall_get_nr(struct task_struct *task, struct pt_regs *regs);
>  
> +/**
> + * syscall_set_nr - change the system call a task is executing
> + * @task:	task of interest, must be blocked
> + * @regs:	task_pt_regs() of @task
> + * @nr:		system call number
> + *
> + * Changes the system call number @task is about to execute.
> + *
> + * It's only valid to call this when @task is stopped for tracing on
> + * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
> + * %SYSCALL_WORK_SYSCALL_AUDIT.
> + */
> +void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr);
> +
>  /**
>   * syscall_rollback - roll back registers after an aborted system call
>   * @task:	task of interest, must be in system call exit tracing
> -- 
> ldv

