Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B838232964
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 03:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG3BQk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 29 Jul 2020 21:16:40 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46175 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgG3BQk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 21:16:40 -0400
Received: by mail-io1-f65.google.com with SMTP id a5so11342917ioa.13
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2020 18:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AoWp1DfbofRaHOxaLO1Cu6eA3hYkVAkwKj1Rsw6DKkE=;
        b=EW7+vDl6cRe2XgNsYmf7BtelG3CdrHY8JZ0taBNEbyEAdBhhLncLC4esQ/j0QOXQZP
         HdSQZIJHQYt60fh/v58VTfg4BUdsAUGdGI3PaA+sXw8rNrkQI5jDV3XKxJGMB499pBe0
         o0mZAJ7xFvcw9dGe2Zxpm2++iVWD9vVxoyRfNeXgdwjQ78F42XsXUMJOfj+i0A8m/PeY
         rQceQPhHEwmLdQAdcjszodaSA22BnXx/rVD71W6B8T3ZOnHlklDR/ZFmTJuYxhgM+ub0
         y7CZM75rhQfbkzdhO6qjL2drL5Qg0JwMfulj/oJCeePb9A7Lxo+5gEP07lkezwhHNYq/
         g7mw==
X-Gm-Message-State: AOAM532ecyxukNLAb2jOhUG+mDtSAvQJhY84ZjtSyLhpxoxEyaZpG9pN
        KDp7fSiuT0cZdirtBI130lETD9W39y4hkFa8Di1ul9/eGWBHdw==
X-Google-Smtp-Source: ABdhPJwUTzv58u+Hy7viwh0CsjMkl/vJkawZB7oZtYfBJ1312NRW+uP39UZJATkkhd/5Djc9emMg3yXYzmXN9DGVYZw=
X-Received: by 2002:a6b:ce11:: with SMTP id p17mr36688619iob.125.1596071799488;
 Wed, 29 Jul 2020 18:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
 <1596000130-8689-3-git-send-email-chenhc@lemote.com> <ccd646fd-9df6-517f-0cee-4672e8a052f8@flygoat.com>
 <2c8f7e82a5a878c774379f386462e802@kernel.org>
In-Reply-To: <2c8f7e82a5a878c774379f386462e802@kernel.org>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 30 Jul 2020 09:16:28 +0800
Message-ID: <CAAhV-H5Ehs4H2ZSet=PqKAAbLZQEME7R45a7jrkt-4RD9Sr_vA@mail.gmail.com>
Subject: Re: [PATCH 3/5] irqchip: loongson-liointc: Fix misuse of gc->mask_cache
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Marc

On Wed, Jul 29, 2020 at 11:04 PM Marc Zyngier <maz@kernel.org> wrote:
>
> Huacai,
>
> On 2020-07-29 06:26, Jiaxun Yang wrote:
> > 在 2020/7/29 13:22, Huacai Chen 写道:
> >> In gc->mask_cache bits, 1 means enabled and 0 means disabled, but in
> >> the
> >> loongson-liointc driver mask_cache is misused by reverting its
> >> meaning.
> >> This patch fix the bug and update the comments as well.
> >
> > Suprisingly it even works with the wrong usage of mask_cache.
> > Thanks for catching that!
> >
> > Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Does any of this series need to be backported to a previous revision
> of the kernel? If so, please provide Fixes: tags for the relevant
> patches, and potentially a Cc: stable if required.
>
> Also, please add a cover letter when posting such a series,
> as it makes it easier to track.
OK, I will send V2, thanks.

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...
