Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836261C26A6
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 17:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgEBPts (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 11:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgEBPts (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 11:49:48 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74754C061A0C;
        Sat,  2 May 2020 08:49:48 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id z17so5079296oto.4;
        Sat, 02 May 2020 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YFLGdaK8ZF69V+GYnZxD8CHXgCZJmtXf2cpemCzs92s=;
        b=I+skLHrwwAZntttQRxFlOc6v5AmWkxRLjUkUiqLaGpt2bi9yETeapq26EsESm672iw
         faTQpAAv2koRXPoo6NYE3JgXRq9P7OH/t9g79EfSle/DtAiBvOWM4oGaCiHMLGX8TjGu
         xNjbUhdWhrAUy82jQ9OX0UeL5kr+MvWrBc6ab5Nwi0SAxlNhu9mQFEca35YhMAJEOGMW
         95YduiFqEhWx5hadBJ5XZigfpVT+OFZlJnemnuNnYjvoLQpzL6jBAIwTk6bV2c38bjZS
         9+Q7km7NYv8WkRZ9+/Hsa3jWnoFPhjJ425vNF69pG1eVo5mVzrs7n3lTCTaXCmw+5Lle
         afHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YFLGdaK8ZF69V+GYnZxD8CHXgCZJmtXf2cpemCzs92s=;
        b=ABeciLTQRbuubkbI8ZeUZmJfCYritiT2bQ5Wkrj3lO77lrpLKuBPvdmNLQImMVS5FZ
         SmvRiQN1mJ8Q8jnxcNxT/BMf02rUNsfHDQHs6l7zwUxMtpwxTQ7BbTxbpzSpM6S+PB2e
         IukwDVHHfjIV5AWHPL7c1GW2WhmLX16z+4FS/I6/yG3cU/6WlDoUy65AaxewrHRKr40d
         I1bW4C4R94By16aJZUwDoPuN7jC4EAXCiD29EQlhrnd7yBoi9ngivJ69YKjsAUGsyi54
         iflJXrCtOVHJ7Zk+OJyNt/U7gJFU1FdOka34cag+L8wjAqCRsOZHBcbaIKTil91k7Hgq
         Xrsg==
X-Gm-Message-State: AGi0PubjRnjDhD+UUafPkDveU+hOO0OcRK29En913gTyDCRnGIZFwL+f
        9gI0cJ/oQRJtfRgNbaz54sc=
X-Google-Smtp-Source: APiQypJ8pMvKTZX4O7Wtt5TIxMDsB/13FMZS0UCgg4w5yGhpjEbfRzVT3xjeC77EzbMh2SuNNJiDlQ==
X-Received: by 2002:a9d:2c1:: with SMTP id 59mr8028014otl.321.1588434587846;
        Sat, 02 May 2020 08:49:47 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id v207sm850483oie.3.2020.05.02.08.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:49:47 -0700 (PDT)
Date:   Sat, 2 May 2020 08:49:45 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200502154945.GA3361319@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200428221419.2530697-5-natechancellor@gmail.com>
 <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2005021435100.3602499@eddie.linux-mips.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 02, 2020 at 02:50:34PM +0100, Maciej W. Rozycki wrote:
> On Tue, 28 Apr 2020, Nathan Chancellor wrote:
> 
> > Before this patch, LD=ld.lld did nothing:
> > 
> > $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> > String dump of section '.comment':
> > [     0] ClangBuiltLinux clang version 11.0.0
> 
>  What does it mean "did nothing", is `arch/mips/vdso/vdso.so.dbg.raw' not 
> produced?  Where does `arch/mips/vdso/vdso.so.dbg' come from then?
> 
>   Maciej

A better wording might be "Before this patch, specifying a linker like
ld.lld via the LD variable was not respected by the MIPS VDSO". I should
also probably expand on the second paragraph, maybe something like:

When clang is built in a default configuration, it first attempts to use
the target triple's default linker then the system's default linker,
which is almost always ld.bfd. To use ld.lld, '-fuse-ld=lld' must be
passed to clang. However, we do not use -fuse-ld=lld because it can be
brittle and we have support for invoking $(LD) directly because we have
separate compilation and link steps. See commit fe00e50b2db8c ("ARM:
8858/1: vdso: use $(LD) instead of $(CC) to link VDSO") and
commit 691efbedc60d2 ("arm64: vdso: use $(LD) instead of $(CC) to link
VDSO") for examples of doing this in the VDSO.
