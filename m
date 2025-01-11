Return-Path: <linux-mips+bounces-7391-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88475A0A2DA
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 11:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89AAC3AA3E3
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 10:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFD71917CD;
	Sat, 11 Jan 2025 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ASehAqLW"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485D190665;
	Sat, 11 Jan 2025 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736591848; cv=none; b=WKp9Rqy5hovBFpP4PiOEInTGpDyJ43IoQoCtXyISrZN5kXSXmAqFt4+ggk2gL5cncpUHp1/vnb8lu7kdOHpiktNfteRY5KR4cceFbRr0WfPK0rAlsTugaCi5fqFBa7PX3HgaT6WZsZq0ZJ1nFsyzgEfy2q0BaqDApFrzPKKrdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736591848; c=relaxed/simple;
	bh=J9qfsHnXvzG51XmIMehDBrHTZVBnIEv6EQBMFJ4Eidc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lKe+btBN+SzVSyPMSSN1eRVplpXXZ44goCXaCgXwOoJBxU1ZEPSqjdObW23vndkkDl0HqVxoCYMgbSZWilzocyLhkJVFDNW4rNFLVsR42agW1N2h6VohPeGAEY5WOwyJWBgr4xvSEZULIv4lDIxzEJeC+Gp09tbqrsdl7WonSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ASehAqLW; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s+65UPhjiNYX126VZsqD9OJK1GZ2ijFtoFRRiqh52Rg=; t=1736591844; x=1737196644; 
	b=ASehAqLW1K643oQutwRP6dQWsTfsKLDGmFHcyGpnGiwh7pGhgQfkGStrath0hpQ5PVFBwvqyJWB
	Wmew03FtaKMsT2NDl67dKPholK6EUHfQd6/G90/gAc9s5rh37F1684ZHw6RI/2AsFRYO1TxjrE20W
	Lidbbif026NyxDQ9o1hmAcDADjXqg4TcYAxXWwIPfB5diwQa/embPiUfOA0HOElw2/DzHJtERhGWe
	i/zT1VGXSx+/DluUr+6SguNDMYq0WvhwckJni4UrSwiQSD+sWW/BzzKjZkX+a3NLcrueUsY7P3dIl
	AzWaFj38dho54djXfZchZFyZF0mAIR8omOQA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tWYrh-00000000tpC-1n5X; Sat, 11 Jan 2025 11:37:13 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tWYrh-00000002S89-0gIa; Sat, 11 Jan 2025 11:37:13 +0100
Message-ID: <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Kees Cook
	 <kees@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	linux-alpha@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,  Michael Cree <mcree@orcon.net.nz>, Sam James
 <sam@gentoo.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,  Geert
 Uytterhoeven <geert@linux-m68k.org>, Michael Karcher
 <kernel@mkarcher.dialup.fu-berlin.de>, Chris Hofstaedtler	
 <zeha@debian.org>, util-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	loongarch@lists.linux.dev
Date: Sat, 11 Jan 2025 11:37:12 +0100
In-Reply-To: <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
		<24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
		<678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
		<bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
		<82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
		<cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Eric,

On Fri, 2025-01-10 at 18:16 -0600, Eric W. Biederman wrote:
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
>=20
> > There was a Spec benchmark (I forget which) which was memory bound and =
ran
> > twice as fast with 32-bit pointers.
> >=20
> > I copied the idea from DEC to the ELF abi, but never did all the other =
work
> > to allow the toolchain to take advantage.
> >=20
> > Amusingly, a later Spec changed the benchmark data sets to not fit into=
 a
> > 32-bit address space, specifically because of this.
> >=20
> > I expect one could delete the ELF bit and personality and no one would
> > notice. Not even the 10 remaining Alpha users.
>=20
> In [2] it was pointed out that parts of setarch weren't working
> properly on alpha because it has it's own SET_PERSONALITY
> implementation.  In the discussion that followed Richard Henderson
> pointed out that the 32bit pointer support for alpha was never
> completed.
>=20
> Fix this by removing alpha's 32bit pointer support.
>=20
> As a bit of paranoia refuse to execute any alpha binaries that hafe
                                                                 ^^^^ hafe-=
>have

> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> somewhere has binaries that trying to use alpha's 32bit pointer
                            ^^^ are

> support.
>=20
> [1] https://lkml.kernel.org/r/CAFXwXrkgu=3D4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq=
4ttm52pJOQ@mail.gmail.com
> [2] https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-=
berlin.de
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  arch/alpha/include/asm/elf.h       |  6 +-----
>  arch/alpha/include/asm/pgtable.h   |  2 +-
>  arch/alpha/include/asm/processor.h |  8 ++------
>  arch/alpha/kernel/osf_sys.c        | 11 ++---------
>  4 files changed, 6 insertions(+), 21 deletions(-)
>=20
> diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
> index 4d7c46f50382..50c82187e60e 100644
> --- a/arch/alpha/include/asm/elf.h
> +++ b/arch/alpha/include/asm/elf.h
> @@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
>  /*
>   * This is used to ensure we don't load something for the wrong architec=
ture.
>   */
> -#define elf_check_arch(x) ((x)->e_machine =3D=3D EM_ALPHA)
> +#define elf_check_arch(x) (((x)->e_machine =3D=3D EM_ALPHA) && !((x)->e_=
flags & EF_ALPHA_32BIT))
> =20
>  /*
>   * These are used to set parameters in the core dumps.
> @@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct ta=
sk_struct *task);
>  	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
>  })
> =20
> -#define SET_PERSONALITY(EX)					\
> -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> -	   ? PER_LINUX_32BIT : PER_LINUX)
> -
>  extern int alpha_l1i_cacheshape;
>  extern int alpha_l1d_cacheshape;
>  extern int alpha_l2_cacheshape;
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 635f0a5f5bbd..02e8817a8921 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte=
)
> =20
>  extern void paging_init(void);
> =20
> -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> +/* We have our own get_unmapped_area */
>  #define HAVE_ARCH_UNMAPPED_AREA
> =20
>  #endif /* _ALPHA_PGTABLE_H */
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/=
processor.h
> index 55bb1c09fd39..5dce5518a211 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -8,23 +8,19 @@
>  #ifndef __ASM_ALPHA_PROCESSOR_H
>  #define __ASM_ALPHA_PROCESSOR_H
> =20
> -#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
> -
>  /*
>   * We have a 42-bit user address space: 4TB user VM...
>   */
>  #define TASK_SIZE (0x40000000000UL)
> =20
> -#define STACK_TOP \
> -  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000U=
L)
> +#define STACK_TOP (0x00120000000UL)
> =20
>  #define STACK_TOP_MAX	0x00120000000UL
> =20
>  /* This decides where the kernel will search for a free chunk of vm
>   * space during mmap's.
>   */
> -#define TASK_UNMAPPED_BASE \
> -  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / =
2)
> +#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
> =20
>  /* This is dead.  Everything has been moved to thread_info.  */
>  struct thread_struct { };
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 86185021f75a..a08e8edef1a4 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user=
 *, txc_p)
>  	return ret;
>  }
> =20
> -/* Get an address range which is currently unmapped.  Similar to the
> -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  *=
/
> +/* Get an address range which is currently unmapped. */
> =20
>  static unsigned long
>  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned=
 long addr,
>  		       unsigned long len, unsigned long pgoff,
>  		       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	unsigned long limit;
> -
> -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> -	if (current->personality & ADDR_LIMIT_32BIT)
> -		limit =3D 0x80000000;
> -	else
> -		limit =3D TASK_SIZE;
> +	unsigned long limit =3D TASK_SIZE;
> =20
>  	if (len > limit)
>  		return -ENOMEM;

Looks good to me besides the two spelling mistakes above in the comment.

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Will also test and report back shortly.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

