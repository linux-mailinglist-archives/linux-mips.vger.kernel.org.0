Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61892EE7FB
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 22:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbhAGVw0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 16:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbhAGVw0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Jan 2021 16:52:26 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6EAC0612FB
        for <linux-mips@vger.kernel.org>; Thu,  7 Jan 2021 13:51:41 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 11so4851534pfu.4
        for <linux-mips@vger.kernel.org>; Thu, 07 Jan 2021 13:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gkilXEcZuToD5vPEj+Iw2iyngHBEJ9jViAa6mux7/AE=;
        b=PnZqIrWhxcDfjmbGE75JBePgC4PFM1qGfPEhfhbT1bTzuSG6DEasZacDbvCKVBdceT
         T7zD6Zk+UVtji3j4dz5CGa/MDJC13QJ8zpkOon95bTSuKXsjnS9GueP4eo2zO3kxj2Ym
         uryPmXHf06rD6C34hfBrb7YcB9PLp2yQ/pERM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gkilXEcZuToD5vPEj+Iw2iyngHBEJ9jViAa6mux7/AE=;
        b=dA3PLDxMAmuWLKcTMXh9TOqniikUcNDEBhxmoUcm+zuwoG0J1a0RKLpUioNGrfSAWn
         P2lFR6uBb9KOSJEs2Wd4NBEB3JIXoCiSfopnwRh6F0Uzd5nC6HvRraB6DoWlQlP7x25a
         wmvTY/PyEaoH/8hg13jpdE6z7RYljwg0zjEe3oIdajTxEc2HBHv0Z7+wqTlDjzANyjNe
         3uhRmRdHYHkwE51pcAhp197/CySLMNQQmIe9k9MxgT5agjZ/htsI+CVn0puVCDsjMhyr
         RZ6JR8Yi2l0fZekPVzIDB2vGITZV9voko1qWwKe275tTvHLwBbMg/2cm4aeFg/m0y9lM
         SDjQ==
X-Gm-Message-State: AOAM531NezgJUBSNvqVh3SNcsLhshZBy/vS84P+kWwaWN9EgVAy8ZUe/
        xyEmeuwHEQNwM2j2vbu2yGoNHw==
X-Google-Smtp-Source: ABdhPJx6Eiyate0dX5kPVmbgfsXZh+4uKr25slbHDdvfM14FtVTlDHkX0SOnxAtoGtlNnD3KkF2iYQ==
X-Received: by 2002:a63:eb0c:: with SMTP id t12mr3820364pgh.7.1610056301288;
        Thu, 07 Jan 2021 13:51:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b6sm6608979pfd.43.2021.01.07.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:51:40 -0800 (PST)
Date:   Thu, 7 Jan 2021 13:51:39 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Pei Huang <huangpei@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Corey Minyard <cminyard@mvista.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, stable@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v4 mips-next 0/7] MIPS: vmlinux.lds.S sections fixes &
 cleanup
Message-ID: <202101071351.1CFD6D8@keescook>
References: <20210107123331.354075-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107123331.354075-1-alobakin@pm.me>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 07, 2021 at 12:33:38PM +0000, Alexander Lobakin wrote:
> This series hunts the problems discovered after manual enabling of
> ARCH_WANT_LD_ORPHAN_WARN. Notably:
>  - adds the missing PAGE_ALIGNED_DATA() section affecting VDSO
>    placement (marked for stable);
>  - properly stops .eh_frame section generation.
> 
> Compile and runtime tested on MIPS32R2 CPS board with no issues
> using two different toolkits:
>  - Binutils 2.35.1, GCC 10.2.0;
>  - LLVM stack 11.0.0.

Nice! Thanks for hunting down the corner cases. :)

-- 
Kees Cook
