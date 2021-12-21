Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D5E47C064
	for <lists+linux-mips@lfdr.de>; Tue, 21 Dec 2021 14:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhLUNEA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Dec 2021 08:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238087AbhLUND7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Dec 2021 08:03:59 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB39CC06173F
        for <linux-mips@vger.kernel.org>; Tue, 21 Dec 2021 05:03:58 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b22so29172324lfb.9
        for <linux-mips@vger.kernel.org>; Tue, 21 Dec 2021 05:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAKxA86yUoHK6VBBx2V4w+G9IgxdZUJ5j0qp6W74H9o=;
        b=mNpqWH/qF6Qq598ubZF+RaCmiRhRw4c+Iy9f801LyVK+D9TDYRL7gV4LMUdxUvSoas
         7vAVkB35q0W/wtT6apcgzCU6ZMAB9zwKDOIcad/+ToJOYVgpqvLJiNZV8Kf+35Ute/az
         vZUwBEL1d8kr+ADgTVnsvACnq/q2KuEchu6EWXDLjcOhdqm5ePhoPuMQmpDEje/tcWJT
         8ZQr5N0CK+7gmtDMfULlcQSPxEJNZ1JYZi/9d9r+g1BPXmfBHRRv++kNO7Cv4pzwYowu
         CS2lWs0PW+b5hEpJfcuix9hZZzjcizMicHOsA0nU/pvSjgoUzkK5e48tP+Sj760RbE5K
         GJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAKxA86yUoHK6VBBx2V4w+G9IgxdZUJ5j0qp6W74H9o=;
        b=5xMW16418eW4L4BMVBpzAzCef8cgMBQgLMdrOU/FXmLm1hqQeozEGdsSwLYb8BGM33
         nP8b15Fm8FCRRNLUVstvW6A4sMRNt3rfVVnnjT6LBTjJ8ov3frFhjunK2FSDxuEfyAAq
         7km2/yi9Bub0wQnLFlG7Lb66qCgccgHt8Hijr7RSaaY1WVBgqSrCaZtcXIkSBZsxxaCe
         BwP0IV21Fef2EiioyQYG3hJJqbtIoVixgJzsmpXqE2ESIAOhGhKskiRv0GGsYWu5MKtX
         UBAp2iMtTJ7jgcEmVtJxnWxgfBRcg1VcOCSthl9ghUD1/KgRh+jwULYucfk2xm+Jew+a
         VAkQ==
X-Gm-Message-State: AOAM533X5Yb3vLS0jIR5K+AFPNzAanIQMGbGNng5H3aq/FQ+cyuOvIYM
        Zc504kxv4MIYmlpKC7+2oJmRQpd7RwKoHoFkssasSw==
X-Google-Smtp-Source: ABdhPJx8IP2IAkRzIENJtaUA/EkQbrYytygRyaHBX3zyri4TEUhP93ZvkX5zMAMoMD6Gf5WjYsFU3b8O6W+BKXO4a2g=
X-Received: by 2002:a05:6512:3d9e:: with SMTP id k30mr2973456lfv.184.1640091836638;
 Tue, 21 Dec 2021 05:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20211220190840.108061-1-paul@crapouillou.net>
In-Reply-To: <20211220190840.108061-1-paul@crapouillou.net>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 21 Dec 2021 14:03:17 +0100
Message-ID: <CAPDyKFrX+sajBhR88Q-DaNOgfAL6VZg6NvrT0Bds3wO5rVK_MQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: ingenic: Support bi-directional DMA channel
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, list@opendingux.net,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 20 Dec 2021 at 20:08, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Ulf,
>
> This patchset adds support for using a single DMA channel for both RX
> and TX operations, instead of using separate DMA channels for each
> operation.
>
> As some older Ingenic SoCs offer only a handful of DMA channels,
> supporting bi-directional channels allow more hardware to use the
> channels that would otherwise be used for the MMC/SD operation.
>
> Note that the Device Tree binding for the DMA controller has been
> updated in a (already merged) patchset, so that it accepts a 3 cells
> (#dma-cells == 3) instead of just 2. It was merged in the DMA tree, so I
> am not sure the autobuilders will like this YAML - but it was checked
> without errors.
>
> I also removed the descriptions of the "dmas" property in the YAML, as
> they really weren't adding anything and were getting in my way.
>
> There are patches touching the driver file merged in the PM tree (the
> ones that use the new PM macros) but I expect no problem here, they
> touch different parts of the file.
>
> Cheers,
> -Paul
>
> Paul Cercueil (2):
>   dt-bindings: mmc: ingenic: Support using bi-directional DMA channel
>   mmc: jz4740: Support using a bi-directional DMA channel
>
>  .../devicetree/bindings/mmc/ingenic,mmc.yaml  | 37 ++++++++++++++++---
>  drivers/mmc/host/jz4740_mmc.c                 | 19 +++++++++-
>  2 files changed, 48 insertions(+), 8 deletions(-)
>

Applied for next, thanks!

Let's see how this goes when the changes hit linux-next. I will have
to drop them, if we encounter any problems.

Kind regards
Uffe
