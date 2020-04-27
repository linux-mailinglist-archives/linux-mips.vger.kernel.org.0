Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE04A1BB1F9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 01:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgD0XYK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 19:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726204AbgD0XYJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 19:24:09 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79EEC0610D5;
        Mon, 27 Apr 2020 16:24:09 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id i27so29439210ota.7;
        Mon, 27 Apr 2020 16:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3NvGKWCvX9120+4SFSj7x6CopUI9oxRRZeaZqM3V8Fs=;
        b=SIcBei/ItMBM8AJd3BzmaYwepbjkhCNF+8xVAmjd3nGLvxtN5+De2zwJPLWUtFWWpT
         K4o55HtTZGm7D5XH8S85AfUilD2oH4X9f/wPo8nOJ1sWhDvoo3enLNyQs57eT0/v7yGH
         Uof/vmXGg14a2xxDdVPWVmKe20k1NZCv5KXUiCfxiQxaFD6qldoWM5Ua7ouGl1v28sCd
         TNCkBKcMyHrw6VpFNrnl60qmZfPVWXsy80hOwutKewAXy+uVu/Ng8p4Ej801UezokVms
         FutO9avZhq7OHf1mGLiWT2hHk8bBV73CBY3uJC8LjUgI/Gc/cotqn0SwqBKuz7xzyOcU
         e3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3NvGKWCvX9120+4SFSj7x6CopUI9oxRRZeaZqM3V8Fs=;
        b=IM/jBaF8sRqCmGEzEvleKslrlYxG4N59VAvQJSBVjgR/Hp7HA4E8tBlv3vcfP5Jbc/
         0g/1iLrTGoFiODG+jq9UdLCYE6+4gvfE41AHviTIKD2j753cUgF0WWzeUQPc3aSXw8Za
         niuIIurZmXVgcSlaM7oF6Bso3rrGRpDTQL+sR7tUSDUi3dw/sV/vbePZ3Ol5D/3PF9Mz
         bocPGDSWy/65+4JMSdRQr4s64p5WK4efq0uohvxTzFH8apAwTcTZfs4up7Jrf7pE3zcW
         +8vLaWWtUShOJEmPKIc5kYbUEl3gJ+dK1eQwDvUzzwohMVpz7Lee2OpYBZjQX1d2KWQG
         tf8Q==
X-Gm-Message-State: AGi0PuaM9arfmnV0aUXkqQmWt/0dgOvQSbm/+TKEKsb1ZS3zPdZj7Y7R
        qDpkJXhuez7EB8m2Gb5ovK4=
X-Google-Smtp-Source: APiQypKAyNo+CaSnexEEHLOEPVodWBBWv6kYHOWfmuv3W1Q34xaWYa8BHOWz534p7aujUy0y55E2lg==
X-Received: by 2002:aca:4dca:: with SMTP id a193mr939911oib.90.1588029848995;
        Mon, 27 Apr 2020 16:24:08 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id u9sm3613337ote.47.2020.04.27.16.24.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 16:24:08 -0700 (PDT)
Date:   Mon, 27 Apr 2020 16:24:06 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
 <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 27, 2020 at 05:22:53PM +0100, Maciej W. Rozycki wrote:
> On Sun, 26 Apr 2020, Nathan Chancellor wrote:
> 
> > > this causes build errors for me when (cross) compiling a big endian target:
> > > 
> > > target is little endian
> > > mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> > > mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o
> > 
> > Thanks for the report. I will look into it tomorrow and hopefully have a
> > v4 by then.
> 
>  Can you actually record in the change description what the difference in 
> the relevant link command is, as shown where `V=1' has been used with 
> `make' invocation?

That will be rather unweildy to put in the commit message since
currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
really desired. Otherwise, I can just put it where I put the changelog.

>  Actually running `diff -bu' on the whole `V=1' build log obtained without 
> and with your proposed change applied and ensuring there are no unwanted 
> changes elsewhere will be a good measure of the correctness of your patch. 
> You may have to prepare to be patient and run with `-j1' to make sure any 
> `make' parallelism does not interfere with the order of commands printed.
> 
>   Maciej
> 

Thanks for the input, I will take a look.

Cheers,
Nathan
