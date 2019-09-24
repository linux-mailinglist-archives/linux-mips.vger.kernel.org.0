Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9272FBC731
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 13:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438941AbfIXLvC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Sep 2019 07:51:02 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45184 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440793AbfIXLvC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Sep 2019 07:51:02 -0400
Received: by mail-ed1-f65.google.com with SMTP id h33so1525628edh.12
        for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2019 04:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/6kM5ATWnIRmId0RwOcRfnLcpIWKP734aWDaVWhsGUo=;
        b=ga2DmRzWY94J19ywTXc7aJlINJ/KRYQ8PGtndpIW2otrRhhwz0vdOk+0aZyvFf12zM
         XpRveudYGeGkFKJSHG8HcySuK12YIGpCUEC2wkOTV45q1k8LT1ifI5j18tohQF7m/PA+
         6K8RlpcUkVPR9/+LLhQ4mzvuJBoUuyuUhlcKKiXhgp+n7PTRkv6s71hrNtmrwMJbpl7m
         e1KH2/aooSfrmq/GY1oql/dqAZBTTajifnl7uEJSb86NOqby7WFhLm7p3odLbtelzM4m
         ZVwvJJ/+RmqA5b79C+mbE04M3aieJOA2xjgY+3pjxmiSzVw2GC4lYm0cvsm1rZytvgPU
         ruog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/6kM5ATWnIRmId0RwOcRfnLcpIWKP734aWDaVWhsGUo=;
        b=A7LZAUHWTMB1Oz5G0myNp3wRHuL+aznggCiHdEmK5gdDUf9349UswJ6aSKEVjB+0C8
         xjfn+H6LgYIcnnz/mRxRtQoheDY0ug16713IMJbulYTmOjz8mauK9mUXL2JayeygS6g4
         KWXlEKXn/xOU/MyqpE6J+fsBIVMju/4SwNrGEEhongDO9NIxS64+uXbEqUmM/bjFdP0m
         dEVMhnMTS9OmoPcKmts+JaTk9BlToUNb+cMuKKDwE5dLjwvrSLKwqvLeuxhXWP6Mmw0L
         b8Wvh5tlQ++VdKes6a9MZmzi8mSrkgQWOM8MOxMpCRYOFy/SI/+YiNFH3tJkMovC/KEU
         CfAg==
X-Gm-Message-State: APjAAAW5QzmTF9q5N2rgpjbbYaWZ7HxKHOKZjKt786UjWB5c/08gafOl
        1mEy3P+SE67N/WtlhnLx0SsH9w==
X-Google-Smtp-Source: APXvYqxJMR8XXzMM+ktrv2ws01Rr8qKWI/iP6Q9Wd6fsMeCMuUxQBVCNuUcjqBIbwcds2k2WtfZxLA==
X-Received: by 2002:a50:9fe5:: with SMTP id c92mr2202655edf.280.1569325860692;
        Tue, 24 Sep 2019 04:51:00 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id r18sm319556edx.94.2019.09.24.04.50.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:51:00 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 60C621022A6; Tue, 24 Sep 2019 14:51:01 +0300 (+03)
Date:   Tue, 24 Sep 2019 14:51:01 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
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
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 0/2] mm/debug: Add tests for architecture exported
 page table helpers
Message-ID: <20190924115101.p6y7vpbtgmj5qjku@box>
References: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 20, 2019 at 12:03:21PM +0530, Anshuman Khandual wrote:
> This series adds a test validation for architecture exported page table
> helpers. Patch in the series adds basic transformation tests at various
> levels of the page table. Before that it exports gigantic page allocation
> function from HugeTLB.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Testing:
> 
> Successfully build and boot tested on both arm64 and x86 platforms without
> any test failing. Only build tested on some other platforms. Build failed
> on some platforms (known) in pud_clear_tests() as there were no available
> __pgd() definitions.
> 
> - ARM32
> - IA64

Hm. Grep shows __pgd() definitions for both of them. Is it for specific
config?


-- 
 Kirill A. Shutemov
