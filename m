Return-Path: <linux-mips+bounces-7402-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC91A0A46A
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 16:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69A31645E4
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 15:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F71F1B0401;
	Sat, 11 Jan 2025 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="kdbW+UTT"
X-Original-To: linux-mips@vger.kernel.org
Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F618FDBA;
	Sat, 11 Jan 2025 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736610291; cv=none; b=eJC+/VtcEFnSe2iQ8PGIZA0EZiLBt9Gi3kz5zFPq1+Ym51QvvW2EI4RqdvAiidKhN8EeF+8+bzkhJ2DhQjHs4zgPfUz4FuO01GD0nDnNUPyMYcUOIVKaDjHuoVRKgYRUebM4mnpjzaFujw86liQa1gYsK6XWSBT7gDQyUHc5wnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736610291; c=relaxed/simple;
	bh=wz0cIUskTSsORfuW7AelHIrC07d+NBdKGJT/4C7eJN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpStL2hGXNIA6gm9S8m9/6FiWVEbGMu5u14qTODbNt7bjIsKCGS6uQ3/9FF0IwKSWM/rmEgbjunnMWABBuip2Q3m3PCAukrr1pW8AbRZfadBRqFdW6NJ0PpYgVYkak5hE98tmx+4ddlrMX+ijwRo9E0vxf4nTILt0jyFhzVlymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=kdbW+UTT; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zOrDauVS+hbkVPh0+UTcX6Mhkdkb3swMAa9sOE8DgIs=; b=kdbW+UTTT7P8L00nGt1qaCNFY8
	az4qaKFEx3Qpp3Hr6WnNRVNsTHT4pYehH8H/hrZRuG6C0TiMKznaTJn4bAEiZh2VKKD4haNnZQdbD
	hIUVzd38wXVerjNkcIMHXJpU+Ne9XSxq600sMfZEzYTyCIcIN1KG1ioBpMWhZ2GASgDdBQ5sp/l8Z
	OIC/DY9tGSF2RXgQ3Ce6f2fQ8/5VCSftnhEPqW1U/1hnIhWpH7/QuZrZ0kkYCtQLrkC7OL79tJNQr
	aO2afQ/a5KbXpRiTfJZH91e4LQ9plXaiRR3gtuy1kFPbsCNl648UG9r6F3ky8mVBhRzHeXhCUFZ0V
	BnIKPKhQ==;
Received: from minute.unseen.parts ([139.162.151.61]:35754 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1tWdP6-0005Em-1T;
	Sat, 11 Jan 2025 16:28:00 +0100
Date: Sat, 11 Jan 2025 16:27:57 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-alpha@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>,
	Sam James <sam@gentoo.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
	Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
Message-ID: <Z4KN_aOT6uZRAm8a@minute>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>

On Fri, Jan 10, 2025 at 06:16:28PM -0600, Eric W. Biederman wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
> 
> > There was a Spec benchmark (I forget which) which was memory bound and ran
> > twice as fast with 32-bit pointers.
> >
> > I copied the idea from DEC to the ELF abi, but never did all the other work
> > to allow the toolchain to take advantage.
> >
> > Amusingly, a later Spec changed the benchmark data sets to not fit into a
> > 32-bit address space, specifically because of this.
> >
> > I expect one could delete the ELF bit and personality and no one would
> > notice. Not even the 10 remaining Alpha users.
> 
> In [2] it was pointed out that parts of setarch weren't working
> properly on alpha because it has it's own SET_PERSONALITY
> implementation.  In the discussion that followed Richard Henderson
> pointed out that the 32bit pointer support for alpha was never
> completed.
> 
> Fix this by removing alpha's 32bit pointer support.
> 
> As a bit of paranoia refuse to execute any alpha binaries that hafe
> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> somewhere has binaries that trying to use alpha's 32bit pointer
> support.

In general I agree, but then someone ought to remove the "--taso" option
from GNU ld, which produces such binaries.

Ivan.

> [1] https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com
> [2] https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  arch/alpha/include/asm/elf.h       |  6 +-----
>  arch/alpha/include/asm/pgtable.h   |  2 +-
>  arch/alpha/include/asm/processor.h |  8 ++------
>  arch/alpha/kernel/osf_sys.c        | 11 ++---------
>  4 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
> index 4d7c46f50382..50c82187e60e 100644
> --- a/arch/alpha/include/asm/elf.h
> +++ b/arch/alpha/include/asm/elf.h
> @@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
>  /*
>   * This is used to ensure we don't load something for the wrong architecture.
>   */
> -#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
> +#define elf_check_arch(x) (((x)->e_machine == EM_ALPHA) && !((x)->e_flags & EF_ALPHA_32BIT))
>  
>  /*
>   * These are used to set parameters in the core dumps.
> @@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
>  	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
>  })
>  
> -#define SET_PERSONALITY(EX)					\
> -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> -	   ? PER_LINUX_32BIT : PER_LINUX)
> -
>  extern int alpha_l1i_cacheshape;
>  extern int alpha_l1d_cacheshape;
>  extern int alpha_l2_cacheshape;
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
> index 635f0a5f5bbd..02e8817a8921 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  
>  extern void paging_init(void);
>  
> -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> +/* We have our own get_unmapped_area */
>  #define HAVE_ARCH_UNMAPPED_AREA
>  
>  #endif /* _ALPHA_PGTABLE_H */
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
> index 55bb1c09fd39..5dce5518a211 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -8,23 +8,19 @@
>  #ifndef __ASM_ALPHA_PROCESSOR_H
>  #define __ASM_ALPHA_PROCESSOR_H
>  
> -#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
> -
>  /*
>   * We have a 42-bit user address space: 4TB user VM...
>   */
>  #define TASK_SIZE (0x40000000000UL)
>  
> -#define STACK_TOP \
> -  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000UL)
> +#define STACK_TOP (0x00120000000UL)
>  
>  #define STACK_TOP_MAX	0x00120000000UL
>  
>  /* This decides where the kernel will search for a free chunk of vm
>   * space during mmap's.
>   */
> -#define TASK_UNMAPPED_BASE \
> -  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / 2)
> +#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
>  
>  /* This is dead.  Everything has been moved to thread_info.  */
>  struct thread_struct { };
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 86185021f75a..a08e8edef1a4 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
>  	return ret;
>  }
>  
> -/* Get an address range which is currently unmapped.  Similar to the
> -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
> +/* Get an address range which is currently unmapped. */
>  
>  static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
>  		       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	unsigned long limit;
> -
> -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> -	if (current->personality & ADDR_LIMIT_32BIT)
> -		limit = 0x80000000;
> -	else
> -		limit = TASK_SIZE;
> +	unsigned long limit = TASK_SIZE;
>  
>  	if (len > limit)
>  		return -ENOMEM;
> -- 
> 2.41.0
> 
> 

