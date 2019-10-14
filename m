Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9F3D67EC
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 19:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfJNREf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Oct 2019 13:04:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42679 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729900AbfJNREf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Oct 2019 13:04:35 -0400
Received: by mail-pg1-f193.google.com with SMTP id f14so5337939pgi.9;
        Mon, 14 Oct 2019 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n/I1tVzEHS6pyPJoUPz4zmjBgF6u/gO332wS+Ob4sgk=;
        b=X71N/mhkPQlqHWjqxVXffTOIjUSENPiZ2PEDEWcKonDRymcpUScdWomGeq6ejOQUnF
         MjjkxiphZVq9y9n4/r9FxqZxokdjo8qD/f1NmhrvrVp9ti1szVInFc/D9Kr/sZI0GZcO
         dbHh0GOI/UlNEjukQyBiOn0dB0wnu60JydxGFxoboxYdmRC/kuUAcCCPR0913aXj3F58
         A/b6PY69lWNruKFsL27rT7Jff1HxmG3JCcC7XafvDtU0MiDiK9LqEAYueoJlHCP9i/0A
         v50yrOFxUSyHRbPOrT0Zwgv/vfklDFSr4Y4cxFG+2ew6ferWCPzj/OkgWLobc/ppVP1f
         9s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n/I1tVzEHS6pyPJoUPz4zmjBgF6u/gO332wS+Ob4sgk=;
        b=h10bnqTtvxEDac/C/rooPm6fkrE+GC3kyS74xn3GoxIjJetQePJ+rlHUfxPpTiLznb
         o7F1faqzOE/MF/Gh2NvVj6a7o6aYAscc5yRTk2t3xl79xHo2wMzbCp0bTDEs7/SYbmln
         6n/UnhOvymanK0Y5ieFfgMPBS1Sc06EyzdRWvQXjewePC9MteYM2PJy0qnB4Ac2yCqb4
         kuITAniL3ExEEDLHs91UUJyq3M8dECP8D8xJLHLWGQ7TnS+zf/cMCcsafIl8OE7Q5hgW
         DQQ8pZ+g0VqqLGryLCFAPgxQ2wYyt7bLxKwLBe468RJsc5WlSkmgMWWLeOPeY9+uE6iU
         3Dfw==
X-Gm-Message-State: APjAAAUKr+D1PLSf+4L5Rv33n6oGblUw+d7XD102DdjMHHXV50ROo8NM
        5QGIHBKi+o6s5Vh4zs/M7I8=
X-Google-Smtp-Source: APXvYqyWIlGqmcwCMd78vdOyECLPKhULsHip7DNsb6KkOVzbAMePLqfNtjmAzmRFhuCvqT9NoNVmKQ==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr8737374pgk.205.1571072673905;
        Mon, 14 Oct 2019 10:04:33 -0700 (PDT)
Received: from gmail.com ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id c10sm18544111pfo.49.2019.10.14.10.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 10:04:33 -0700 (PDT)
From:   Paul Burton <paulburton89@gmail.com>
X-Google-Original-From: Paul Burton <paul.burton@mips.com>
Date:   Mon, 14 Oct 2019 10:04:40 -0700
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Subject: Re: [EXTERNAL]Re: Build regressions/improvements in v5.4-rc3
Message-ID: <20191014170440.mvwgnj4stpeuzzey@gmail.com>
References: <20191014063507.5131-1-geert@linux-m68k.org>
 <CAMuHMdVm6WMQARNKyFEWybJHySJK0NSWEiy+Y=yXSwTsZrcXVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVm6WMQARNKyFEWybJHySJK0NSWEiy+Y=yXSwTsZrcXVA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert, Greg,

On Mon, Oct 14, 2019 at 09:04:21AM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 14, 2019 at 8:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > JFYI, when comparing v5.4-rc3[1] to v5.4-rc2[3], the summaries are:
> >   - build errors: +1/-0
> 
>   + /kisskb/src/drivers/staging/octeon/ethernet-spi.c: error:
> 'OCTEON_IRQ_RML' undeclared (first use in this function):  => 198:19,
> 224:12
> 
> mips-allmodconfig
> 
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4f5cafb5cb8471e54afdc9054d973535614f7675/ (232 out of 242 configs)
> > [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/da0c9ea146cbe92b832f1b0f694840ea8eb33cce/ (233 out of 242 configs)

I believe this should be fixed by this patch:

  https://lore.kernel.org/lkml/20191007231741.2012860-1-paul.burton@mips.com/

It's currently in staging-next as commit 17a29fea086b ("staging/octeon:
Use stubs for MIPS && !CAVIUM_OCTEON_SOC"). Could we get that merged in
the 5.4 cycle instead of 5.5?

Thanks,
    Paul
