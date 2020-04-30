Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BEF1BEE80
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgD3DGd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD3DGd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:06:33 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49469C035494;
        Wed, 29 Apr 2020 20:06:33 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e26so3726876otr.2;
        Wed, 29 Apr 2020 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ABv9ETxmWVKZEO3VSo8L3zhU3G/XlY5BsKo9f2kZ5Yk=;
        b=mZoGzVoKLbQZAxzfUkp0A91eCDYoyBo8tHgMZV9uN7sK3XWYShi7wxaVwXbuCiN5fJ
         NukUVJE5MHc4z8TFMm3C+6yAunEEJOpVwPE5AkNEfzDK2SkwyegmWVH8V7v/1iIBKvxw
         qaDY7lJ8DpfUVK254Ura1XH+64gYYj02730nA4RGOQxi4LtXxctSvVj4GNcjhKxdyRPR
         xFJAs+D/QkQPQDV23ozNTuFsZKJ3T+lyGNSYPym6wTGWh26XUKva4V74yLUeD7cHGidO
         0kTWYjRw+2o9mYL8FohVs9oorCj/vwoAN8ZvFIOxEAyKUOIC99qtSF0Pg1w4/HS1Tc6R
         4cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ABv9ETxmWVKZEO3VSo8L3zhU3G/XlY5BsKo9f2kZ5Yk=;
        b=esFK1IRmrH547eUp+n8QfXuIrh15Yio395gqVqx3xn7FyKcYmFarEULryWJE5zeZRg
         AJaRzZdaDp3+Rj/3crotM8QSO7KNPeAmEGtNpaOcZKd+REPWvVqSRgI5Go/2pSWc3v3y
         w24SNyhYV88aqvGUswhCWSMw8pTT3FUnc3wZloaDEps/yP/n5/pqXqi7NRHVumwQ18wO
         QP6vyjCl8H3QZR2BrFOjjdjShhgicpAbQqqi+Yj/RstqXrlviPDJlljPChVSD+Ib92s5
         n458tuFJjssUJ7i+hZRoMQrkKis9WdpumNyJmubL9Y6ymdEea/QoA+Tv2MlnD+i2/bmv
         LGew==
X-Gm-Message-State: AGi0PubXntyjEBuJZyOmv2OUBlx/xsSUAwpMWNUjbm7Cyc9YyaZvLC6Q
        O5rn4baarwhJPnLmG9+HYm4=
X-Google-Smtp-Source: APiQypJdF1+JvYVFI/vROWk4KVS2q/2HHbebeqzLzbQt3+P5rUWAys5TcAJJKZ41KrVgBNtXSVSrtw==
X-Received: by 2002:a9d:2622:: with SMTP id a31mr926767otb.231.1588215992718;
        Wed, 29 Apr 2020 20:06:32 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 94sm878669otc.72.2020.04.29.20.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 20:06:32 -0700 (PDT)
Date:   Wed, 29 Apr 2020 20:06:30 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Message-ID: <20200430030630.GB3546299@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUVz8zYVY3rgT4hS6a11+1Pw6y_Du-hkPra1PkgtLWgRbA@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 09:04:42AM +0200, Sedat Dilek wrote:
> On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> 
> > Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
> > ld.bfd checks.
> >
> 
> Is it possible to introduce and add LD_IS_BFD Kconfig for ld.bfd in this series?
> Most people agreed on this name AFAICS.
> What do people think?
> 
> - Sedat -

What is the use case for LD_IS_BFD right now? I am not sure I see a
reason to add a CONFIG value that won't see any immediate use.

Cheers,
Nathan
