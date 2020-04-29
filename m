Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADBA1BD57A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 09:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD2HNx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 03:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgD2HNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 03:13:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E414DC03C1AD;
        Wed, 29 Apr 2020 00:13:52 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so1143063wrb.8;
        Wed, 29 Apr 2020 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=bESRUmFeT/i+wUL8WK/yLfymk/xA+kTtjWFkp0CqAW8=;
        b=euN+9RzhF6FM2/xNztgL02K4nyLU6S04I4mxL23lUU9gvcO5iiLyYv2pNX7grjDZf5
         JBVt2pOBlJRQoS0Yeo/ZJihJ4SoBk/VqO68Gc2YpjcOwJpYEGtHBWu14/xAqwT0LY/7m
         lT4hCkID1sE43hO+gVAFLbEv4603nDa8eHWL8S0sQgOLNv+i0YJer+9xGytDpc5tzBFH
         58ns7DzeZAn3FnusQTcm7u7hiypuYwXGA/tUwJG2bOXloEKaoFGyWYeqs38CM3xNG0c0
         6YDKfiDZb8k7wCOvQ1tmZBVn8KtS/JV0m1vek8s3KhXk3txQxInUrQk76j0GJ8lTSzOr
         tywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=bESRUmFeT/i+wUL8WK/yLfymk/xA+kTtjWFkp0CqAW8=;
        b=NWmJfvgic3GpS7KeRo5/oqSsjSyPxZmVWBymoz6eAam5jx2mkaMW/qeRl2mH2Zgf1B
         FCS2RYhfaxyFBRXmySilqKu/Z16J6iZpZfhXPvddqhbv7otwda+HcRVU/7b7vYNxWHKw
         pruNtyMHlAf7Ie0YIC+qQZmiLbgk3aj5euWwrrDLUxxTz13aPF1jF+bMOhKSNSxWm1Ul
         Mz3j2ahWttVy9ZPJb+2JabpdjCMZj/zUqECAJHdJyWfVLESyXlq8bnBe8qniD21Q0VQt
         H9j29CTyhLL6OH63Us5FePywWF0b6OQNG1xJW1MgoFlgeVVsA5EGUGlTed/oLVugEWaO
         4ZmA==
X-Gm-Message-State: AGi0Pub/xgDNa/WnrRbD7SGWg2K42qiNbBCZchHEOaCyETd1WuDTpBRg
        rYmjtA0m1/lF3VltG7QTbXIC6gCzhgSRj8ckXP0=
X-Google-Smtp-Source: APiQypKc5/ik+nedYkYPb1BQgKW/GUUQn8GHTKpqnSwd3bPLfBiw3Cy07kEUnVR0pY7OQ3V0eyn+fsGhOyhFJZNP95Y=
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr40152710wrw.73.1588144431555;
 Wed, 29 Apr 2020 00:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com> <20200428221419.2530697-2-natechancellor@gmail.com>
In-Reply-To: <20200428221419.2530697-2-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 29 Apr 2020 09:13:40 +0200
Message-ID: <CA+icZUXa3JBittjDVdNyV1M08dRt_pwACi2-0nLPEwao6yNABw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] kbuild: add CONFIG_LD_IS_LLD
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 29, 2020 at 12:14 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
> specific logic such as ld-version or ld-ifversion and gain the
> ability to select potential features that depend on the linker at
> configuration time such as LTO.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> [nc: Reword commit message]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Testing on Debian/testing AMD64 (since Linux v5.3):
#1: LLVM/Clang/LLD version 9.0 and 10.0
#2: Debian's GCC 9.3 with ld.lld-9 and ld.lld-10

I am linking my Linux-kernels with ld.lld despite there are issues -
then check with ld.bfd.

- Sedat -

> ---
>
> v3 -> v4:
>
> * No changes.
>
> v2 -> v3:
>
> * Add Masahiro's ack.
>
> v1 -> v2:
>
> * No changes.
>
> Sami, please scream if you are unhappy with how I worded this commit.
>
>  init/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 9e22ee8fbd75e..c15ee42b82726 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -23,6 +23,9 @@ config LD_VERSION
>  config CC_IS_CLANG
>         def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
>
> +config LD_IS_LLD
> +       def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> +
>  config CLANG_VERSION
>         int
>         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>
> base-commit: 96c9a7802af7d500a582d89a8b864584fe878c1b
> --
> 2.26.2
>
