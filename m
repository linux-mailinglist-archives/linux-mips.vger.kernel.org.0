Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6581E7208
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 03:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437612AbgE2BYW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 21:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437446AbgE2BYW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 21:24:22 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8515C08C5C6;
        Thu, 28 May 2020 18:24:20 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id d5so604790ios.9;
        Thu, 28 May 2020 18:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g3nybRtCIVFUBpygPuznzXunzlWi3M2t+pmTI3/mqd8=;
        b=BZamHFDTDjoi29wkMX0OpDJDCcJOVyh9JSWpazFOS8eulbTbiMABfREO2wGB2GVikh
         ImfJhAmqsgGHiQ+xZ7SNlALKb97kCeteIKEeaeCSOjBuyQy5Q3GnWdkArjbo/ODp7Tvf
         rCTJ4gQXmRFLUKRNVibJaJZTB1wmVjqjga9cPxGeUgykAr5YGdIRn4zbEWJPneNAd2B3
         JlTa8nyz6y2Eh/HNU+58MZ4M4Uy+ZsZ9zrLDFjkO5ieNkPfm4WrH4yboTyBRN/RTONYN
         5tvsgPsK8zCg4rlkyMngT0bw+xZD3528zJ6VW1lpyQK+9uOpEwO7DnSE238vc9zVQPpA
         Bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3nybRtCIVFUBpygPuznzXunzlWi3M2t+pmTI3/mqd8=;
        b=C8XliShMxJ1IHo2YSP4CIZ3gnsmS2utvIpkBvr12LyhwkUrz/Fp1oml1nwrn8S2Zxh
         zq3qqLaDLqpVcS+gnQEMgps6hepiG2TN9k5ItzU93/fqJN10t60DTKMBxhhbmU1MVuu0
         vtWoIVNwF1AR9EOyVZKZbsWF0dDrwy5U4xUZ5pSTH9HN58JGyvatDD6vkrsg9aWMvhYd
         ewdYJB7+OUaalxdk1/SBxAgedXQk1Prwna40QBb28GzMxQgqYEfK/15Mz7WSZEJ+GgyC
         DeiCWx6AiTSeYyFPxHrjtV4PXVUY6NvVH/w8yz+brzra6qj1nQa+AQSGeGDzoVEkTm7F
         QKfQ==
X-Gm-Message-State: AOAM530uuZECNK2Nz1ZJgGc0vVCVT23OOJnbaEj6OAzrKJuMfCqdnWET
        n1hLeDzpUhqWe3CORjyDh8fICTz5CNAARbOqrAE=
X-Google-Smtp-Source: ABdhPJxI8cjjytDZIi8sS5uxeayx9moGlDTmdco7LWdR119gUY3KaSvUV5r2OneEFjtMEF3KdLAlDK7in9GIbmFCEcY=
X-Received: by 2002:a05:6602:1408:: with SMTP id t8mr4795402iov.125.1590715458459;
 Thu, 28 May 2020 18:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <1590654459-10827-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1590654459-10827-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 29 May 2020 09:24:06 +0800
Message-ID: <CAAhV-H7W7iXJOmJ8yT7kfuMN2Y8VhzcOUQXrnkytEEqrQZtWmQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefined under CONFIG_TEST_PRINTF
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Tiezhu,

On Thu, May 28, 2020 at 4:28 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Replace PTR_STR with INST_PTR_STR to fix the following build warning when
> CONFIG_TEST_PRINTF is set:
>
>   CC      lib/test_printf.o
> lib/test_printf.c:214:0: warning: "PTR_STR" redefined
>  #define PTR_STR "ffff0123456789ab"
>  ^
> In file included from ./arch/mips/include/asm/dsemul.h:11:0,
>                  from ./arch/mips/include/asm/processor.h:22,
>                  from ./arch/mips/include/asm/thread_info.h:16,
>                  from ./include/linux/thread_info.h:38,
>                  from ./include/asm-generic/preempt.h:5,
>                  from ./arch/mips/include/generated/asm/preempt.h:1,
>                  from ./include/linux/preempt.h:78,
>                  from ./include/linux/spinlock.h:51,
>                  from ./include/linux/seqlock.h:36,
>                  from ./include/linux/time.h:6,
>                  from ./include/linux/stat.h:19,
>                  from ./include/linux/module.h:13,
>                  from lib/test_printf.c:10:
> ./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
>  #define PTR_STR  ".dword"
>  ^
>
> Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Thank you for catching this issue, but I think this is not the best
solution. Maciej suggest another solution, and I will send a patch to
fix it.

Huacai
> ---
>  arch/mips/include/asm/inst.h | 180 +++++++++++++++++++++----------------------
>  1 file changed, 90 insertions(+), 90 deletions(-)
>
> diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
> index 6d74ba3..3ab1c6b 100644
> --- a/arch/mips/include/asm/inst.h
> +++ b/arch/mips/include/asm/inst.h
> @@ -14,10 +14,10 @@
>  #include <uapi/asm/inst.h>
>
>  #if (_MIPS_SZPTR == 32)
> -#define PTR_STR                ".word"
> +#define INST_PTR_STR           ".word"
>  #endif
>  #if (_MIPS_SZPTR == 64)
> -#define PTR_STR                ".dword"
> +#define INST_PTR_STR           ".dword"
>  #endif
>
>  /* HACHACHAHCAHC ...  */
> @@ -108,8 +108,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -129,8 +129,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -162,10 +162,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -190,8 +190,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -213,8 +213,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -233,8 +233,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -266,10 +266,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -311,14 +311,14 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> -               PTR_STR"\t5b, 11b\n\t"              \
> -               PTR_STR"\t6b, 11b\n\t"              \
> -               PTR_STR"\t7b, 11b\n\t"              \
> -               PTR_STR"\t8b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
> +               INST_PTR_STR"\t5b, 11b\n\t"         \
> +               INST_PTR_STR"\t6b, 11b\n\t"         \
> +               INST_PTR_STR"\t7b, 11b\n\t"         \
> +               INST_PTR_STR"\t8b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -343,8 +343,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"              \
> -               PTR_STR"\t2b, 4b\n\t"              \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                        \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));\
> @@ -364,8 +364,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                                \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -384,8 +384,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                                \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -413,10 +413,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (res)                               \
>                 : "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -453,14 +453,14 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> -               PTR_STR"\t5b, 11b\n\t"              \
> -               PTR_STR"\t6b, 11b\n\t"              \
> -               PTR_STR"\t7b, 11b\n\t"              \
> -               PTR_STR"\t8b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
> +               INST_PTR_STR"\t5b, 11b\n\t"         \
> +               INST_PTR_STR"\t6b, 11b\n\t"         \
> +               INST_PTR_STR"\t7b, 11b\n\t"         \
> +               INST_PTR_STR"\t8b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (res)                               \
>                 : "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -486,8 +486,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -507,8 +507,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -540,10 +540,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -569,8 +569,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -592,8 +592,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -612,8 +612,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -645,10 +645,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -690,14 +690,14 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> -               PTR_STR"\t5b, 11b\n\t"              \
> -               PTR_STR"\t6b, 11b\n\t"              \
> -               PTR_STR"\t7b, 11b\n\t"              \
> -               PTR_STR"\t8b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
> +               INST_PTR_STR"\t5b, 11b\n\t"         \
> +               INST_PTR_STR"\t6b, 11b\n\t"         \
> +               INST_PTR_STR"\t7b, 11b\n\t"         \
> +               INST_PTR_STR"\t8b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (value), "=r" (res)         \
>                 : "r" (addr), "i" (-EFAULT));       \
> @@ -720,8 +720,8 @@ do {                                                 \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                        \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));\
> @@ -741,8 +741,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                                \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -761,8 +761,8 @@ do {                                                \
>                 "j\t3b\n\t"                         \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 4b\n\t"               \
> -               PTR_STR"\t2b, 4b\n\t"               \
> +               INST_PTR_STR"\t1b, 4b\n\t"          \
> +               INST_PTR_STR"\t2b, 4b\n\t"          \
>                 ".previous"                         \
>                 : "=r" (res)                                \
>                 : "r" (value), "r" (addr), "i" (-EFAULT));  \
> @@ -791,10 +791,10 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (res)                               \
>                 : "r" (value), "r" (addr), "i" (-EFAULT)    \
> @@ -831,14 +831,14 @@ do {                                                \
>                 "j\t10b\n\t"                        \
>                 ".previous\n\t"                     \
>                 ".section\t__ex_table,\"a\"\n\t"    \
> -               PTR_STR"\t1b, 11b\n\t"              \
> -               PTR_STR"\t2b, 11b\n\t"              \
> -               PTR_STR"\t3b, 11b\n\t"              \
> -               PTR_STR"\t4b, 11b\n\t"              \
> -               PTR_STR"\t5b, 11b\n\t"              \
> -               PTR_STR"\t6b, 11b\n\t"              \
> -               PTR_STR"\t7b, 11b\n\t"              \
> -               PTR_STR"\t8b, 11b\n\t"              \
> +               INST_PTR_STR"\t1b, 11b\n\t"         \
> +               INST_PTR_STR"\t2b, 11b\n\t"         \
> +               INST_PTR_STR"\t3b, 11b\n\t"         \
> +               INST_PTR_STR"\t4b, 11b\n\t"         \
> +               INST_PTR_STR"\t5b, 11b\n\t"         \
> +               INST_PTR_STR"\t6b, 11b\n\t"         \
> +               INST_PTR_STR"\t7b, 11b\n\t"         \
> +               INST_PTR_STR"\t8b, 11b\n\t"         \
>                 ".previous"                         \
>                 : "=&r" (res)                               \
>                 : "r" (value), "r" (addr), "i" (-EFAULT)    \
> --
> 2.1.0
>
