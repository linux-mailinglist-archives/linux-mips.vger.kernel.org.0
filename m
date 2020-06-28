Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B711B20C817
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2020 14:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgF1Ms5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jun 2020 08:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgF1Ms5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jun 2020 08:48:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4021BC061794;
        Sun, 28 Jun 2020 05:48:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g75so12783615wme.5;
        Sun, 28 Jun 2020 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x62swuAvZieexmf3XrDodAl31F57GfjTsPCvyRLX0e4=;
        b=pmlAGbn+rQI+C+PLxJBvliDcvbzewYyueZsqdzXmAGAIFBKjBb2C4mYLd1RJirMAIH
         C0vS50PnspjupgYElAtdGSwrSGKpMrqesInLsebuO5+lTCTvTcZxpuVMAgznvGeUXv1J
         GLpYM0eUVJObsjir9vIQZNbGdhuqvm6KBQZyz7rkZ1YZdJbOxVEBiVF2hTA2iJST24nX
         jmGfDeswigAdYFJBU5lAVkWfooJtxZMbur9W2FIl6mG4Vn3wGVqOLtL6KVFsucQv0/Fn
         Z4ILfEKs5DwSUuh4lWrgDzZuHGJdzZcnY5mMVCZ8CFPFMx++PQhx8XNtMoCrkrjAEv8Q
         xmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x62swuAvZieexmf3XrDodAl31F57GfjTsPCvyRLX0e4=;
        b=DdVZeZzi6HnVQ8hyXIxHbUXhg+PCx0AWPXD8w5mBDWNg8GpeyEVYSkC+3tGQ8BA51N
         sZ8gsb4EVeTwdPieErpDkvYT4TPc19FvZQhpq4KWeBnKpUqkRAYKWTuYSNauGRnSRuee
         xAYGFmpjZ75TFtQn3Wh+m1DC6VqqMPKJsZPhE08YO9o/L/gV2beOHGV011Yq5h/NbKgv
         Hjo03Z6GDsCSnPcCa0yrC6Bc4u+4ZmJJQUIZt4TcPccoLx2iKFn+wTOZx3LTpvB3XWbJ
         DAMPHgLK6cttx/Zl3hMHpqmqDxPs1z4/QvbfQEVgdxP5tkicOMaQfr17xPMDtWLLQ2Jf
         vT7A==
X-Gm-Message-State: AOAM531eYIcP2qx0cC2DI2MM84RN7VwaOUGr0O5rImjN4aLCVKUWOTPb
        BCS5iF/yo9OS8ip5KYWvFvbEbFfCUe4llO46rn8=
X-Google-Smtp-Source: ABdhPJx7S72x8N6FcxwI9/6wb6nVzpWvM06+cZ/F+OSkU391C4Qj0E5AMEA51H/fs0C9Qd6rV3pYb+jmUTST6Shigrw=
X-Received: by 2002:a1c:4444:: with SMTP id r65mr11986723wma.129.1593348536019;
 Sun, 28 Jun 2020 05:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
 <e419a2acea6c1977eaef5d049d607749@kernel.org> <CAHiYmc6wmgHYm688pTFEAoyzD+nE68SPeJgCOcZLb2yRRgwGRg@mail.gmail.com>
 <80132dff49a64d238f775aa0bafe29e1@kernel.org>
In-Reply-To: <80132dff49a64d238f775aa0bafe29e1@kernel.org>
From:   Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Sun, 28 Jun 2020 14:48:43 +0200
Message-ID: <CAHiYmc778AYK1UzOUnrU2VCyUExT3Zhu5nCSqeQOTZK2LbmFUg@mail.gmail.com>
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

=D0=BD=D0=B5=D0=B4, 28. =D1=98=D1=83=D0=BD 2020. =D1=83 14:06 Marc Zyngier =
<maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>
> On 2020-06-28 12:25, Aleksandar Markovic wrote:
> > =D1=81=D1=80=D0=B5, 24. =D1=98=D1=83=D0=BD 2020. =D1=83 10:40 Marc Zyng=
ier <maz@kernel.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=BE/=D0=BB=D0=B0:
> >>
> >> On 2020-06-24 08:44, Tiezhu Yang wrote:
> >> > [git send-email failed due to too many commands,
> >> >  so only cc the major related email and resend it,
> >> >  sorry for that]
> >>
> >> This is becoming majorly annoying.
> >
> > I don't think this is the right vocabulary to welcome newcomers,
> > however "terrible" thinks they did.
> >
> > Rather, patience, calmness and clear and detailed explanations would
> > work much better - and certainly be much more helpful and useful to
> > the community in the long run.
>
> Pray tell how you would have handled this. I expressed *my* personal
> frustration at a SNR hovering below the 25% mark. I have only indicated
> that the current course of action was becoming a problem.
>
> And instead of taking the moral high ground, maybe you could actually
> share your wisdom with Teizhu and help him becoming a better
> contributor?
>

He will improve. This initial clumsiness is normal. It could have been
avoided, true - for example, if he had had someone more experienced at
hand, preferably a co-worker. He obviously acts alone. It will be
better.

> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...
