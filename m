Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F762556DE
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 10:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgH1Itw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Aug 2020 04:49:52 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45913 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgH1Itt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Aug 2020 04:49:49 -0400
Received: by mail-il1-f194.google.com with SMTP id k4so223488ilr.12;
        Fri, 28 Aug 2020 01:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVemUTC2Juht3FJLPi1gZFhVQOsLxFZk3/oLvErcjXA=;
        b=WytkgegD6oyGauSz9Yt05JLMxkPJjtqfIIGEVVSgR06CamOAXW1T/RgNFlISUc0Nvn
         9CftBv9LuLeC+p+ZkVg05MiwmcOfft7VfVfI8KGalMgjNmXYTjcOMwGsg86VCDZ2Xf/i
         xLAYG66eZX0D2uCm9Yjl06rmdUJf6Zw0rPqKS3DZiiGuicw96vyMjbz8kJddlKzO7w57
         vZUUUJ/AAjHn1GU29uS5unYBaekOPpMbd2sc3dba9AJmZZr7pTOdzU1qGg5DXWqLnIJz
         xiAJra8Wofp4470dnI+dN/O9cY0bQ1oQZZsxvgHAYAY/T/yUY6KC0mQmjBixpBRYcZry
         Zxgw==
X-Gm-Message-State: AOAM531OOhNsMc3BqFlpHMiZhulkeEIVImgnlEuIpm0otcTZgWpPH6UI
        GxLbrBpudFCXdzv9NuCRcAdv7s6rKu5US3M8aWZtRur24YQ=
X-Google-Smtp-Source: ABdhPJxTgXSZZpWlbIhU0t+RtJbv2aKL2oJ6HpkHwgUYaR0njZT0spLiivsB8AoE7WdYuAVcb3M53HRXHP2XWaVzBQY=
X-Received: by 2002:a05:6e02:cb0:: with SMTP id 16mr604419ilg.147.1598604588656;
 Fri, 28 Aug 2020 01:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 28 Aug 2020 16:49:37 +0800
Message-ID: <CAAhV-H4MA7L8uBG3y1R-VgkS74Awa5-Qsp-vQUsYM8jwgtekJg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: perf: Fix wrong check condition of Loongson event IDs
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Pei Huang <huangpei@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Pei,

On Thu, Aug 27, 2020 at 4:05 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> According to the user's manual chapter 8.2.1 of Loongson 3A2000 CPU [1]
> and 3A3000 CPU [2], we should take some event IDs such as 274, 358, 359
> and 360 as valid in the check condition, otherwise they are recognized
> as "not supported", fix it.
I think this patch needs you to confirm.

>
> [1] http://www.loongson.cn/uploadfile/cpu/3A2000/Loongson3A2000_user2.pdf
> [2] http://www.loongson.cn/uploadfile/cpu/3A3000/Loongson3A3000_3B3000user2.pdf
>
> Fixes: e9dfbaaeef1c ("MIPS: perf: Add hardware perf events support for new Loongson-3")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> index efce5de..011eb6bb 100644
> --- a/arch/mips/kernel/perf_event_mipsxx.c
> +++ b/arch/mips/kernel/perf_event_mipsxx.c
> @@ -1898,8 +1898,8 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
>                                 (base_id >= 64 && base_id < 90) ||
>                                 (base_id >= 128 && base_id < 164) ||
>                                 (base_id >= 192 && base_id < 200) ||
> -                               (base_id >= 256 && base_id < 274) ||
> -                               (base_id >= 320 && base_id < 358) ||
> +                               (base_id >= 256 && base_id < 275) ||
> +                               (base_id >= 320 && base_id < 361) ||
>                                 (base_id >= 384 && base_id < 574))
>                                 break;
>
> --
> 2.1.0
>
