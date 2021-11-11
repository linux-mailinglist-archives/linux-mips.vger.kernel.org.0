Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3179044DC7F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Nov 2021 21:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhKKUbP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Nov 2021 15:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbhKKUbP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Nov 2021 15:31:15 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC7FC061766
        for <linux-mips@vger.kernel.org>; Thu, 11 Nov 2021 12:28:25 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id bf8so13709686oib.6
        for <linux-mips@vger.kernel.org>; Thu, 11 Nov 2021 12:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gBiwdPPgqDE+FpLiui3l4oL6zGJDjA4BEp171adZNFs=;
        b=B8NeVe5nPMz0rQZrp8+YjBhrDYXgs9ZklicjiIFaaDb90Y8E8SawcNdECdGOLY72/k
         ba3Z+4/8l7CKpSFeET7DVi39dVzpPoU5w8ZdslaOVU4b7NdZoVKQEThssjddoBa+ayt1
         5i3XTg9UukhSSRxUsDv8+ks04MuzyKAkA27uAsvdQxHEreu7mn9xRvkwsQHBR/JE/VlQ
         6NAA+SCh48PlpKFfhS4WAwU83oahtGYVOqbBK1t7NiezlRXg+1U51MbCxlMqzSZ4O/Yi
         pehdGv72QC2rr4Ya6MKZNihO/8U9pTUdS46YH3T8gJXrWhDCIuYYbHlx737huac2cpvX
         nYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBiwdPPgqDE+FpLiui3l4oL6zGJDjA4BEp171adZNFs=;
        b=bn4QiMCVbTSBKmGbNiL0KgD7VYm7JuaXEwy71s/yWjuocZpz+jFaN7QAiGOJwY7SOu
         IU4dB+WqmuyReLScJZl9ilpT1n1l0VHBlMI+zzpXIvE6NU+ZWPHvYIKeW5qBQDkQZJhd
         6RXjd7meTGZOw/hXKDsErXspx9o/IeM726JGQ0Zek51NDRLabSfmZC0mKY5xzqBfkZ8w
         V+LBAaGx8eBAGjiUTJV2WKEQ2girActZ/c/yGImtUGi6jrrG9oXUDwe9NR4vCaJ9IUf2
         Thxlg5kYpHfpdL6EWY/PYF7qVHr/W5KgA6YgC/q2Hh9YG6KaoxSwh71CPMIkoP5AjZ3K
         9LnQ==
X-Gm-Message-State: AOAM5309iyHHYwvJRlAnaZ9uxKZut5f0X7C7jUVAs7bwAWiv1jaujsb3
        xc30xlRFMieU3x4hzxba1GKdTOLTZvu19Ky1xi17LQ==
X-Google-Smtp-Source: ABdhPJz1t8ilCe+azR4nxyMELuFZ202q6/P+OrgSG758hZXZJ0cRdCRts8XbAIgXPHpBGut6c4m3RRCMxRay292CWw0=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr8514570oih.162.1636662505339;
 Thu, 11 Nov 2021 12:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20211109161253.2202108-1-robh@kernel.org> <CACRpkda1+86GgvCJEehg9CGS78Q10FJ3ZHzdmHpYHrY7tAwkwA@mail.gmail.com>
 <CAL_Jsq+gjP=3=wMYJ83KAn7Jf6xgaqoW9yn-bfoqD3Ung+CcKg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+gjP=3=wMYJ83KAn7Jf6xgaqoW9yn-bfoqD3Ung+CcKg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 21:28:14 +0100
Message-ID: <CACRpkdbZvyQL3H31=00W-XeELR_g8xfRDyt-htLfh9DNSSDYxQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Remove Netlogic XLP variants
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 11, 2021 at 9:13 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Nov 11, 2021 at 4:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > > @@ -373,7 +263,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
> > >         gc->label = dev_name(&pdev->dev);
> > >         gc->base = 0;
> >
> > Can we also set this to -1 and use dynamic GPIO base allocation?
> > (Can be a separate patch.)
>
> No clue. What's normal for GPIO ACPI systems?

Dynamic allocation (-1) c.f.
drivers/pinctrl/intel/pinctrl-intel.c

> Does that mean more than
> 1 instance is broken currently?

Yes.

Yours,
Linus Walleij
