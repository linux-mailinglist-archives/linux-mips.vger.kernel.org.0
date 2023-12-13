Return-Path: <linux-mips+bounces-603-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28980A57B
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 15:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D93A9B20BD9
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE01E534;
	Fri,  8 Dec 2023 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ae9T3e1C"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693321738
	for <linux-mips@vger.kernel.org>; Fri,  8 Dec 2023 06:30:28 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso22329915e9.2
        for <linux-mips@vger.kernel.org>; Fri, 08 Dec 2023 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702045827; x=1702650627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X8HQehrxqqdotEA60rYgF/5Z0BWv62JqBcRTG61sQ8=;
        b=ae9T3e1Cne24CyqIheMbKwefld08kr8LfEtB9Jb2ladRXJ/zge8FEhm2SmgyMlCD80
         xpFDAG6RVeK43Jx58jYD+RWuZUj3qrIG3bLYc6aeP9kv9OnHxk7XTG71mJmMD8Ak/k81
         fUfXdfkyFn6Ltylt3DI2vCjZd5kIYEOZgvzuL503y5mBNLCwZnf9QdmhkDQFL4yHcvpJ
         LpUXbgoYRejeBxH4+1/hEVPbIQpQR4XVh6aC/uL4H4DEKq7rskTVvdlJ9ecihNwuP486
         L7xSo6dPvCDV/tXzg9YrGauVLmFdmD7pD2gr8nv6kbsM+UZnbNLvxvnXfSKns5Ij46UI
         OOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702045827; x=1702650627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X8HQehrxqqdotEA60rYgF/5Z0BWv62JqBcRTG61sQ8=;
        b=ArlFT93RF0Rj4wItR8gPoJvobzKBqXTGzdAEkmzFS6PvU2ES3OxcYv+W8dr6MA8bvB
         K73eeR4nXXBU9iUWJSa5OV/cxgh/DY5L7Khipk3a0BBWCRV7fYW/5jSB6MCrguUeHAOL
         ZO68OoRGKnki7yBS90q1MNreVO0p+8FpIFDXvIO7bWKAQR2PaiL3QlvV4QI9FQcW1OmS
         pYHZSSroiA/YdSIpfb1R09N1v0AmBWyfEYgOmAtuCKNGi29u39OkuhMYBWF01KV7heSl
         SUSspwv6HbNC57+JVGTLqKgFSw1w6M9U0XEvATuh+xFc8pxiMAKQSjvG0vxPmXrf9SuM
         bduw==
X-Gm-Message-State: AOJu0YzwN+UPPzdy9pPEXqAdziKItGAyTpiTEWzdhfcP3rNho/dhFmh7
	fPaFYIxE1rhL0f3sVXDWq5EtBeRg8uk0le8OZ14YMg==
X-Google-Smtp-Source: AGHT+IF4tJfaa/fk4ZwgJmpqT0IJIacv8FURbcP3EIH//i3tM9hlmyqgmhJPetNv8trt2hsappah6dIbHJpD3YL5pXI=
X-Received: by 2002:a05:600c:4d0e:b0:40b:5e1e:cf1 with SMTP id
 u14-20020a05600c4d0e00b0040b5e1e0cf1mr33402wmp.44.1702045826774; Fri, 08 Dec
 2023 06:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
 <20231207150348.82096-3-alexghiti@rivosinc.com> <6e3fb7b0-f47d-4d2f-b1b8-3ecc047b9ebf@csgroup.eu>
In-Reply-To: <6e3fb7b0-f47d-4d2f-b1b8-3ecc047b9ebf@csgroup.eu>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 8 Dec 2023 15:30:16 +0100
Message-ID: <CAHVXubg3rX_HOq=v4GCOVmDGVB3AA8kWWUsZTcZu6Y+Y2XmYQw@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid TLB
 entries caching
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Ved Shanbhogue <ved@rivosinc.com>, 
	Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 4:55=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 07/12/2023 =C3=A0 16:03, Alexandre Ghiti a =C3=A9crit :
> > This mechanism allows to completely bypass the sfence.vma introduced by
> > the previous commit for uarchs that do not cache invalid TLB entries.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >   arch/riscv/mm/init.c | 124 ++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 124 insertions(+)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 379403de6c6f..2e854613740c 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -56,6 +56,8 @@ bool pgtable_l5_enabled =3D IS_ENABLED(CONFIG_64BIT) =
&& !IS_ENABLED(CONFIG_XIP_KER
> >   EXPORT_SYMBOL(pgtable_l4_enabled);
> >   EXPORT_SYMBOL(pgtable_l5_enabled);
> >
> > +bool tlb_caching_invalid_entries;
> > +
> >   phys_addr_t phys_ram_base __ro_after_init;
> >   EXPORT_SYMBOL(phys_ram_base);
> >
> > @@ -750,6 +752,18 @@ static void __init disable_pgtable_l4(void)
> >       satp_mode =3D SATP_MODE_39;
> >   }
> >
> > +static void __init enable_pgtable_l5(void)
> > +{
> > +     pgtable_l5_enabled =3D true;
> > +     satp_mode =3D SATP_MODE_57;
> > +}
> > +
> > +static void __init enable_pgtable_l4(void)
> > +{
> > +     pgtable_l4_enabled =3D true;
> > +     satp_mode =3D SATP_MODE_48;
> > +}
> > +
> >   static int __init print_no4lvl(char *p)
> >   {
> >       pr_info("Disabled 4-level and 5-level paging");
> > @@ -826,6 +840,112 @@ static __init void set_satp_mode(uintptr_t dtb_pa=
)
> >       memset(early_pud, 0, PAGE_SIZE);
> >       memset(early_pmd, 0, PAGE_SIZE);
> >   }
> > +
> > +/* Determine at runtime if the uarch caches invalid TLB entries */
> > +static __init void set_tlb_caching_invalid_entries(void)
> > +{
> > +#define NR_RETRIES_CACHING_INVALID_ENTRIES   50
>
> Looks odd to have macros nested in the middle of a function.
>
> > +     uintptr_t set_tlb_caching_invalid_entries_pmd =3D ((unsigned long=
)set_tlb_caching_invalid_entries) & PMD_MASK;
> > +     // TODO the test_addr as defined below could go into another pud.=
..
> > +     uintptr_t test_addr =3D set_tlb_caching_invalid_entries_pmd + 2 *=
 PMD_SIZE;
> > +     pmd_t valid_pmd;
> > +     u64 satp;
> > +     int i =3D 0;
> > +
> > +     /* To ease the page table creation */
> > +     disable_pgtable_l5();
> > +     disable_pgtable_l4();
> > +
> > +     /* Establish a mapping for set_tlb_caching_invalid_entries() in s=
v39 */
> > +     create_pgd_mapping(early_pg_dir,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        (uintptr_t)early_pmd,
> > +                        PGDIR_SIZE, PAGE_TABLE);
> > +
> > +     /* Handle the case where set_tlb_caching_invalid_entries straddle=
s 2 PMDs */
> > +     create_pmd_mapping(early_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd,
> > +                        PMD_SIZE, PAGE_KERNEL_EXEC);
> > +     create_pmd_mapping(early_pmd,
> > +                        set_tlb_caching_invalid_entries_pmd + PMD_SIZE=
,
> > +                        set_tlb_caching_invalid_entries_pmd + PMD_SIZE=
,
> > +                        PMD_SIZE, PAGE_KERNEL_EXEC);
> > +
> > +     /* Establish an invalid mapping */
> > +     create_pmd_mapping(early_pmd, test_addr, 0, PMD_SIZE, __pgprot(0)=
);
> > +
> > +     /* Precompute the valid pmd here because the mapping for pfn_pmd(=
) won't exist */
> > +     valid_pmd =3D pfn_pmd(PFN_DOWN(set_tlb_caching_invalid_entries_pm=
d), PAGE_KERNEL);
> > +
> > +     local_flush_tlb_all();
> > +     satp =3D PFN_DOWN((uintptr_t)&early_pg_dir) | SATP_MODE_39;
> > +     csr_write(CSR_SATP, satp);
> > +
> > +     /*
> > +      * Set stvec to after the trapping access, access this invalid ma=
pping
> > +      * and legitimately trap
> > +      */
> > +     // TODO: Should I save the previous stvec?
> > +#define ASM_STR(x)   __ASM_STR(x)
>
> Looks odd to have macros nested in the middle of a function.
>
>
> > +     asm volatile(
> > +             "la a0, 1f                              \n"
> > +             "csrw " ASM_STR(CSR_TVEC) ", a0         \n"
> > +             "ld a0, 0(%0)                           \n"
> > +             ".align 2                               \n"
> > +             "1:                                     \n"
> > +             :
> > +             : "r" (test_addr)
> > +             : "a0"
> > +     );
> > +
> > +     /* Now establish a valid mapping to check if the invalid one is c=
ached */
> > +     early_pmd[pmd_index(test_addr)] =3D valid_pmd;
> > +
> > +     /*
> > +      * Access the valid mapping multiple times: indeed, we can't use
> > +      * sfence.vma as a barrier to make sure the cpu did not reorder a=
ccesses
> > +      * so we may trap even if the uarch does not cache invalid entrie=
s. By
> > +      * trying a few times, we make sure that those uarchs will see th=
e right
> > +      * mapping at some point.
> > +      */
> > +
> > +     i =3D NR_RETRIES_CACHING_INVALID_ENTRIES;
> > +
> > +#define ASM_STR(x)   __ASM_STR(x)
>
> Deplicate define ?
>
> > +     asm_volatile_goto(
> > +             "la a0, 1f                                      \n"
> > +             "csrw " ASM_STR(CSR_TVEC) ", a0                 \n"
> > +             ".align 2                                       \n"
> > +             "1:                                             \n"
> > +             "addi %0, %0, -1                                \n"
> > +             "blt %0, zero, %l[caching_invalid_entries]      \n"
> > +             "ld a0, 0(%1)                                   \n"
> > +             :
> > +             : "r" (i), "r" (test_addr)
> > +             : "a0"
> > +             : caching_invalid_entries
> > +     );
> > +
> > +     csr_write(CSR_SATP, 0ULL);
> > +     local_flush_tlb_all();
> > +
> > +     /* If we don't trap, the uarch does not cache invalid entries! */
> > +     tlb_caching_invalid_entries =3D false;
> > +     goto clean;
> > +
> > +caching_invalid_entries:
> > +     csr_write(CSR_SATP, 0ULL);
> > +     local_flush_tlb_all();
> > +
> > +     tlb_caching_invalid_entries =3D true;
> > +clean:
> > +     memset(early_pg_dir, 0, PAGE_SIZE);
> > +     memset(early_pmd, 0, PAGE_SIZE);
>
> Use clear_page() instead ?
>
> > +
> > +     enable_pgtable_l4();
> > +     enable_pgtable_l5();
> > +}
> >   #endif
> >
> >   /*
> > @@ -1072,6 +1192,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >   #endif
> >
> >   #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
> > +     set_tlb_caching_invalid_entries();
> >       set_satp_mode(dtb_pa);
> >   #endif
> >
> > @@ -1322,6 +1443,9 @@ static void __init setup_vm_final(void)
> >       local_flush_tlb_all();
> >
> >       pt_ops_set_late();
> > +
> > +     pr_info("uarch caches invalid entries: %s",
> > +             tlb_caching_invalid_entries ? "yes" : "no");
> >   }
> >   #else
> >   asmlinkage void __init setup_vm(uintptr_t dtb_pa)

I left this patch so that people can easily test this without knowing
what their uarch is actually doing, but it will very likely be dropped
as a new extension has just been proposed for that.

Thanks anyway, I should have been more clear in the patch title,

Alex

