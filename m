Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E29D3984D
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 00:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfFGWLD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 18:11:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45993 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbfFGWLD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jun 2019 18:11:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so2689558lfm.12
        for <linux-mips@vger.kernel.org>; Fri, 07 Jun 2019 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwd43iQ+uxpnBtPTqymsT6s+8HUa61yC8t5RUF2PcZU=;
        b=cx5trC4enXjixaDKj6Ievop4mO8XN9hgO9aAR04Q7aLPSDJ2c8Q6GPk2HH8EC/ErF0
         7MJ7D8Th748v7WMTnI63ah8gmGDXq0TkGf0uJ1v/q/g/zzZU3mmkwBkVYZE1sB8w1+Mf
         hASuZE/FTdqh3tRERGLesm/E3MnKbdXjC6lgCDZgIVjNnHUuOF3/kjmlNSijoiE1Oi6F
         6BxGVHxQaCMURQYR9jvt9oSgPaAFcvuDitqQjzpTRn9VB4Sg97qRzuS61nw2tl9Mowoj
         1tw9aHeC2Kb374as6WteoD0b9grq85chn9lJWbzEMwWrqkKHorAlIPnTz5cLF2GYFJAD
         X4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwd43iQ+uxpnBtPTqymsT6s+8HUa61yC8t5RUF2PcZU=;
        b=ry9kGTAlr9npHHCfXdWxH+bfQuL45kSqusaMup4K68KJXPv6YtTU9PhbavwBIjdkdP
         l6ux84rH/8GCc7hIqzTuHe66a2OJQ9rO4d+mf5mBAsuby1sqb++HPIeI0Snq4crWwoM1
         PFMndTYzU1yvRDeYgWPUjPZjtfiju3U4/++mCsDPjmomNRQuzR2+Gm4LLLPpgFfDkf1L
         iDHA52QKuGORbPFMJIVgOyrfii9UAcfp6LVK5zLQ5oIYJi3s020NLKBlSIkMGxU01DE/
         ZJ1POAQpJLnODprIYuT4KlkNwy/4lJCDw5HUjeOZwtEyoVC3jqG7pEglVaFfDNwe4nDC
         N6Qg==
X-Gm-Message-State: APjAAAVqh3nIbjo+PP+nB0XKzZowA5iKDC9LYXcnOf/ip8gmyzyJcsMi
        9NG83vXYjjhTsF6XgmVUEDP1ySbO4kP6ZOTkuIzIKVNQ
X-Google-Smtp-Source: APXvYqzlzk1opCrnSZLf1NClG2hmLjUWMYvMv5LilcvGaMM1NvQ27Pl0x01y4ezRphDXsdt6wF8raMS/qpaHuG1ixW0=
X-Received: by 2002:a19:7616:: with SMTP id c22mr23929383lff.115.1559945461842;
 Fri, 07 Jun 2019 15:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190604163311.19059-1-paul@crapouillou.net>
In-Reply-To: <20190604163311.19059-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:10:54 +0200
Message-ID: <CACRpkdbKg22OyViYhXS=Vyps=2zQ_dmm23Xr8+dBp+uwwjheuQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lb60: Fix pin mappings
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 4, 2019 at 6:34 PM Paul Cercueil <paul@crapouillou.net> wrote:

> The pin mappings introduced in commit 636f8ba67fb6
> ("MIPS: JZ4740: Qi LB60: Add pinctrl configuration for several drivers")
> are completely wrong. The pinctrl driver name is incorrect, and the
> function and group fields are swapped.
>
> Fixes: 636f8ba67fb6 ("MIPS: JZ4740: Qi LB60: Add pinctrl configuration for several drivers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Such things happen. Are you planning to phase all the board files over
to use devicetree eventually?

Yours,
Linus Walleij
