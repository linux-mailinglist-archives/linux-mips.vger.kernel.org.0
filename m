Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4A15CE43E
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 15:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJGNwF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 09:52:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35750 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGNwE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Oct 2019 09:52:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so15434635wrt.2;
        Mon, 07 Oct 2019 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NqDKw2q0fE+vHWOgUAiru/n1NoCQkdZ2AUuiN/uBGU8=;
        b=ic0JkvFI48xbG9WtluZM0Hf2PaBXHEnROez7bzryeyJvDMyBL5e6TbbMM0jUfHQLcj
         N60dwtHrD83rN8DO0nAWlFYhXP8KC2u6M4pUl5c0nz2hn71y23NUwAnaxYFkxrH4ok93
         +qfxQR+o9B6oGOhK4vKltZbgeMC0rGmYE19yAJrAQ1/yj8WoUn37LJOzT1mjCMj3nWxf
         T+d+hYdoZYOlliAXcaBDcfhvlDagJJO/aYGfkcviRX3zUAubMvNmWNjd1pemdF4Sv8ip
         gy5V18KXkquelqXpy56UmV1xBTQrBaryDxBotNjsV4DVgQZQSEqRJYVQMZJf/ufLy8+j
         SRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NqDKw2q0fE+vHWOgUAiru/n1NoCQkdZ2AUuiN/uBGU8=;
        b=F2J1VOxSTv/UUd15EyPRKLymaRExXtYIqlouPSkIv+MkexJG5S65b00UcjwV++cvbB
         sOPvQ9g7XViOQVrUcsRFuPx1kZ8E1tcM0XOnJ0HKBpSZeA6aBPgXcRfq8PQYg5qMzLtH
         wJ+AJeI7+IDjSCivz41bD3nj/kmY3nQGhQs7QPTPZpT8idjtj5KeTULwKy/o38tywrNo
         P5pORuuHc+zG6fnkCSG767/mQyVdLupkX6kCmfqFfN87fYyA2I9W0SEmwhL4TgTG37lB
         xzW3Qr6J+HO5upyDxh1Nrhs98Zc43cLkFv8XPZOknNnPRMs8prEqjLV0tsTpt/u/zetL
         doRA==
X-Gm-Message-State: APjAAAUy57t2Bdl0PIMaWVp/TqPeSP5zwk57DGjrnuQLom5ibINqZ8eu
        seuCquREvmFozPwxZLDLLDI=
X-Google-Smtp-Source: APXvYqwFD0AmO4hRi+9l8ADVfmGE8OkR9Fnj4QRZ24lM5fadabYkivM/y6etDxaG7ZOadEedrbv48w==
X-Received: by 2002:a5d:6441:: with SMTP id d1mr16719177wrw.254.1570456322346;
        Mon, 07 Oct 2019 06:52:02 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id q19sm41499530wra.89.2019.10.07.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:52:01 -0700 (PDT)
Date:   Mon, 7 Oct 2019 15:51:58 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20191007135158.GA36360@gmail.com>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com>
 <20191007132607.4q537nauwfn5thol@box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007132607.4q537nauwfn5thol@box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
> > 
> > * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > 
> > > This adds a test module which will validate architecture page table helpers
> > > and accessors regarding compliance with generic MM semantics expectations.
> > > This will help various architectures in validating changes to the existing
> > > page table helpers or addition of new ones.
> > > 
> > > Test page table and memory pages creating it's entries at various level are
> > > all allocated from system memory with required alignments. If memory pages
> > > with required size and alignment could not be allocated, then all depending
> > > individual tests are skipped.
> > 
> > > diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> > > index 52e5f5f2240d..b882792a3999 100644
> > > --- a/arch/x86/include/asm/pgtable_64_types.h
> > > +++ b/arch/x86/include/asm/pgtable_64_types.h
> > > @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> > >  #define pgtable_l5_enabled() 0
> > >  #endif /* CONFIG_X86_5LEVEL */
> > >  
> > > +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> > > +
> > >  extern unsigned int pgdir_shift;
> > >  extern unsigned int ptrs_per_p4d;
> > 
> > Any deep reason this has to be a macro instead of proper C?
> 
> It's a way to override the generic mm_p4d_folded(). It can be rewritten
> as inline function + define. Something like:
> 
> #define mm_p4d_folded mm_p4d_folded
> static inline bool mm_p4d_folded(struct mm_struct *mm)
> {
> 	return !pgtable_l5_enabled();
> }
> 
> But I don't see much reason to be more verbose here than needed.

C type checking? Documentation? Yeah, I know it's just a one-liner, but 
the principle of the death by a thousand cuts applies here.

BTW., any reason this must be in the low level pgtable_64_types.h type 
header, instead of one of the API level header files?

Thanks,

	Ingo
