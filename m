Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59592F1FE4
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 20:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390986AbhAKTxP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 14:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389694AbhAKTxO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 14:53:14 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB29C061786
        for <linux-mips@vger.kernel.org>; Mon, 11 Jan 2021 11:52:33 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id w1so399398pjc.0
        for <linux-mips@vger.kernel.org>; Mon, 11 Jan 2021 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b3ASHNv4fQafYtJYhutvA+h2vhozaX/2DMehAnSz5ag=;
        b=dW6jgffvZLGUy04LN8THQEQVkw8PZoYf7VCu8HYZ0EbxlMOQa0n1xsd3ykJxC8dkU+
         2r63KPURs47LuomEfnIVbg/C6LlHNcg/yMHwtGt0A6ILr1p49332svKJcVIPu1R1xiLM
         4/+kG3X8WNUNmKnN2u8p+saFA3f0T8Vw4ueAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b3ASHNv4fQafYtJYhutvA+h2vhozaX/2DMehAnSz5ag=;
        b=NuQy+bd8W/7FVhDK0W20Xy1xU+hGiTHxK2CsaYr5P2XJsEcv9lqByhsTL9sJ1PFIqA
         zKoT3Sqa8FeOgITpLCbS+9vIxhIeiN+zZebj4kNB1AKLOdazV4S4u8OJc34RXW4HQtVa
         Su3XDIyfd/R0qWoFnKCWMNHGxqzov7HQAzMHocTjNTgST3y9hWwxX5eHRsWjNqH+I6o0
         8T0UBSIUjj0rsXKm5Z3M3wnHqgFJl9bMOtUwxehPYAU1ISFP6RK3bcoWk3cdw1zIqHfP
         bgKofkM/PtLdrl2wmJlxPNGO8XX8hjdWbIV2ZQArqJLA5cH+rVwInkYwkGsQbbwPsRa8
         Yyww==
X-Gm-Message-State: AOAM5329Aj7G5hntmQXiu/qKah83dKZvidAJh1nPJV8pykH+kZTVP3Uh
        FQruLT7wD0WeKVsaC2PZZfVayQ==
X-Google-Smtp-Source: ABdhPJzY/E1MTdTcsgHlXSz53z7Qe5MDkWrc4R6K55+zVZdVCYMLpf+kLnTKc8vOT3KmQRbGPlNpmg==
X-Received: by 2002:a17:902:5997:b029:da:a1cd:3cc2 with SMTP id p23-20020a1709025997b02900daa1cd3cc2mr916063pli.80.1610394753608;
        Mon, 11 Jan 2021 11:52:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d10sm420631pfn.218.2021.01.11.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 11:52:32 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:52:31 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Ralf Baechle <ralf@linux-mips.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH mips-fixes] MIPS: relocatable: fix possible boot hangup
 with KASLR enabled
Message-ID: <202101111152.CBF4BEDB@keescook>
References: <20210110142023.185275-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110142023.185275-1-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 10, 2021 at 02:21:05PM +0000, Alexander Lobakin wrote:
> LLVM-built Linux triggered a boot hangup with KASLR enabled.
> 
> arch/mips/kernel/relocate.c:get_random_boot() uses linux_banner,
> which is a string constant, as a random seed, but accesses it
> as an array of unsigned long (in rotate_xor()).
> When the address of linux_banner is not aligned to sizeof(long),
> such access emits unaligned access exception and hangs the kernel.
> 
> Use PTR_ALIGN() to align input address to sizeof(long) and also
> align down the input length to prevent possible access-beyond-end.
> 
> Fixes: 405bc8fd12f5 ("MIPS: Kernel: Implement KASLR using CONFIG_RELOCATABLE")
> Cc: stable@vger.kernel.org # 4.7+
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
