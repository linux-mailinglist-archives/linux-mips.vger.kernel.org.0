Return-Path: <linux-mips+bounces-8484-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E39A7CAE0
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 19:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DE11891E6C
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 17:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29E6199FD0;
	Sat,  5 Apr 2025 17:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ZuEUTPov"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E947422EE5;
	Sat,  5 Apr 2025 17:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743873735; cv=none; b=iRJ126a43c7Kcv1XZpccbPzSBPVijPNLvsAIRMNoDN4qdwUvyMFjHyILJwjtiE8DlSvL9C/jajTn6qLx2XueXJm1PH7bQdUB8HZJAEgvFAwVzDE7i0bdNYKrkwX4ZV+0KdBw+ksUKy2TdMEn/ELj9XV9juEBYDuS01Z04+EEeOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743873735; c=relaxed/simple;
	bh=3L6rACBhlQe09RbyplsUDn19Nacmp2yKAiUszBKSwZg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A5y0iD8OccmJj9PdtLH4H50RmRf0y9E/Cdh7aZy9oPFZ7NHTrKvD3G+P3kSUIbBBIEBU4KPSakriOG8FI+sIILKUqGgzbzIJh79CR0eO7TNpE35bi5fnz6+EJmIkBXAwK1vSbNXKPHsapOYBNnQhpYNBRDUCpIhsAka1GGdhDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ZuEUTPov; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b3Kx3WcHaCshZaunVEkbII7fyp2B54EZnHGN6XDAJSE=; t=1743873731; x=1744478531; 
	b=ZuEUTPov9ILeQi5mPSt02qOFNcXB/NRngVzIfiV9xSfKIh5N9aLR/zEk6rDW85d3mU33BYM38S4
	64PqMrKES82Pj1LyYWTYDmrRVptXt5KIoadWO6UhHdgZzIbhLXPwzR63n5KsBu3DZSWmm8x1FBEC+
	Dc31+/CQHJkxpmpmDH8QKctH5aOQKp8vkKV4CH1HwwAbj6SfXt2k1Z8WL7CJHCTjkYTf3zHC9Z1U3
	Iauz9zOhaEUAmQC4vyhjEwqs1VwKBX2MHyjK1xQpdUUQGoGCO8W68KugoezKHDvfEJGw8/MRb1lIS
	0R/pV1i5duvs0/W/94yNLfvVn3M3ztezPXZA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1u17DS-00000003woY-1k4y; Sat, 05 Apr 2025 19:21:58 +0200
Received: from dynamic-002-242-014-214.2.242.pool.telefonica.de ([2.242.14.214] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1u17DS-00000000biA-0QUK; Sat, 05 Apr 2025 19:21:58 +0200
Message-ID: <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, 
	mattst88@gmail.com, ink@unseen.parts, kees@kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org
Cc: chris@zankel.net, dinguyen@kernel.org, jcmvbkbc@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, loongarch@lists.linux.dev, monstr@monstr.eu, 
	sparclinux@vger.kernel.org, x86@kernel.org
Date: Sat, 05 Apr 2025 19:21:56 +0200
In-Reply-To: <20250218175735.19882-2-linmag7@gmail.com>
References: <20250218175735.19882-1-linmag7@gmail.com>
	 <20250218175735.19882-2-linmag7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Magnus,

On Tue, 2025-02-18 at 18:55 +0100, Magnus Lindholm wrote:
> Make pte_swp_exclusive return bool instead of int. This will better refle=
ct
> how pte_swp_exclusive is actually used in the code. This fixes swap/swapo=
ff
> problems on Alpha due pte_swp_exclusive not returning correct values when
> _PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Minor nitpick:

"when _PAGE_SWP_EXCLUSIVE" =3D> "when the _PAGE_SWP_EXCLUSIVE"

>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h             | 2 +-
>  arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
>  arch/arm/include/asm/pgtable.h               | 2 +-
>  arch/arm64/include/asm/pgtable.h             | 2 +-
>  arch/csky/include/asm/pgtable.h              | 2 +-
>  arch/hexagon/include/asm/pgtable.h           | 2 +-
>  arch/loongarch/include/asm/pgtable.h         | 2 +-
>  arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
>  arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
>  arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
>  arch/microblaze/include/asm/pgtable.h        | 2 +-
>  arch/mips/include/asm/pgtable.h              | 4 ++--
>  arch/nios2/include/asm/pgtable.h             | 2 +-
>  arch/openrisc/include/asm/pgtable.h          | 2 +-
>  arch/parisc/include/asm/pgtable.h            | 2 +-
>  arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
>  arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
>  arch/riscv/include/asm/pgtable.h             | 2 +-
>  arch/s390/include/asm/pgtable.h              | 2 +-
>  arch/sh/include/asm/pgtable_32.h             | 2 +-
>  arch/sparc/include/asm/pgtable_32.h          | 2 +-
>  arch/sparc/include/asm/pgtable_64.h          | 2 +-
>  arch/um/include/asm/pgtable.h                | 2 +-
>  arch/x86/include/asm/pgtable.h               | 2 +-
>  arch/xtensa/include/asm/pgtable.h            | 2 +-
>  26 files changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 02e8817a8921..b0870de4b5b8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, u=
nsigned long offset)
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include=
/asm/pgtable-bits-arcv2.h
> index 8ebec1b21d24..3084c53f402d 100644
> --- a/arch/arc/include/asm/pgtable-bits-arcv2.h
> +++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
> @@ -130,7 +130,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, str=
uct vm_area_struct *vma,
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtabl=
e.h
> index be91e376df79..aa4f3f71789c 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -303,7 +303,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t ne=
wprot)
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(swp)	__pte((swp).val)
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_isset(pte, L_PTE_SWP_EXCLUSIVE);
>  }
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 0b2a2ad1b9e8..b48b70d8d12d 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -496,7 +496,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
>  	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
>  }
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgta=
ble.h
> index a397e1718ab6..e68722eb33d9 100644
> --- a/arch/csky/include/asm/pgtable.h
> +++ b/arch/csky/include/asm/pgtable.h
> @@ -200,7 +200,7 @@ static inline pte_t pte_mkyoung(pte_t pte)
>  	return pte;
>  }
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/as=
m/pgtable.h
> index 8c5b7a1c3d90..fa007eb9aad3 100644
> --- a/arch/hexagon/include/asm/pgtable.h
> +++ b/arch/hexagon/include/asm/pgtable.h
> @@ -390,7 +390,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  		(((type & 0x1f) << 1) | \
>  		 ((offset & 0x3ffff8) << 10) | ((offset & 0x7) << 7)) })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index da346733a1da..bac946693d87 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -302,7 +302,7 @@ static inline pte_t mk_swap_pte(unsigned long type, u=
nsigned long offset)
>  #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
>  #define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/=
mcf_pgtable.h
> index 48f87a8a8832..7e9748b29c44 100644
> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -274,7 +274,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	(__pte((x).val))
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include=
/asm/motorola_pgtable.h
> index 9866c7acdabe..26da9b985c5f 100644
> --- a/arch/m68k/include/asm/motorola_pgtable.h
> +++ b/arch/m68k/include/asm/motorola_pgtable.h
> @@ -191,7 +191,7 @@ extern pgd_t kernel_pg_dir[128];
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm=
/sun3_pgtable.h
> index 30081aee8164..ac0793f57f31 100644
> --- a/arch/m68k/include/asm/sun3_pgtable.h
> +++ b/arch/m68k/include/asm/sun3_pgtable.h
> @@ -175,7 +175,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/incl=
ude/asm/pgtable.h
> index e4ea2ec3642f..b281c2bbd6c0 100644
> --- a/arch/microblaze/include/asm/pgtable.h
> +++ b/arch/microblaze/include/asm/pgtable.h
> @@ -406,7 +406,7 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) >> 2 })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val << 2 })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgta=
ble.h
> index c29a551eb0ca..c19da4ab7552 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -540,7 +540,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t ne=
wprot)
>  #endif
> =20
>  #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
>  }
> @@ -557,7 +557,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte=
)
>  	return pte;
>  }
>  #else
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pg=
table.h
> index eab87c6beacb..64ce06bae8ac 100644
> --- a/arch/nios2/include/asm/pgtable.h
> +++ b/arch/nios2/include/asm/pgtable.h
> @@ -265,7 +265,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  #define __swp_entry_to_pte(swp)	((pte_t) { (swp).val })
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/=
asm/pgtable.h
> index 60c6ce7ff2dc..34cad9177a48 100644
> --- a/arch/openrisc/include/asm/pgtable.h
> +++ b/arch/openrisc/include/asm/pgtable.h
> @@ -413,7 +413,7 @@ static inline void update_mmu_cache_range(struct vm_f=
ault *vmf,
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/=
pgtable.h
> index babf65751e81..dfeba45b6d6f 100644
> --- a/arch/parisc/include/asm/pgtable.h
> +++ b/arch/parisc/include/asm/pgtable.h
> @@ -431,7 +431,7 @@ static inline void set_ptes(struct mm_struct *mm, uns=
igned long addr,
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/=
include/asm/book3s/32/pgtable.h
> index 42c3af90d1f0..92d21c6faf1e 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -365,7 +365,7 @@ static inline void __ptep_set_access_flags(struct vm_=
area_struct *vma,
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
> index 6d98e6f08d4d..dbf772bef20d 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -693,7 +693,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
>  	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
>  }
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
>  }
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/inc=
lude/asm/nohash/pgtable.h
> index 8d1f0b7062eb..7d6b9e5b286e 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -286,7 +286,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t ne=
wprot)
>  	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
>  }
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 050fdc49b5ad..433c78c44e02 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -880,7 +880,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struc=
t *vma,
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgta=
ble.h
> index 3ca5af4cfe43..cb86dbf7126a 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -913,7 +913,7 @@ static inline int pmd_protnone(pmd_t pmd)
>  }
>  #endif
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtab=
le_32.h
> index f939f1215232..5f221f3269e3 100644
> --- a/arch/sh/include/asm/pgtable_32.h
> +++ b/arch/sh/include/asm/pgtable_32.h
> @@ -478,7 +478,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  /* In both cases, we borrow bit 6 to store the exclusive marker in swap =
PTEs. */
>  #define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm=
/pgtable_32.h
> index 62bcafe38b1f..0362f8357371 100644
> --- a/arch/sparc/include/asm/pgtable_32.h
> +++ b/arch/sparc/include/asm/pgtable_32.h
> @@ -353,7 +353,7 @@ static inline swp_entry_t __swp_entry(unsigned long t=
ype, unsigned long offset)
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & SRMMU_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm=
/pgtable_64.h
> index 2b7f358762c1..65e53491fe07 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -1027,7 +1027,7 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_str=
uct *mm, pmd_t *pmdp);
>  #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.=
h
> index 5601ca98e8a6..c32309614a15 100644
> --- a/arch/um/include/asm/pgtable.h
> +++ b/arch/um/include/asm/pgtable.h
> @@ -316,7 +316,7 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsig=
ned long addr);
>  	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
>  #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
>  }
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtabl=
e.h
> index 593f10aabd45..4c7ce40023d3 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1586,7 +1586,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
>  	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
>  }
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_flags(pte) & _PAGE_SWP_EXCLUSIVE;
>  }
> diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/=
pgtable.h
> index 1647a7cc3fbf..6da0aa0604f1 100644
> --- a/arch/xtensa/include/asm/pgtable.h
> +++ b/arch/xtensa/include/asm/pgtable.h
> @@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned lon=
g addr, pte_t *ptep)
>  #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
> =20
> -static inline int pte_swp_exclusive(pte_t pte)
> +static inline bool pte_swp_exclusive(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
>  }

I'm not so sure about this implicit cast from unsigned long to bool though.

Is this verified to work correctly on all architectures? I wonder why this
bug was not caught earlier on alpha on the other hand.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

