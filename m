Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995C1CE366
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 15:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfJGN0L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 09:26:11 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34822 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGN0L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Oct 2019 09:26:11 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so12448658eds.2
        for <linux-mips@vger.kernel.org>; Mon, 07 Oct 2019 06:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gzC3+Ai/BcUPGOo2+frzMx33cRF/lu4IW7bk4buzvfY=;
        b=LuKZCLEks+pxri1fZImZ8aWZNoPyA0k53cdFVsuHb5MDqAN5knWAMDy0wPUsgUxBCF
         gQcbOYCIkTqaNbsMxo5RKNjpP0d8lQMy7pguGPtgJSh9DP3B9YIN2mS8bmQvpx9hwj+h
         f1Slcuf8Kzh1JBnKhidomUrXDTUHxpZKdm+qSnztmiyYersQcoVvJ/ohhpzjG+T7kfj/
         les5EAK/LmmoySH+aJWZ1XdWfqQwdMTB2W4ogQ6nBwrh8QCxg6VIpsZnYghJaIlVBMwA
         tZPwZXA0ICwRWfFHd+u/u3DYHya4aQ5yYd1iqfinaPiyxKvPuAJePigymhWXfsmqSyff
         W1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gzC3+Ai/BcUPGOo2+frzMx33cRF/lu4IW7bk4buzvfY=;
        b=nKRjwstK82SqamaEZ7r+8VE4ffomP5PVoXiJFvmDtKdZFPtKxCYua/elMDkAubIJcZ
         n8Rkl8tv4vOBGIc0VxPXbAeloU/E1I8SSNQIE2WbEGNRtCp13696eHpYBblg/EppgDQg
         dO/jDMBBYXI4I0JYBWBTRSYpfa5y1ARARXN6iavw2C3UCqEd0CbWdyjWFYqxoXM+6vQZ
         QOxcwKsWfhXkOarthxbB+LJitfDsLE0cb3mCW9RH/TOAs8ZCHw/V5AeZF9nyPsKARUFo
         xF/KuyQggVrdwcUoVIrZtWb5Y7qmqJymobZeQmHpfOhux5FYmvraqOOpa7VkxLvw26eu
         tSkg==
X-Gm-Message-State: APjAAAW7pc0anHISXbIGOJgTRyKE68174veIC2yzw3+lGyxb5nVLBEg0
        1N7JFNYfcTSBHQQJA99RdVZTeA==
X-Google-Smtp-Source: APXvYqzElnCPZjbODoQl3J/SFOw2KfpCAczFpMms9cACkFS6giHuVTdY1dFFe29OUP7N4OGq9tG9dw==
X-Received: by 2002:a05:6402:7c1:: with SMTP id u1mr29121094edy.198.1570454769090;
        Mon, 07 Oct 2019 06:26:09 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id t30sm3414834edt.91.2019.10.07.06.26.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 06:26:08 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 4DF0F10027F; Mon,  7 Oct 2019 16:26:07 +0300 (+03)
Date:   Mon, 7 Oct 2019 16:26:07 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Ingo Molnar <mingo@kernel.org>
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
Message-ID: <20191007132607.4q537nauwfn5thol@box>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007130617.GB56546@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
> 
> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
> > This adds a test module which will validate architecture page table helpers
> > and accessors regarding compliance with generic MM semantics expectations.
> > This will help various architectures in validating changes to the existing
> > page table helpers or addition of new ones.
> > 
> > Test page table and memory pages creating it's entries at various level are
> > all allocated from system memory with required alignments. If memory pages
> > with required size and alignment could not be allocated, then all depending
> > individual tests are skipped.
> 
> > diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> > index 52e5f5f2240d..b882792a3999 100644
> > --- a/arch/x86/include/asm/pgtable_64_types.h
> > +++ b/arch/x86/include/asm/pgtable_64_types.h
> > @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> >  #define pgtable_l5_enabled() 0
> >  #endif /* CONFIG_X86_5LEVEL */
> >  
> > +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> > +
> >  extern unsigned int pgdir_shift;
> >  extern unsigned int ptrs_per_p4d;
> 
> Any deep reason this has to be a macro instead of proper C?

It's a way to override the generic mm_p4d_folded(). It can be rewritten
as inline function + define. Something like:

#define mm_p4d_folded mm_p4d_folded
static inline bool mm_p4d_folded(struct mm_struct *mm)
{
	return !pgtable_l5_enabled();
}

But I don't see much reason to be more verbose here than needed.

-- 
 Kirill A. Shutemov
