Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CA41BEE95
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgD3DOH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3DOH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:14:07 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDE1C035494;
        Wed, 29 Apr 2020 20:14:06 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m13so3720110otf.6;
        Wed, 29 Apr 2020 20:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yk1qx7mYE1aZnTKQ+ngsNAgl6tNY8Bqpu8zbakapxPY=;
        b=pfNtPjRJB+VgiWI1sFo3jsPx5ELnGl5bbTk2OiBRmTGNxm1CnegCV3D1vwO19Ihb6x
         cJpWE4dFUB60feCcEZ5sbt+d5HK6RnuNeLYtf24lfEfk34Tn4kd+0qntQo5aWr/p+hSO
         ZmyxwyrdegOcE2YNSoCsw6nTSmPNqySgc1IEwpPvGglbjmvFuPrxbfKGIKJdT5ly1eKm
         RJkGgTNpW0vQesq2SMbqO5deWGupAsoy9MZvLHDYmxaDjee53w4gDUw+bSPNbP0L6kgW
         rL1h2R9x6uFFteENfvXSC0/3489+TEU2kNXwlvFoD8fygGjxdsU3JowH5/pdBE/iWccA
         dZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yk1qx7mYE1aZnTKQ+ngsNAgl6tNY8Bqpu8zbakapxPY=;
        b=T+tt8tDEZKur2PAlZPY2xZ5DEBzqtNvXYQihZyQQyqPhWmMr/mY40/OTlEdwsm6Uy1
         ICWy3fgxTh26e4xdaIngeJyFu/CYWU7QU0QUqx3k1hiFPJJ3AT6muW9c1TVLRn7UK7HC
         SeiUnFXCRynABPWETZPJ9wr8dbICgYREUuyYeEFFgOGk2nV8QacA65935DIsmj0sRCyG
         LcLJVtkybzklgZXmdJOxzA+upr+qfRLTq0DT3LBf1JV7cBthttIvS1OmtIR+doR3FLAq
         dlzQi5Et9O+SmcPV1sX//nnKOe2x6eZfy5zX+15qGL97BwXN9FBa12heqypuBNCVgt5u
         Ef+A==
X-Gm-Message-State: AGi0PubItbqfCx/UqEawasKrqKO45vvb99yN274xp8lbARpmD2tBEwGj
        bx1++sP2lP8vnf8t6QQMQHU=
X-Google-Smtp-Source: APiQypIIgBYyvGVoHuVIWd9zg2/PJZtEbMHkINz6I8nJIe9AwwaCkdpNZVH9FH/Zj7GiU25mXOaaYg==
X-Received: by 2002:a05:6830:1188:: with SMTP id u8mr891347otq.360.1588216445527;
        Wed, 29 Apr 2020 20:14:05 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t26sm914093otl.71.2020.04.29.20.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 20:14:05 -0700 (PDT)
Date:   Wed, 29 Apr 2020 20:14:03 -0700
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
Message-ID: <20200430031403.GC3546299@ubuntu-s3-xlarge-x86>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
 <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org>
 <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
 <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 06:46:33PM +0100, Maciej W. Rozycki wrote:
> On Mon, 27 Apr 2020, Nathan Chancellor wrote:
> 
> > >  Can you actually record in the change description what the difference in 
> > > the relevant link command is, as shown where `V=1' has been used with 
> > > `make' invocation?
> > 
> > That will be rather unweildy to put in the commit message since
> > currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
> > really desired. Otherwise, I can just put it where I put the changelog.
> 
>  Umm, is the difference so huge?  I think a note along the lines of:
> 
> "[...] This change adds/removes[*]:
> 
> <part of the command affected>
> 
> from the invocation of [...], which is required for [...]"
> 
> -- only quoting what's actually changed will be sufficient.  Reword as 
> required.  Otherwise it's hard to guess now what the change actually does, 
> and it will be even harder for someone who comes across it and tries to 
> understand it the future, when the context might be hard to reproduce.
> 
> [*] Delete as appropriate.
> 
>   Maciej

I ended up figuring out a way to get the difference proper into the
commit message in v4. Please take a look.

Cheers,
Nathan
