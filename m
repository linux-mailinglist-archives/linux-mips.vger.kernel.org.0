Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3FFC193A7B
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 09:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCZIMb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 04:12:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51638 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgCZIMb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Mar 2020 04:12:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id c187so5462729wme.1;
        Thu, 26 Mar 2020 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oEJ1iAQ+7+YVUW8+jUn/LpDi20P1xzzVQYh1aI/7o1g=;
        b=Lh2oSAL4GWyDbds8Qlj6rCNPhLzwWT77jtNKGn4A2KUu3LwyNZaWE6RqlwJMgzYOXh
         wzx0Ii/1s8D1Zo31ki/lYf3+3FEs+qnAYj+6NFdc39tlnSnajwqiHoyMr5H6EL9f4lp1
         Oy4r73UaYdFrpVM8CzjrfrNvoxEkux+yyESJtnbbSA2fo0VzYi8qkTFzbzWy1NLZhvop
         iSOY/CjWlYaE0f2uEKox4ueF0l99qS5ECt//F3qg5pdJQvtSgBx9QfwYiDGaktN4w0GZ
         BFYvECvEjaUGto279tzEQuPdRjSpSRUtwN7foLVFF32q/ogVHNaetbsw0ymmI0ZpCojv
         ItvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oEJ1iAQ+7+YVUW8+jUn/LpDi20P1xzzVQYh1aI/7o1g=;
        b=t0ofAU7lfgTcMTZFCnCrHEWVCa4oX78uTzoiyy845svapqT1y+0i3s3Usjv76Xv0b5
         74AaDNuh4fKEWVRVtqMlcfbs8CGwGBLN1z/kZiDk7uu4CqRZ2+DHFelLoOpO+EdXAUQ/
         Y+BH+5x2aSEHwUMseBGDRZ1sjq4reGr3Z4B3Vy9SfLRgU0032YF/4hBhchTwKO/fBcrf
         7RO7tiHuGurJm9LhQHUawQ9EW9RUa3aB2DemeWC00KANlnVSL1RVb83cBuT9yDWStain
         Zt7jcXTIaZOzawg5BhfK6UIqVGH9utLwvNgGOTm7DVRAJDc8Y3iR5DPEceUmjt5EW4pN
         iZlQ==
X-Gm-Message-State: ANhLgQ0WTGnD98cg61sEmnNYkWyyV/M9QlV164LiUr9RTaD9gS4dJ+vu
        vqrOK4AqOc8ptp1xamtiGPi9OrCr
X-Google-Smtp-Source: ADFU+vszpHwa+9v6JWIYs2igDhHtyRgaaZLpc8HnU96QPA4kMyij9NCG459Q4bMX/H/k1EUBFXHtqw==
X-Received: by 2002:a05:600c:4401:: with SMTP id u1mr1816379wmn.103.1585210347230;
        Thu, 26 Mar 2020 01:12:27 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id i1sm2387292wrq.89.2020.03.26.01.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 01:12:26 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-mips@vger.kernel.org,
        linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] getauxval.3: MIPS, AT_BASE_PLATFORM passes ISA level
To:     YunQiang Su <syq@debian.org>
References: <20200322095527.397716-1-syq@debian.org>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <827f0ae8-2e97-5eeb-387d-275d8aac98ad@gmail.com>
Date:   Thu, 26 Mar 2020 09:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322095527.397716-1-syq@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello YunQiang Su

On 3/22/20 10:55 AM, YunQiang Su wrote:
> Since Linux 5.7, on MIPS, we use AT_BASE_PLATFORM to pass ISA level.
> The values may be:
>   mips2, mips3, mips4, mips5,
>   mips32, mips32r2, mips32r6,
>   mips64, mips64r2, mips64r6.
> 
> This behavior is different with PowerPC.

Thank you for the patch. I see that this is scheduled for 
Linux 5.7 (for which the merge window is not yet open).
How certain is it that the feature will land in 5.7?

Thanks,

Michael

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e585b768da111f2c2d413de6214e83bbdfee8f22
> Signed-off-by: YunQiang Su <syq@debian.org>
> 
> ----
> v1 -> v2: fix typo
> ---
>  man3/getauxval.3 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index 456371c6a..bcc116dd2 100644
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -60,9 +60,10 @@ values are present on all architectures.
>  The base address of the program interpreter (usually, the dynamic linker).
>  .TP
>  .BR AT_BASE_PLATFORM
> -A pointer to a string identifying the real platform; may differ from
> -.BR AT_PLATFORM
> -(PowerPC only).
> +A pointer to a string (PowerPC and MIPS only).
> +On PowerPC, this identifies the real platform; may differ from
> +.BR AT_PLATFORM "."
> +On MIPS, this identifies the ISA level (Since 5.7).
>  .TP
>  .BR AT_CLKTCK
>  The frequency with which
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
