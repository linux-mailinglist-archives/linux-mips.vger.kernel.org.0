Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADFF14ADDD
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 03:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgA1CL4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jan 2020 21:11:56 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:36265 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgA1CL4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Jan 2020 21:11:56 -0500
Received: by mail-qv1-f68.google.com with SMTP id db9so1941526qvb.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Jan 2020 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=7Y+cJY1xhd0yBpcec7AzD+9evfVDrwqprX0erT9gNQ8=;
        b=jZmBH73pillRBQpbX84TZ57nVUbP8l/pwzyrT6F1TLbL143seIWhzMHM+f433HkTJ5
         4+74y+cXEGlf05IjEqB0rGqFVcscYw+GLhSFsx8WaySmYsTRfGWpPzerjlys6mf9W6z9
         7MQu28uGR+vExcu4XcFzxZsCEsEyIZnW5XYihpKw20TjtS/g7K7vcnSmLO9Y2I2ACMbR
         UKd7mEwngqjuWYnzl9qMnEhgnX2KVdsQpg9XPqLIZZY/9EZaReISvH0tgX5LHWCxTzuH
         Sdb0djgaeTc7Y2XT2pWCZ+vec+pYHc73GLTjZ8LH4FVsFHxU1dJtwXiD8faH/K6Piqjx
         Qz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=7Y+cJY1xhd0yBpcec7AzD+9evfVDrwqprX0erT9gNQ8=;
        b=uG6T+RLDbtgQaz2HcWS0+bt7STDJljwmf/l6BxIAYNKfC8NXchIfyWXGhx5yGcmGI+
         IurQUNsxpD/jgtqPN8lSJt7vLArKeJVGgzPZlJSX+mauKsSd68a37bZNjHt1fa8jMZzb
         eA0nNGhjzU79iN28Er5d1HH7wM0651u/11Ic8pTmXpsIiHVCCWe1h+1tErwutRKbcKHJ
         4hudgWeD5hKP1RfB50md6wZJ3qPsLofj2FBqFo+qWGHNcmAaZaM8Mv1X5dMgAqeiQqrT
         abXEy9mVHsR9GA0ngdPmLsB1kIxSZIu4wDzMWiwjAMkHA4ID7GnqIe5gZINBE9GD9489
         JmlA==
X-Gm-Message-State: APjAAAXe+OgG5U07HwIBe0+1KzD3GiJXEqwnQV1CUojIB3JfZ9+5A7Lz
        55C7i6MjAOwSfZ6Tz6LKrLyYkA==
X-Google-Smtp-Source: APXvYqzg/cYWhjYHl3Ki3ZAih+ex/42KJTx6ZAw8WelCuco+qFvVUewpgAxMMsdmClIjS/CcngZCgg==
X-Received: by 2002:a05:6214:9d2:: with SMTP id dp18mr19624941qvb.98.1580177515237;
        Mon, 27 Jan 2020 18:11:55 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id m21sm11036189qka.117.2020.01.27.18.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 18:11:54 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Mon, 27 Jan 2020 21:11:53 -0500
Message-Id: <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
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
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com>=
 wrote:
>=20
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
>=20
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page=

> and validating them.
>=20
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
>=20
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along wit=
h
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to=

> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 an=
d
> arm64. Going forward, other architectures too can enable this after fixing=

> build or runtime problems (if any) with their page table helpers.

What=E2=80=99s the value of this block of new code? It only supports x86 and=
 arm64 which are supposed to be good now. Did those tests ever find any regr=
ession or this is almost only useful for new architectures which only happen=
ed once in a few years? The worry if not many people will use this config an=
d code those that much in the future because it is inefficient to find bugs,=
 it will simply be rotten like a few other debugging options out there we ha=
ve in the mainline that will be a pain to remove later on.=
