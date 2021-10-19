Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2803433CA2
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 18:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbhJSQrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 12:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhJSQrJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 12:47:09 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2DFC06161C;
        Tue, 19 Oct 2021 09:44:56 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id b188so16221203iof.8;
        Tue, 19 Oct 2021 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m9fn5L6c5k5bZQVkLpvPb3DcbU31aZHyPs/0zFNYnKw=;
        b=Qmc8AKuvYSGTXy1UfB1lkKw1L+FWpdGg2Hfm0XmOQHqKbWb+Uw/ybPukwBAYFg59In
         drTwnh7LC3GXfBPHcoBfUjXF7MYNqy00J/EgwNMMtWvVQoo8RKI3SNpGBaRivhtFz3FE
         X9xd/aly8rPbbPk7C4czUV7nZCQMFkVmn47+fO/kFtQ7L416n4FVdqK/Z4Yb53JkcOt9
         gA2DxHPB5v9h+Vx/59Cc5Bm5aTiyAJZ2uuSbxbGVekbbT1LDOH5WzXkrnVhHvRIr9rC7
         mGXm8AaihAP2VlfpgpH7nYiTRMCFXjnZQ3QeelO/cmZ+y6cgK1VTndw01/pPSCO14sDo
         qymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m9fn5L6c5k5bZQVkLpvPb3DcbU31aZHyPs/0zFNYnKw=;
        b=jGD90NOisi306wwNsZbtOBh7EwKm4saXRW9ONY9rc4vspEJWsmPQ5jaNXcp/idNODy
         p0l4TSWnUaAm/41dxfx/koVFStTtRsRCzXZiUCZZd9288F4tEwQZl3GMRKcBgBUNQufQ
         zOqQ1jgO5fmujoTtmLW8D7Bg7v1T5hY8d7XDj/ZBDWEJ/sFjKnLE93ozOthNALIaaLOy
         VXeIhUoF05QkzzTZ6ixd2nz4rNeyag39bAwD1lYYv65JK6nwfLanTtKHwALkq3pnM+Ou
         xdGoXMN6+v4BQIvLiQfNBHi7CEKWryz+yjY9lJ/grdaymkDgJsFiKoi6OWvUHjB4AXYL
         ONCQ==
X-Gm-Message-State: AOAM533bJMKrePhDbxYZcGBCdUoyH0o/RSoEUwKFezYwCdUn0smDy0RS
        PhE6uaUV5Cktrp81F3BBNmaewdvpH6bLKMtl0AM=
X-Google-Smtp-Source: ABdhPJwZgjBGY3VH8kD4PIFTbQ7BW6MwBzb9/uTGndsGv78ts4EkogRu9XIq17it5wCIg9iUyhd6DkWedo6YwdQ/8ws=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr20346152iow.172.1634661896156;
 Tue, 19 Oct 2021 09:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144520.3613926-1-geert@linux-m68k.org>
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 19 Oct 2021 18:44:45 +0200
Message-ID: <CANiq72=wnrwGbWygt2R_rsyKf3hq6vJUad4NDJwR4FeNFHZ55Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/21] auxdisplay: ht16k33: Add character display support
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

Hi Geert,

On Tue, Oct 19, 2021 at 4:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> The current auxdisplay driver is limited to dot-matrix displays, which
> are exposed as a frame buffer device.
>
> This patch series extends the driver to 4-digit 7-segment and quad
> 14-segment alphanumeric displays, allowing the user to display and
> scroll text messages.

Thanks for all your work on this. Unless somebody is against this, I
will pick it up.

Cheers,
Miguel
