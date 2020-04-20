Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FD21B0608
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 11:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTJyJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTJyI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 05:54:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EE6C061A0C;
        Mon, 20 Apr 2020 02:54:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f13so11284578wrm.13;
        Mon, 20 Apr 2020 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=IDwDem3D6NSd1YxszNY7NfHJH9Vv/3Ektc8kZiKqEDk=;
        b=jKlcqj+KZb8sBhKM6jipwdO4Bp9kaTdO5wLSSB26edvFc/5j7qvyC/6vPNciCfNzyr
         ZN4BFkOLxrt2p2HOvohDE/onLOYzJ65ctCWy/+lwtmIu0T1NUDOyOJGPTkb3TXY0fMkx
         Y6DsCnzn4aGBJufve+itlXzVbxnIWeF9dW0toWeZZDKdWC5WGhSlToAXRwhDFdaqxn5e
         qeMGvvFnfzfWqmdi0tFymt569qoq6zBMl7WfUCjVTOsJ63j8HEvCaATOpmm4rWTkZ1+T
         gHZMshmgeEhnKulGUgu82ITq7ms6iBYpys3ASedHul8lT99zPaMmhGPpU262kIxOHmgK
         LBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=IDwDem3D6NSd1YxszNY7NfHJH9Vv/3Ektc8kZiKqEDk=;
        b=GC0WsoUM/wx3BM27cAAJRA/j2kHBRibzCttwZNqTao+7U24MvdU9tUDNIoYl34+A56
         63Xil80uLVa1+U6nrTSdOIj3q3JTWJBPDR0MeW1tL/8pd1vqnLyp9yTT4mUlkvKihEpw
         XlVAqbvlNLCI6eDZiBPvFSNUAfVG4hjbhVr7tlKbbd3LNmII9tx78xvzZ4DyADWM+lr5
         9icRYr8alj8jxS+RvdFc+JUhLaT0qykYCll44N48p71t0AfW59sU8Vr+IcQWwlaHlOjU
         U5rvRG+tIybqLTMKQi72T6otLs6O28cd5sCr5BQhzcjDWc6COQxqWPTpQrhXr5irplU9
         JojA==
X-Gm-Message-State: AGi0PuYezhQFSL7EGWGocRz95PK085B/oY03D1xK+RV3xDoghRhxfInQ
        gu+fN7B52pp5k7isr2JHfmUSaeH4YeX60mYQqNEz89q/xTU=
X-Google-Smtp-Source: APiQypJfbDUiHXTdWnv5nV4T5GtUcLZ59l6oL8sLQk6fQw2osqhYeLuarReEnEbqPPK5GmFH02EHG+47udqPljcM1Tg=
X-Received: by 2002:a5d:5745:: with SMTP id q5mr19194458wrw.351.1587376447129;
 Mon, 20 Apr 2020 02:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com> <20200419202128.20571-2-natechancellor@gmail.com>
In-Reply-To: <20200419202128.20571-2-natechancellor@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 20 Apr 2020 11:53:55 +0200
Message-ID: <CA+icZUVaLW+38WEJhqnfO7B_unHvrbSr0moKnfJ6zXGGA06CWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 19, 2020 at 10:21 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> After commit 9553d16fa671 ("init/kconfig: Add LD_VERSION Kconfig"), we
> have access to GNU ld's version at configuration time. As a result, we
> can make it clearer under what configuration circumstances the MIPS VDSO
> needs to be disabled.
>
> This is a prerequisite for getting rid of the MIPS VDSO binutils
> warning and linking the VDSO when LD is ld.lld. Wrapping the call to
> ld-ifversion with CONFIG_LD_IS_LLD does not work because the config
> values are wiped away during 'make clean'.
>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> v1 -> v2:
>
> * New patch.
>
>  arch/mips/Kconfig         |  2 ++
>  arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
>  arch/mips/vdso/Makefile   | 30 ++----------------------------
>  arch/mips/vdso/vdso.lds.S |  2 +-
>  4 files changed, 23 insertions(+), 29 deletions(-)
>  create mode 100644 arch/mips/vdso/Kconfig
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 690718b3701a..45220e4b8a65 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3275,3 +3275,5 @@ endmenu
>  source "drivers/firmware/Kconfig"
>
>  source "arch/mips/kvm/Kconfig"
> +
> +source "arch/mips/vdso/Kconfig"
> diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
...
> --- /dev/null
> +++ b/arch/mips/vdso/Kconfig
...
> +config MIPS_DISABLE_VDSO
> +       def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
...
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
...
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
...
> -#ifndef DISABLE_MIPS_VDSO
> +#ifndef CONFIG_DISABLE_MIPS_VDSO

Should be s/CONFIG_DISABLE_MIPS_VDSO/CONFIG_MIPS_DISABLE_VDSO ?

- Sedat -
