Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C2020C917
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2020 19:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgF1RBM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jun 2020 13:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgF1RBL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jun 2020 13:01:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4338C03E979;
        Sun, 28 Jun 2020 10:01:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j4so11826447wrp.10;
        Sun, 28 Jun 2020 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VgNIhjv1EK3OTEG7G6sROVk5jMErMnnRyNDyb3Aqm6w=;
        b=qQHd95GUu+aUyNiADCd8YGN0Hpol/fUwfTrNf/ibDQXMVe5kwd/JQY4D5Ny5zEwlFe
         B9fwO0sWsU+7acAPa9jX1vpmGa5hCRn1f9YX91ThbNSN1oukH6oc1xt62J525s/7CNCW
         IoLv6U0br9Sp6/rFH054aLSoH7b/mIzvgjrGkH671+wMDWauWDDZwCgegBYYlDfrQTC2
         SjCt/5Yg0XNz419teg+hSCk0wVoTydWBOj9JyNnigL/bHpjTmmiQ2AsQMrgUQabsyET8
         fXQZPII5bYIzGY94trBJnA52Jx0s+p3tiJ0sDWQhEmcYcSkxxAHOm7171dyumB1n6w7B
         cexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VgNIhjv1EK3OTEG7G6sROVk5jMErMnnRyNDyb3Aqm6w=;
        b=lmBX2NZ1KloHl7OKdeRmw3//XyNL9VCiRFrcyhuu5IOHQZ41ANU5LfR9KrOx9aCe8t
         hKR2uQIic+2dewFUd41aySULGRnPGC1/Wiu5+dz0kp6WjXaaljrbYZdqyzgZNkU6Iphb
         Q6Lf5+k5X5ssUIQOp4qZ48xoWBvTK3XaFk+JRmuIhJFj+XWyCCco9ZT692sBLhqmz3xk
         RStVxGG4HEkPy8qEQHYqYdL6Boc7wIt9SubJySGEsT5yMJR7Nvjn2WnhG+9z8MbZ/oh7
         JHIg8HhZKW/42YN00tB1JGeAL0vnSFa0MEUsePco95bBjsESD94cj/tAlfj5LQcwIKgp
         GOXw==
X-Gm-Message-State: AOAM530OLeL8etkCH6NwTjDwBAlvI1vy1cP3tCiTmSFyOiAZoDH+yocp
        BBLawJay+7RWomBZ1PO+L4ITVLDLAUDAMPNwY8dHpg==
X-Google-Smtp-Source: ABdhPJyCTtX1im/AM+Og+ncHlyjpPWhQyI/62rBeInG4t4LXJpk9IFVCi3pNj/dNjE4XmqRlxT0E5PtbUz9ifMDs2f0=
X-Received: by 2002:a5d:6907:: with SMTP id t7mr13422798wru.329.1593363670422;
 Sun, 28 Jun 2020 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
 <e419a2acea6c1977eaef5d049d607749@kernel.org> <CAHiYmc6wmgHYm688pTFEAoyzD+nE68SPeJgCOcZLb2yRRgwGRg@mail.gmail.com>
 <80132dff49a64d238f775aa0bafe29e1@kernel.org> <CAHiYmc778AYK1UzOUnrU2VCyUExT3Zhu5nCSqeQOTZK2LbmFUg@mail.gmail.com>
 <e1c8747d684dbdf0f6acc2eea2025139@kernel.org>
In-Reply-To: <e1c8747d684dbdf0f6acc2eea2025139@kernel.org>
From:   Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Sun, 28 Jun 2020 19:00:58 +0200
Message-ID: <CAHiYmc6wLRE+r6TP+_vtx7nJgMQwjcVjtWjYi2ChFjaMKv+ksg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14 RESEND] irqchip: Fix potential resource leaks
To:     Marc Zyngier <maz@kernel.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

=D0=BD=D0=B5=D0=B4, 28. =D1=98=D1=83=D0=BD 2020. =D1=83 18:55 Marc Zyngier =
<maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>
> On 2020-06-28 13:48, Aleksandar Markovic wrote:
> > =D0=BD=D0=B5=D0=B4, 28. =D1=98=D1=83=D0=BD 2020. =D1=83 14:06 Marc Zyng=
ier <maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BE/=D0=BB=D0=B0:
> >>
> >> On 2020-06-28 12:25, Aleksandar Markovic wrote:
> >> > =D1=81=D1=80=D0=B5, 24. =D1=98=D1=83=D0=BD 2020. =D1=83 10:40 Marc Z=
yngier <maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BE/=D0=BB=D0=B0:
> >> >>
> >> >> On 2020-06-24 08:44, Tiezhu Yang wrote:
> >> >> > [git send-email failed due to too many commands,
> >> >> >  so only cc the major related email and resend it,
> >> >> >  sorry for that]
> >> >>
> >> >> This is becoming majorly annoying.
> >> >
> >> > I don't think this is the right vocabulary to welcome newcomers,
> >> > however "terrible" thinks they did.
> >> >
> >> > Rather, patience, calmness and clear and detailed explanations would
> >> > work much better - and certainly be much more helpful and useful to
> >> > the community in the long run.
> >>
> >> Pray tell how you would have handled this. I expressed *my* personal
> >> frustration at a SNR hovering below the 25% mark. I have only
> >> indicated
> >> that the current course of action was becoming a problem.
> >>
> >> And instead of taking the moral high ground, maybe you could actually
> >> share your wisdom with Teizhu and help him becoming a better
> >> contributor?
> >>
> >
> > He will improve. This initial clumsiness is normal. It could have been
> > avoided, true - for example, if he had had someone more experienced at
> > hand, preferably a co-worker. He obviously acts alone. It will be
> > better.
>
> I thank you for imparting your insight on us. You clearly have helped
> things moving forward, and I am sure Teizhu now knows a lot more about
> what he should have done.
>

Irony and arrogance are certainly not the things that would attract
future contributors. I think that is a real new insight - for you.

Regards,
Aleksandar

>          M.
> --
> Jazz is not dead. It just smells funny...
