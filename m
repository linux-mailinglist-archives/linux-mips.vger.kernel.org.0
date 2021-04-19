Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70AD363E63
	for <lists+linux-mips@lfdr.de>; Mon, 19 Apr 2021 11:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhDSJS6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 05:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhDSJS5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Apr 2021 05:18:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCFA8C06174A;
        Mon, 19 Apr 2021 02:18:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z13so37791512lfd.9;
        Mon, 19 Apr 2021 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hOMdmLdoNPiHj8jVVAv+A07eMF0awUHFT+qX0DPY3jM=;
        b=qREX+4eIwLGB8XnGGswdqnb/HRuCAy+XzkBInth2/6eppLlNOo8J+Bvv+zJVSROxKN
         1mbbbkNuhDIPn0o1Piwc0C0TuqufBbQFYixov4tcc4EfChsjmO40z/ROmevm3Jt3dcV1
         vMLvRWu60CdllSoOTNNdSsdPKt7DAmqdFh038zP20Y5VSpAgBppu6ukZ17QtZd+r3sej
         BTf87TBf1H6bw/2kK0aagepZP99mXKwQytrSt4DuYQ3rMkwx9p0x+v2t1cuoMekE2N8g
         Y5Yh/r5SdxglKFuB1jThxerGjl6R8jAziNh8bcZd+4FZrTy3LkgyXlBwSEkGH8uUyXGB
         aF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hOMdmLdoNPiHj8jVVAv+A07eMF0awUHFT+qX0DPY3jM=;
        b=CmWculFEOBoh24WGOagO+UUq0ikr2lud89pmMC/BCQtbKkAlJr6rQGVnhlrBBc9HS3
         DXelvppLRnJLkBfSG7N4r+FYiSQ7X4BOwof7JnZxjuJ8x9enEK1Aa7UFP964SbXmTGG5
         VAurdP+Tuoi3cNcn6WMhCXfEliwnMxFeR2OtBf2kxTr1+TFTd9OtfaK+Xq96yXt6aX0i
         /d7EookNLiRJmofCxz775r1mtiaOWVt9JVrYB6cnkl3HL+CBa5ZcQitvy5oqcku7FVLJ
         dDfMMij8Dp11hYnKuJALN18/mxjoR1B5c9cTjlfzICngvHMqLS26/6UtSlgrD8C+9KOI
         4WqQ==
X-Gm-Message-State: AOAM5319v1DmSDo4gcE/aWIpZJ9UFGb6trwUs+Sdwob3tTQiRBG2KtYz
        VKFSzufvgCrVIB3P4hC5B+EmBv6E/6rP9g==
X-Google-Smtp-Source: ABdhPJz717yvbT3fJPjs6+Mub1D/bQDhetf0xoaA6EPixrlEZ5usA0xcT+f+rIEEeo62L8FudEcnEg==
X-Received: by 2002:a05:6512:1182:: with SMTP id g2mr11472570lfr.248.1618823905141;
        Mon, 19 Apr 2021 02:18:25 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.74.223])
        by smtp.gmail.com with ESMTPSA id 3sm614896lfz.66.2021.04.19.02.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:18:24 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: Makefile: Replace -pg with CC_FLAGS_FTRACE
To:     zhaoxiao <zhaoxiao@uniontech.com>, tsbogend@alpha.franken.de,
        jiaxun.yang@flygoat.com, chenhuacai@kernel.org,
        viro@zeniv.linux.org.uk, morbo@google.com
Cc:     paul@crapouillou.net, alobakin@pm.me, suxingxing@loongson.cn,
        tangyouling@loongson.cn, yangtiezhu@loongson.cn,
        ralf@linux-mips.org, nathan@kernel.org, masahiroy@kernel.org,
        keescook@chromium.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210419055156.22195-1-zhaoxiao@uniontech.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <167b7021-d471-89f0-4446-b1d022bdf6c9@gmail.com>
Date:   Mon, 19 Apr 2021 12:18:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419055156.22195-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 19.04.2021 8:51, zhaoxiao wrote:

> In preparation for mips supporting ftrace built on other compiler
> options, let's have the mips Makefiles remove the $(CC_FLAGS_FTRACE)
> flags, whatever these may be, rather than assuming '-pg'.

    But your patch is adding 'em,  not removing?

> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
> v2:add this same change be appropriate to all of the below Makefile.
>   arch/mips/boot/compressed/Makefile | 2 +-
>   arch/mips/kernel/Makefile          | 8 ++++----
>   arch/mips/vdso/Makefile            | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index f93f72bcba97..e4b7839293e1 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -18,7 +18,7 @@ include $(srctree)/arch/mips/Kbuild.platforms
>   BOOT_HEAP_SIZE := 0x400000
>   
>   # Disable Function Tracer
> -KBUILD_CFLAGS := $(filter-out -pg, $(KBUILD_CFLAGS))
> +KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE), $(KBUILD_CFLAGS))
>   
>   KBUILD_CFLAGS := $(filter-out -fstack-protector, $(KBUILD_CFLAGS))
>   
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index b4a57f1de772..814b3da30501 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -17,10 +17,10 @@ obj-y		+= cpu-probe.o
>   endif
>   
>   ifdef CONFIG_FUNCTION_TRACER
> -CFLAGS_REMOVE_ftrace.o = -pg
> -CFLAGS_REMOVE_early_printk.o = -pg
> -CFLAGS_REMOVE_perf_event.o = -pg
> -CFLAGS_REMOVE_perf_event_mipsxx.o = -pg
> +CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_early_printk.o =  $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_perf_event.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_perf_event_mipsxx.o = $(CC_FLAGS_FTRACE)
>   endif
>   
>   obj-$(CONFIG_CEVT_BCM1480)	+= cevt-bcm1480.o
> diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> index 2131d3fd7333..1b2ea34c3d3b 100644
> --- a/arch/mips/vdso/Makefile
> +++ b/arch/mips/vdso/Makefile
> @@ -46,7 +46,7 @@ CFLAGS_vgettimeofday-o32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -in
>   CFLAGS_vgettimeofday-n32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
>   endif
>   
> -CFLAGS_REMOVE_vgettimeofday.o = -pg
> +CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
>   
>   ifdef CONFIG_MIPS_DISABLE_VDSO
>     ifndef CONFIG_MIPS_LD_CAN_LINK_VDSO
> @@ -60,7 +60,7 @@ ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
>   	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
>   	-G 0 --eh-frame-hdr --hash-style=sysv --build-id=sha1 -T
>   
> -CFLAGS_REMOVE_vdso.o = -pg
> +CFLAGS_REMOVE_vdso.o = $(CC_FLAGS_FTRACE)
>   
>   GCOV_PROFILE := n
>   UBSAN_SANITIZE := n

MBR, Sergei
