Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D02042E9A9
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 09:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235803AbhJOHI7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 03:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235715AbhJOHI6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Oct 2021 03:08:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9730560F9F;
        Fri, 15 Oct 2021 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634281612;
        bh=Wv6umrDOTPNcXNYUS5BV725vCMFwzb69mk7PA+DYPI4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Q6xWyLdwOBwHIsJzx/uItTmFWcCW3NxZkEQ7MlQpglXe1Keh3j5RyAM5H8m5KmPLD
         RYq+RtgATVHq6zdWRn60DtWWl9bG153rgwIBG2HDEu8aRlEEW094W0iWFhHlrvD8/K
         34ZFXDfThD2IsjlVk27KrjobWR47sP8oScN35U5kJSjGK1h9EneL+8Umy59JE59CXD
         6yrNZlN6LYZCmw8wyjSDvob2J5/vx8WABoea9cZgo+2hd/PvMsxMXGf+lk0MaHvlf7
         pCE4G5QpefhOuB2lcpNyK5sMhHyO4P/AQI+Sdzjg5A/f8BG474wAwZbn1uCuMS9W/6
         6x8i1VXoOcbcw==
Received: by mail-ua1-f54.google.com with SMTP id u5so16049855uao.13;
        Fri, 15 Oct 2021 00:06:52 -0700 (PDT)
X-Gm-Message-State: AOAM531rHbq1nX6Y3/7Yxkon1sBEi4pJVXCfZMKxkHgP17gnixlsBWD/
        K89WD+/GZ1ERlh9enAmuMYDtspi1VMlbiPpE+tA=
X-Google-Smtp-Source: ABdhPJyPMFIJA2qtBWnilm8SFmbsa/3mAw1rNIyXvIkLuWUf+8okzfbEx+f1QCpZkJs6LKVTokQvusJkrZ1SjPu3yy0=
X-Received: by 2002:a67:c30b:: with SMTP id r11mr12529577vsj.20.1634281611645;
 Fri, 15 Oct 2021 00:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211015070122.11467-1-wanjiabing@vivo.com>
In-Reply-To: <20211015070122.11467-1-wanjiabing@vivo.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 15 Oct 2021 15:06:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Uu9REzepwN7BA+g3jgzy-gd263OZjGU2z+b+Eh57bhw@mail.gmail.com>
Message-ID: <CAAhV-H5Uu9REzepwN7BA+g3jgzy-gd263OZjGU2z+b+Eh57bhw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Add of_node_put() before break
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kael_w@yeah.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Fri, Oct 15, 2021 at 3:01 PM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> Fix following coccicheck warning:
> ./arch/mips/loongson64/init.c:174:1-22: WARNING: Function
> for_each_node_by_name should have of_node_put() before break
>
> Early exits from for_each_node_by_name should decrement the
> node reference counter.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  arch/mips/loongson64/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 4ac5ba80bbf6..ee8de1735b7c 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -179,6 +179,7 @@ static __init void reserve_pio_range(void)
>
>                 if (of_range_parser_init(&parser, np)) {
>                         pr_info("Failed to parse resources.\n");
> +                       of_node_put(np);
>                         break;
>                 }
>
> --
> 2.20.1
>
