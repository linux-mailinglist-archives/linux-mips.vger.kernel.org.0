Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60DF815397
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 20:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfEFSZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 14:25:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43631 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfEFSZy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 May 2019 14:25:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so2002295pfa.10
        for <linux-mips@vger.kernel.org>; Mon, 06 May 2019 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=NXCCd9DEwpVv+CkVk+97oddxbHXiAPPbrF6iGBSrYgc=;
        b=NKrWKCiGbzmza35fOtOMvL+ftXETfh3uUcp/GkaCXcI8/XzVP8qVDBZioaj7yzgwas
         2tQRRTKTuRAtOwQhT+kcUBv2qp2jRZVnznAovTkgFRvmAuuaShMFB+Nx1bbVUNa9A7OX
         8BLulEh57QbYge20tVCIr34v+fwMGVGOSH1ehzMLel+zcPUV1nVeQpw7cWLe4F7TLSOw
         ++VBDFOhS3lKU6/bS8dLLIX6A8ANpsIH1DryjqnbCnoWXwVNSYR3C7RBe/CPhV/P7ncT
         Cg2Mr2IcrlFerHMT/L21aU76jEgkMtiGDQAE6F2Y4uyRJKfpkAmDpf2MCdenO33CvIPF
         KysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=NXCCd9DEwpVv+CkVk+97oddxbHXiAPPbrF6iGBSrYgc=;
        b=GAfX0vTiB7Wq4AcYzSh6WZ0O3nhwYC/Oer4gxBA6IsS9VTkhA64LJc3SKjwayzyNTH
         5tLjuqe/ho0tY+EwO7MnUeI6zqLycdFNAcpwX+fYKHty4pl08gV4JHVaJp58h3mywpAw
         wKk4BSiPaD3iqKC5rXTEPqCPSp0BDYugPebJPsN59GW9SyrAVKB91ykALFDIm9Iw7q4Y
         hy784bkrd+4+flvl923yQmV0393ySFumATsMCRY950jx+BjRg5xkTKYSY5sin1/X0hGW
         ZX1APgtr0AlWFIjlGULkKzbEfkRa1rznh7H6l6q8JKGqlnuMFl0EbzlLsigCGq9RWQ+m
         +4qw==
X-Gm-Message-State: APjAAAV+FHKSU7rJVNTRzBzrPDvN6HfFkYGcyTbJ5NkQR+ZF8E0OsfLs
        SWUg/fkQ5/oBwyaPCI2jHuZn/g==
X-Google-Smtp-Source: APXvYqz/rXdpBxODnklgvIEL8bDQcS0bWQdd3xgt2Ribpt+WuSOewfTAdZg7WDT5L829vlRrQKqfdA==
X-Received: by 2002:a62:121c:: with SMTP id a28mr34935323pfj.58.1557167153191;
        Mon, 06 May 2019 11:25:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id x66sm15776570pfb.78.2019.05.06.11.25.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 11:25:52 -0700 (PDT)
Date:   Mon, 06 May 2019 11:25:52 -0700 (PDT)
X-Google-Original-Date: Mon, 06 May 2019 11:25:42 PDT (-0700)
Subject:     Re: [PATCH 13/15] riscv: switch to generic version of pte allocation
In-Reply-To: <1556810922-20248-14-git-send-email-rppt@linux.ibm.com>
CC:     akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
        catalin.marinas@arm.com, geert@linux-m68k.org, green.hu@gmail.com,
        gxt@pku.edu.cn, guoren@kernel.org, deller@gmx.de, lftan@altera.com,
        willy@infradead.org, mattst88@gmail.com, mpe@ellerman.id.au,
        mhocko@suse.com, paul.burton@mips.com, rkuo@codeaurora.org,
        richard@nod.at, linux@armlinux.org.uk, sammy@sammy.net,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
        nios2-dev@lists.rocketboards.org, rppt@linux.ibm.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     rppt@linux.ibm.com
Message-ID: <mhng-c23d2e8b-1dc0-48db-a4cf-d6964ca650c0@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 02 May 2019 08:28:40 PDT (-0700), rppt@linux.ibm.com wrote:
> The only difference between the generic and RISC-V implementation of PTE
> allocation is the usage of __GFP_RETRY_MAYFAIL for both kernel and user
> PTEs and the absence of __GFP_ACCOUNT for the user PTEs.
>
> The conversion to the generic version removes the __GFP_RETRY_MAYFAIL and
> ensures that GFP_ACCOUNT is used for the user PTE allocations.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

I'm assuming this is going in along with the rest of the patches, so I'm not
going to add it to my tree.

>
> The pte_free() and pte_free_kernel() versions are identical to the generic
> ones and can be simply dropped.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/riscv/include/asm/pgalloc.h | 29 ++---------------------------
>  1 file changed, 2 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 94043cf..48f28bb 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -18,6 +18,8 @@
>  #include <linux/mm.h>
>  #include <asm/tlb.h>
>
> +#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
> +
>  static inline void pmd_populate_kernel(struct mm_struct *mm,
>  	pmd_t *pmd, pte_t *pte)
>  {
> @@ -82,33 +84,6 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>
>  #endif /* __PAGETABLE_PMD_FOLDED */
>
> -static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
> -{
> -	return (pte_t *)__get_free_page(
> -		GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
> -}
> -
> -static inline struct page *pte_alloc_one(struct mm_struct *mm)
> -{
> -	struct page *pte;
> -
> -	pte = alloc_page(GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_ZERO);
> -	if (likely(pte != NULL))
> -		pgtable_page_ctor(pte);
> -	return pte;
> -}
> -
> -static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> -{
> -	free_page((unsigned long)pte);
> -}
> -
> -static inline void pte_free(struct mm_struct *mm, pgtable_t pte)
> -{
> -	pgtable_page_dtor(pte);
> -	__free_page(pte);
> -}
> -
>  #define __pte_free_tlb(tlb, pte, buf)   \
>  do {                                    \
>  	pgtable_page_dtor(pte);         \
