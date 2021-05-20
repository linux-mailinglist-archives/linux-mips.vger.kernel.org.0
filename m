Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5EF38BA7D
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 01:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbhETXoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 19:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbhETXoo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 19:44:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D410C0613CE
        for <linux-mips@vger.kernel.org>; Thu, 20 May 2021 16:43:22 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i9so26973807lfe.13
        for <linux-mips@vger.kernel.org>; Thu, 20 May 2021 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53C1hfvSqmgg+nungZ28Wt68bSH0DONGE5fhh6kZnQc=;
        b=ENX17ixMrZ6LlFjW2Hbl22WtfgniaMbSi4okNpeMs4vVauku+eqDwyn6oEZESJXMxY
         PQyf7UprsW4oHu38k5myavH9faHMeACdc956gz0xg+9c6hfrXYWwf/ttU5SyDqe6HIkC
         XwI52FPB/ACpKyTG/3ghEmAoxWRpNz0TsnvXVvFGzHD6pRaKLL+KWov4ezpDXg2Z7hoZ
         HRqXf7x6XKl73GWbkCgRLdaKQ55VON9F+LfovOgkqN2So3Es3oA/Ht70YfUXv1VoPM6/
         dtmNHBcLemlfAUVve/bIApLnwG+SdheSFgmZHY3nlzA4EdEIi6+qXAxcjnFpGiAbebZ/
         zcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53C1hfvSqmgg+nungZ28Wt68bSH0DONGE5fhh6kZnQc=;
        b=SDeoJpMcQ06HWOrWJ2aC9eJKK5TVjNCEoa7bgLwdh+ljGWxRSLdHdHVoXVFX/OV6K3
         KeVlh8UvHnZN5sigAIUBQicAlYWsTilsGoqU49Jpd6YlUtw0rviM0W0Qfklzpquk1ofQ
         x5K/lcb6DV9i26dL+Q3mLTnsLMwrMwaA/uHz9nTuVagWI6/7G6rmVBeeKG4xX6hVW/fP
         3Eocsieatw78Nb3KyOdACPM7V1ilLNGIQNV1jU+50JzjEmGdrzRnxU3oy//nVM8JhExF
         hmQuGnHJ0g6q/FQXzL9VCy9O110/CHperRyRktYwfdWm9RUxnjM4inu/oo3LnisuWYxl
         8LHQ==
X-Gm-Message-State: AOAM530IzkMACrF9fIOXnOFqyNb33f2LIQmZA0DBkJgzq4hUOpFo6Y/N
        PjyKPfN6EBDemQkwY6SUlcLQqlAuThCjDmJpra3pUg==
X-Google-Smtp-Source: ABdhPJygNMj5WuHzIbvLGIODNPR3orcEL5Kz4yD//0OspA/+6bWSXTMD99hFbettxaKcI97pqpWgO+KAhFftCGBncM0=
X-Received: by 2002:a05:6512:49b:: with SMTP id v27mr4401lfq.29.1621554200649;
 Thu, 20 May 2021 16:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621518686.git.geert+renesas@glider.be> <8abfe44e2ad77b6309866531ec662c5daf1e4dbf.1621518686.git.geert+renesas@glider.be>
In-Reply-To: <8abfe44e2ad77b6309866531ec662c5daf1e4dbf.1621518686.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 May 2021 01:43:09 +0200
Message-ID: <CACRpkdY1XY55HMEtkdUa-GDdy9v-47rD2aHQ90yObSKo3cmzVg@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: qcom-apq8060: Correct Ethernet node name
 and drop bogus irq property
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 20, 2021 at 3:58 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> make dtbs_check:
>
>     ethernet-ebi2@2,0: $nodename:0: 'ethernet-ebi2@2,0' does not match '^ethernet(@.*)?$'
>     ethernet-ebi2@2,0: 'smsc,irq-active-low' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> There is no "smsc,irq-active-low" property, as active low is the
> default.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think Bjorn Andersson has to apply this patch.

Yours,
Linus Walleij
