Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDD1333FE1
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 15:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhCJODp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 09:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhCJODU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 09:03:20 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5C0C061760;
        Wed, 10 Mar 2021 06:03:20 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso7284653pjd.3;
        Wed, 10 Mar 2021 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zbb0d/7pdb3JS8aKJvPf/kXhFOq6Ra1kJ13WR6yii/8=;
        b=IKiJQK6WUEY4w1AAtIhiJb33ZSFiXoprqqsujpcyhYiiq72HGfXygDiy3K00uyZ8Aa
         KTYcVnVPDiU4709IiKQt/duApcUvupOqwN+xY/3Ea9uLS0L4cyq69cjs7yKefD4tE/OL
         qzXx+2LulprSdfbxu5jJMS9bcwoGeAmLywiWLJyg5cIsLDxV04S1irVeDmSzmsFFSsL7
         FGOOPPtVGVLxOouakLtybLEbSlTJbViiOomw2GpRG1+ork6r+4Pawnl2Y2bqXk9rI+qT
         TcNcTYL3UcT+AlFwge5Ch1AEchBEeYEusXWaGNA5v0YHEVjNZ2n5FhkxWVEvnPe+qqZk
         7/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zbb0d/7pdb3JS8aKJvPf/kXhFOq6Ra1kJ13WR6yii/8=;
        b=L8EQAyeY4yLYrnymxLOjSCVVxlsp6KvdfKx7WQuuZ+ZJ9q6PSQymn3YGPZZt2Orii9
         KnUiJACXfBEjBeSqs8+71lA/IWlwxZU0Q0jTAlWJsYBGsaVq/H++vcHVD8VJfGOj6CnD
         kbkW4JWtU2AHhy+hYsJ1FkCP11EFcXjYAEsv8Rolv0v0ARqLQqtCa6JiOFLNh7f5YG+2
         8b7b0LMgkyAioT9Zz4u3h8bdtmpSwW+HyqFS4pqzfUoq7aQ9eQ9MPBTnsVNxuhQXUp3M
         8mJXxsvJKZvogtuiuAlXdy+Csx16hLLZxJ2gpfim0+ePmKj9XVbW3DcmXlAK6XodGpWn
         x2uQ==
X-Gm-Message-State: AOAM53353Mmrb5100zljRYDx/gLxh/l5T1xsGt3GsK8kwrwtbKmsxHfV
        MYiHeOxhiLQ4H3OQRw8wE9Aal1BqmD2ZkxsbCOTvTJM8YhuCXA==
X-Google-Smtp-Source: ABdhPJyLUmbAsFKFfoj2tcrbPDZiyc3jMmAvlwM/3GlIB84iLoYnaSFcwmKOxS19nBm4UjZGXfOMrtbxI9owxev6kMg=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr2998400plb.21.1615384999708; Wed, 10 Mar
 2021 06:03:19 -0800 (PST)
MIME-Version: 1.0
References: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com> <1615308057-88387-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1615308057-88387-2-git-send-email-zhouyanjie@wanyeetech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Mar 2021 16:03:03 +0200
Message-ID: <CAHp75VeqQKOfxzPTTkiZH8v2-uXO_YSP3KipMaf9R8gRemK+Og@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: Ingenic: Fix bug and reformat the code.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 9, 2021 at 6:42 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:
>
> 1.Add tabs before values to align the code in the macro definition sectio=
n.
> 2.Fix bugs related to the MAC of JZ4770, add missing pins to the MII grou=
p.
> 3.Adjust the sequence of X1830's SSI related codes to make it consistent
>   with other Ingenic SoCs.
> 4.Fix bug in "ingenic_pinconf_get()", so that it can read the configurati=
on
>   of X1830 SoC correctly.
>

Split to 4 patches then.
It's quite hard for everybody to handle regression fixes like this.


--=20
With Best Regards,
Andy Shevchenko
