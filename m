Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE528A763
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 21:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfHLTlB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 15:41:01 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:45645 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbfHLTk6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 15:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bllTEPdtYxFtEj5i4vB0U6tjHTx1DsMUqgajDbKwJCs=; b=wIN/hM1Ra2zXHsUAj9TM68eii2
        WCD1q6LSiG42b3R804suuUOy9c10k1jGRjVIQSwRVCcgHDkLbaLsqzKL8yUB1fmHVK8KVi/+0cuWm
        4hmYvOQQzaStNxQdcWiIRGgmqJyeH/51BWi3X1O/0PWyqny9C5DvLDfMhi1WAth9qdvY02pfNWbEY
        7zjv4/lyE/9c9df3rXfqi/7LerycDdFfC0eOOlboygz+X1DSKCvdMypOCSZGNZtezHCAwy4XVYjyD
        zxciiXUk8mogm+0j1PYKym52ZPii4BjH9LF4husQeG7sMG9/muVLGU652CuNo2kln2nZ48jknVH7u
        nVh3UR+g==;
Received: from 87-92-99-237.bb.dnainternet.fi ([87.92.99.237] helo=[10.0.0.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jussi.kivilinna@iki.fi>)
        id 1hxGBV-0007yR-Qo; Mon, 12 Aug 2019 22:40:49 +0300
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>,
        gcrypt-devel <gcrypt-devel@gnupg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
 <ec4666a6-c7db-247b-de81-bb784bb9d649@iki.fi>
 <20190812171448.GA10039@archlinux-threadripper>
From:   Jussi Kivilinna <jussi.kivilinna@iki.fi>
Openpgp: preference=signencrypt
Autocrypt: addr=jussi.kivilinna@iki.fi; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1ba05172-500b-6b42-00ad-27fb33eff070@iki.fi>
Date:   Mon, 12 Aug 2019 22:40:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812171448.GA10039@archlinux-threadripper>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 87.92.99.237
X-SA-Exim-Mail-From: jussi.kivilinna@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

On 12.8.2019 20.14, Nathan Chancellor wrote:
> On Mon, Aug 12, 2019 at 10:35:53AM +0300, Jussi Kivilinna wrote:
>> Hello,
>>
>> On 12.8.2019 6.31, Nathan Chancellor wrote:
>>> From: Vladimir Serbinenko <phcoder@gmail.com>
>>>
>>> clang doesn't recognise =l / =h assembly operand specifiers but apparently
>>> handles C version well.
>>>
>>> lib/mpi/generic_mpih-mul1.c:37:24: error: invalid use of a cast in a
>>> inline asm context requiring an l-value: remove the cast or build with
>>> -fheinous-gnu-extensions
>>>                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
>>>                 ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>>>         : "=l" ((USItype)(w0)), \
>>>                 ~~~~~~~~~~^~~
>>> lib/mpi/generic_mpih-mul1.c:37:3: error: invalid output constraint '=h'
>>> in asm
>>>                 umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
>>>                 ^
>>> lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
>>>              "=h" ((USItype)(w1)) \
>>>              ^
>>> 2 errors generated.
>>>
>>> Fixes: 5ce3e312ec5c ("crypto: GnuPG based MPI lib - header files (part 2)")
>>> Link: https://github.com/ClangBuiltLinux/linux/issues/605
>>> Link: https://github.com/gpg/libgcrypt/commit/1ecbd0bca31d462719a2a6590c1d03244e76ef89
>>> Signed-off-by: Vladimir Serbinenko <phcoder@gmail.com>
>>> [jk: add changelog, rebase on libgcrypt repository, reformat changed
>>>  line so it does not go over 80 characters]
>>> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
>>
>> This is my signed-off-by for libgcrypt project, not kernel. I do not think
>> signed-offs can be passed from other projects in this way.
>>
>> -Jussi
> 
> Hi Jussi,
> 
> I am no signoff expert but if I am reading the developer certificate of
> origin in the libgcrypt repo correctly [1], your signoff on this commit
> falls under:
> 
> (d) I understand and agree that this project and the contribution
>     are public and that a record of the contribution (including all
>     personal information I submit with it, including my sign-off) is
>     maintained indefinitely and may be redistributed consistent with
>     this project or the open source license(s) involved.

There is nothing wrong with the commit in libgcrypt repo and/or my 
libgcrypt-DCO-sign-off.

> 
> This file is maintained under the LGPL because it was taken straight
> from the libgcrypr repo and per (b), I can submit this commit here
> with everything intact.

But you do not have my kernel-DCO-sign-off for this patch. I have not
been involved with this kernel patch in anyway, have not integrated 
it to kernel, not testing it on kernel.. I do not own it. However, 
with this signed-off-by line you have involved me to kernel patch 
process in which for this patch I'm not interested. So to be clear, 
I retract my kernel-DCO-signed-off for this kernel patch:

  NOT-Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>

Of course you can copy the original libgcrypt commit message to this
patch, but I think it needs to be clearly quoted so that my 
libgcrypt-DCO-signed-off line wont be mixed with kernel-DOC-signed-off
lines. 

> 
> However, I don't want to upset you in any way though so if you are not
> comfortable with that, I suppose I can remove it as if Vladimir
> submitted this fix to me directly (as I got permission for his signoff).
> I need to resubmit this fix to an appropriate maintainer so let me know
> what you think.

That's quite complicated approach. Fast and easier process would be if you
just own the patch yourself. Libgcrypt (and target file in libgcrypt) 
is LGPL v2.1+, so the license is compatible with kernel and you are good 
to go with just your own (kernel DCO) signed-off-by.

-Jussi

> 
> [1]: https://github.com/gpg/libgcrypt/blob/3bb858551cd5d84e43b800edfa2b07d1529718a9/doc/DCO
> 
> Cheers,
> Nathan
> 

