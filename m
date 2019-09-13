Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C147DB1A8E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 11:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387953AbfIMJNG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 05:13:06 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44262 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbfIMJNG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 05:13:06 -0400
Received: by mail-ed1-f68.google.com with SMTP id p2so25201408edx.11
        for <linux-mips@vger.kernel.org>; Fri, 13 Sep 2019 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GEliFawsGnvWaq/wjC8o7X+uw8pCAUzjjDt3si5wKpw=;
        b=cuhllGlp2MOrdGub8Xg9DSnbN4UNbu5MAj+tu2g8/hUaiRvqMMOHfTNwMUyS5pk0Wh
         Cr/5CrT44vV+Lu6MEqICuL5EsXflVt2aB1CYOvw49Ff95R0+EpyudeDA0c1SjKiSBgvJ
         j392DdO8k5wtN6+t0Mq4Pin3skB6EB7fqWabfD22XoO9Zau3MU3BJhMVCPaEwzZDcctL
         3Z1utSLzZkSKBXiuC7y0bwtRfMC6JHyQJ4KI6FWcJD3QstGxSDpCFQt7SWa9ffXb7iM8
         Ka/YoQxle3ll0z8qQj2WsoJL1cViPtFo+jeRDT45DkakRyYbR2vwrsjhDwiP9OSANs1/
         05gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GEliFawsGnvWaq/wjC8o7X+uw8pCAUzjjDt3si5wKpw=;
        b=HlkvxXwVyrKBu6s9Urrwwl7C3rimMcNOCB+/AWUlHc+/HD67Eixbo40vOVB4ImP1xL
         FzxQjvuPKe3Uvo4Y/V61haLlHU+bGxeR3vD0fdMfOF28FeR7ZxvAIPBdZA9CHm+eSQHw
         DjX2/lWJnV00i3cttXEifpkXyAmHoxIWCCHZFntl59xxF97Z1YPv+iVWFoBfDQYl/dLa
         4KRjZaTbhDRVXMFvaD9zE9zSFjnCvocBX7IeIXgbj+JBlff62mATo2FfW4bVQs2VgHso
         2Le9g1t4iqLvEl61ciW0+Jso4oyhe+hGZIpOzZiiMvxN0skRYWiu2JtW5Bu+2U59FsHJ
         95iw==
X-Gm-Message-State: APjAAAUbCrkTua8PMlVYac0m40cpxLiTs9jkxkwUF7BSmbbzmWyFGWwq
        N3WuvqXJQoSVZ3eEgKIzQR0AMg==
X-Google-Smtp-Source: APXvYqz9+Jjoiq6EpEOnNn2ue7LgRH298IcNtOZjCAdMkVz1fw1ulTQ0FfVWoOu1Q7FOQkoJoXJfvw==
X-Received: by 2002:aa7:da59:: with SMTP id w25mr44834467eds.143.1568365983857;
        Fri, 13 Sep 2019 02:13:03 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id oo23sm3092469ejb.64.2019.09.13.02.13.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 02:13:03 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 3271B10160B; Fri, 13 Sep 2019 12:13:05 +0300 (+03)
Date:   Fri, 13 Sep 2019 12:13:05 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
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
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20190913091305.rkds4f3fqv3yjhjy@box>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 13, 2019 at 02:32:04PM +0530, Anshuman Khandual wrote:
> 
> On 09/12/2019 10:44 PM, Christophe Leroy wrote:
> > 
> > 
> > Le 12/09/2019 à 08:02, Anshuman Khandual a écrit :
> >> This adds a test module which will validate architecture page table helpers
> >> and accessors regarding compliance with generic MM semantics expectations.
> >> This will help various architectures in validating changes to the existing
> >> page table helpers or addition of new ones.
> >>
> >> Test page table and memory pages creating it's entries at various level are
> >> all allocated from system memory with required alignments. If memory pages
> >> with required size and alignment could not be allocated, then all depending
> >> individual tests are skipped.
> >>
> > 
> > [...]
> > 
> >>
> >> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>   arch/x86/include/asm/pgtable_64_types.h |   2 +
> >>   mm/Kconfig.debug                        |  14 +
> >>   mm/Makefile                             |   1 +
> >>   mm/arch_pgtable_test.c                  | 429 ++++++++++++++++++++++++
> >>   4 files changed, 446 insertions(+)
> >>   create mode 100644 mm/arch_pgtable_test.c
> >>
> >> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> >> index 52e5f5f2240d..b882792a3999 100644
> >> --- a/arch/x86/include/asm/pgtable_64_types.h
> >> +++ b/arch/x86/include/asm/pgtable_64_types.h
> >> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> >>   #define pgtable_l5_enabled() 0
> >>   #endif /* CONFIG_X86_5LEVEL */
> >>   +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> >> +
> > 
> > This is specific to x86, should go in a separate patch.
> 
> Thought about it but its just a single line. Kirill suggested this in the
> previous version. There is a generic fallback definition but s390 has it's
> own. This change overrides the generic one for x86 probably as a fix or as
> an improvement. Kirill should be able to help classify it in which case it
> can be a separate patch.

I don't think it worth a separate patch.

-- 
 Kirill A. Shutemov
