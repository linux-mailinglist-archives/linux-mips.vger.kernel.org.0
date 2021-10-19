Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06530433FF5
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 22:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhJSUwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 16:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhJSUwa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 16:52:30 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728D1C06161C;
        Tue, 19 Oct 2021 13:50:17 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id r134so21961324iod.11;
        Tue, 19 Oct 2021 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9vqaYPJTseMPHZqZJ05hvv6wCPKInTtA3VDUdp0xR2U=;
        b=fx32n+sSi8AkWwRIAigmx9mp67eG857PjM9zzxL6ZiuP/vkQgrb/Xg38qMRIvqu9Db
         EI70VP6p3CwfgCKxyWRGC7D+Z2P5h9R5W7kN5Qd4FfKVpy4eDzNUZ2qWOCvFdVvVNkud
         kvnmkBEQvKvUIEbslSxG3dMZ6h5lH7KEuywxFtAXj7ntJgafHV+e9ziNQwGHCHyrGL7X
         mZ9AvxGkaywuZ71ROmvwnQb6Ah+Eif9iuzhWHm2NOSeuy865QdlVJpaBA3m+c5XRgfek
         uJefi1HZ7nJvMKHdH6xJQSF1So9vR7VNK0EbAUkrpel9cqrK181shBL1fkhkgX1TtUi6
         jOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9vqaYPJTseMPHZqZJ05hvv6wCPKInTtA3VDUdp0xR2U=;
        b=LVg6hz4cVSilUgfc+ym4VUP/vY+OXZE+Q3HF4FZ6WVIecDKtdAML5CUAEKI1ZOJqKW
         cP6BNDqmT3GXLvv9yICIT2JPnVrHVybVpb6mkEoU89yr5lDNiPEGpN+6yjEKCTblktQW
         Y253PCdhFABQ2ESGuiXlfTAoSuk2CRXD2fqdjluh954SRH2f3qlGcgRmEoeKHkuzTvDu
         iGyL2LZ2MOSqEaC5dS1FIVVuNVXskuGBEz+Nx5hojlD5NqYhexIZo1yFqdVX4HRZBCCg
         f9WQAlNMxxmnjXVeTy+r8VdayTFUh2hfwUR3vJRV/9Ij6dmGZvh9EFkzkpKLQ+/yULSg
         v0NQ==
X-Gm-Message-State: AOAM533I4fVzK3Zx/jRMcgMRIAjxzwxSp/BWiaQw+laoqQrhL4hrGorN
        /Te9+RsgK/K4OsLK34byz2gOqbv9GaiHSdrULso=
X-Google-Smtp-Source: ABdhPJx3Mzrw6dFvnsflFCQyUYi5Fa3FPp5lTiKKE15jhmvleJ3cb1J4Askbc/O330XlH0ME4eBrTq3lwg56KrjrgXQ=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr21238434iow.172.1634676616752;
 Tue, 19 Oct 2021 13:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144520.3613926-1-geert@linux-m68k.org> <20211019144520.3613926-4-geert@linux-m68k.org>
In-Reply-To: <20211019144520.3613926-4-geert@linux-m68k.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 19 Oct 2021 22:50:05 +0200
Message-ID: <CANiq72nJS_rxwB7BQJ30iEeFcX8_7VznkF0DvueM_Ym+Wqd94A@mail.gmail.com>
Subject: Re: [PATCH v8 03/21] auxdisplay: img-ascii-lcd: Fix lock-up when
 displaying empty string
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 19, 2021 at 4:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> +               devm_kfree(&ctx->pdev->dev, ctx->message);

Unrelated to this patch (and no need to change it), but we could
remove the conditional guarding the devm_kfree below to match this
one.

Cheers,
Miguel
