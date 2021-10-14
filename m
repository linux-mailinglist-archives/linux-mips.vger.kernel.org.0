Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B3742D21E
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 08:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhJNGMJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 02:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhJNGMJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 02:12:09 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FC5C061570;
        Wed, 13 Oct 2021 23:10:05 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id l20so184770vkm.8;
        Wed, 13 Oct 2021 23:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5kjnkU60E7PNCc1/04QWlIzYDNePPH9DFG3XyziMXDM=;
        b=biqlqNy8z3g5pu42GJHcKiC8cMEyBCo/xbedQGqe7t+sLAMvgUpQEBz9whA9kpxlMa
         VA623TeTPlu71bqDk5cB8m3KIbcdiiSc2m9JAKnxX0zqrkYX6nXoMoaRK8gvaGAuxo2T
         k2Se8RvFARfN2lQrK+VEvBv2ppks5wrpa1BRToHjrroeu5Ja1PJtakd0QVf0MBovUhL5
         nzhQoxiXq6PcFQFbBTlwJ78LkopEcvrD8tcqz105rZzIUVC6zfetN77IzcMs32NYJiy1
         g5CLf3pzSDwcTmZhagORENP8gvYygNDTvVpP5Xs4EPxye/43FvXek64tcyla49DIoV2n
         iCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5kjnkU60E7PNCc1/04QWlIzYDNePPH9DFG3XyziMXDM=;
        b=LQWsPESJBOB+bDEtLVBvlapIsNkUDcbdLmG5ZKTOtCdxiAzSmRP6dlqLpZ1VUO6DxF
         Qyy0pG4Qopsv+kYqANppYLxDxtRPk/zlbkmGckk8mDLStHd+6kmQg8zzHkrqao+tYqtu
         odVvHaUV/+CqZ4JMV3rAsGXd1VKnrUn+WmQfi3GaYODBA2KbyajH8Rq+ugszw7eSdbkG
         /0/NE/8hcNMgEBQelQqcknVgCnfmSpDmmr7y11ajFYsOhQ7yjByXCkeP4pIMabZjF2OD
         I6BTsd0UQ3IRPWh+kY0rWKqqWhY4EtRmFIqmh2ImEmy/laW6SqdT/mJB/4GufiDo2/yB
         YJCQ==
X-Gm-Message-State: AOAM531eP7O32o24iEopl0wAofwsN3t5KOlcCnHiPjjeM40QdKLLJKj5
        LWe0y4xgIbm2uQZ4IhyjMmUXhZiY9V+VCursrDz61zIH4UA=
X-Google-Smtp-Source: ABdhPJwsr7RrkPM9XQzR+hc2v4Q2VzPFdQ6kRZzAyokf8ZTGX2/AjIXiKxEpbnHyfAZQGNA8+5LoJPMhGjjWCC/UpwM=
X-Received: by 2002:a1f:abc9:: with SMTP id u192mr3852686vke.17.1634191804316;
 Wed, 13 Oct 2021 23:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 14 Oct 2021 08:09:52 +0200
Message-ID: <CAMhs-H91SHq9L7iO_2ewF1ULv7UWVVj3Df3mkLyBEh0A+qcPjA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] MIPS: kernel: proc: fix style and add CPU option reporting
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Ilya,

Please, from now directly add me also to CC for mt7621 related
patches. I will do my best to test / review them when possible.

On Thu, Oct 14, 2021 at 7:40 AM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
>
> Fix checkpatch errors and use seq_puts instead of seq_printf where
> possible.
>
> Re-send an old patch that adds CPU option reporting.
>
> Tested against MT7621 on OpenWrt running v5.10 kernel.
>
> MT7621 output:
>   Options implemented   : tlb 4kex 4k_cache prefetch mcheck ejtag llsc
>   pindexed_dcache userlocal vint perf_cntr_intr_bit cdmm perf
>
> ---
> v2: Add missing options that were added since the original patch
> v3: Resend after 6 months and add Hauke's Acked-by
>
> Hauke Mehrtens (1):
>   MIPS: kernel: proc: add CPU option reporting
>
> Ilya Lipnitskiy (2):
>   MIPS: kernel: proc: fix trivial style errors
>   MIPS: kernel: proc: use seq_puts instead of seq_printf
>
>  arch/mips/kernel/proc.c | 227 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 184 insertions(+), 43 deletions(-)

For this series:
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
> --
> 2.33.0
>
