Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F28639FF2
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 15:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFHNjR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 09:39:17 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37535 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfFHNjR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 09:39:17 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so3631868lfh.4
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JaGfI81Q6JWentYKTaA21VCz1itFIbwix5ValIQhLRo=;
        b=Q7bt4G1t1KViB/8r4h/mB6s5nvWvP6n39uTn3jjJwd1YD9HwleTCbDepVlDxE9B86X
         s4mA+AZYxExH9Bpo5MAj3MA0uk/6D1PyQdyZ/oa/Es1txynnCK14ZeuXdc/fKIze3dau
         RzEjWeK+3jaFFwkcJh8HJ3fd/dVq7wpz8FCXzzcHshq6IZ4Tang+OhGCKb7DTboZzpw4
         DnZs1atzNNFGGJDrL12OO0fVuYdVWLB4zfqAOq7hghafntvVPIE0/5S/5AksrXmAqy5j
         98oEh/x99VIumnSByE/qis2Xk0wCIJXDh3x+gDZ2EnGIP0raof2bM4Wmp1Q2pLHnaIiZ
         aJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JaGfI81Q6JWentYKTaA21VCz1itFIbwix5ValIQhLRo=;
        b=eU+4D+HpGL2mcIY33cGAtdvis4e+LASX3nRXIdXywVz2YlJyduW5RUFPuu1HtKsbZg
         jyaEv1moJ5AWUXZxherSC4FDOcDzH8Zhj6cpurnokeo81ycbLLBNbbOzz2NX9Qfrrvj7
         svJydIDJ8QDA9k8jkX/61QrsDw5XsA7y9bcUMaNjoaez+AFC5onQqQj/XBqVifi0vJwr
         wqPJUt0hgeRkvXvPIFPRGebPWVCvWzwNuIobS7Cfpi1igPmPgbKUY5JmjlvQCW+m3qrI
         noUu6lkAR9QAy8aO+ahDDwvC0FgdDaZx2RxbYhhwVhtWg195MBtl8y0fTZu7dGL4qH9j
         O9pg==
X-Gm-Message-State: APjAAAVgfrGcLbYLRK0R30cwDX/xGSFVWjmPPAjqELHyWu+G74YISb1p
        JRvSSMjBHheo8EWC7HJnGN7Wf04nPzgbx5aartBM4hxi
X-Google-Smtp-Source: APXvYqx9DRqAoMXbndPx1CEggSgZL21g/MbLBj7GYirci7ZrLdGpXGWI6SxNqAVUlDZjQ3Lg3/H/RoVBLot41av1Y2A=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr28947388lfh.92.1560001155176;
 Sat, 08 Jun 2019 06:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190604163311.19059-1-paul@crapouillou.net> <CACRpkdbKg22OyViYhXS=Vyps=2zQ_dmm23Xr8+dBp+uwwjheuQ@mail.gmail.com>
 <1559988846.1815.1@crapouillou.net>
In-Reply-To: <1559988846.1815.1@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 15:39:07 +0200
Message-ID: <CACRpkdbKWC7ULFjN1c5axg5FBeeWWXCsbbQi2ks4+5tg07Br-g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lb60: Fix pin mappings
To:     Paul Cercueil <paul@crapouillou.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 8, 2019 at 12:14 PM Paul Cercueil <paul@crapouillou.net> wrote:
> Le sam. 8 juin 2019 =C3=A0 0:10, Linus Walleij <linus.walleij@linaro.org>=
 a
> =C3=A9crit :
> > On Tue, Jun 4, 2019 at 6:34 PM Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >
> >>  The pin mappings introduced in commit 636f8ba67fb6
> >>  ("MIPS: JZ4740: Qi LB60: Add pinctrl configuration for several
> >> drivers")
> >>  are completely wrong. The pinctrl driver name is incorrect, and the
> >>  function and group fields are swapped.
> >>
> >>  Fixes: 636f8ba67fb6 ("MIPS: JZ4740: Qi LB60: Add pinctrl
> >> configuration for several drivers")
> >>  Cc: <stable@vger.kernel.org>
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Such things happen. Are you planning to phase all the board files over
> > to use devicetree eventually?
>
> Yes, that's definitely what's planned; right now the blockers are
> patchsets [1] and [2]. [1] is ignored by everybody because there's no
> maintainer for drivers/memory/. [2] is a year-long effort that still
> doesn't show me the light at the end of the tunnel.
>
> [1] https://lkml.org/lkml/2019/6/4/743
> [2] https://lkml.org/lkml/2019/5/21/679

What? That's unacceptable, the last resort is usually to send the
patches to Andrew Morton (whether fair or not) when nothing gets
applied.

In this case I would however encourage the MIPS maintainer to
simply queue this stuff in the MIPS tree as blocking his arch work
if not merged, Ralf would you consider just queueing this?
I do not think the other Linus would mind.

Yours,
Linus Walleij
