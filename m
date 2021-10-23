Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C828438151
	for <lists+linux-mips@lfdr.de>; Sat, 23 Oct 2021 03:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJWBtD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 21:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhJWBtC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Oct 2021 21:49:02 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C751C061764
        for <linux-mips@vger.kernel.org>; Fri, 22 Oct 2021 18:46:44 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id q6so3535346iod.7
        for <linux-mips@vger.kernel.org>; Fri, 22 Oct 2021 18:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4trz9OXm39y9KgQDBqf5aPCATrUHsPHib60Qy9yey4Q=;
        b=FgR2N7rU9X6o8frU+S7MeSZdqRkWVFXm39z6hK29t4N70YRasPn35E28zlSF6G+uyw
         Rgm4MPxKH0MwdhQOfuu/k3k484ngabemJ/F2R6x/n95XCFjGqsEzWTKosypXPjZ8FGMn
         h9VC5mA3bZ17PHB1drFqM2eDuosyFpDqI41aA0iyvEGmL6CQxy9bp7NDIBvJH+c7mL04
         zL4Lhy+UlZN3ukZQ7noO0vBPfGvJolM/p4ZeOxgglJApMHFtAYZe9YOEFth4AY3q8lHq
         I2YbrP6bZb8PedFuEHJREH9tALGGTsvz7cLH5t/jj4hfa1p6yKC6MsusSrG+d+n7QWNf
         E76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4trz9OXm39y9KgQDBqf5aPCATrUHsPHib60Qy9yey4Q=;
        b=ia7G9/R0RVdF5+6e+nO3aeucUt9YnN9PYkAMfdo8Mb36CHax+hzPO4WC+N16VUJBoC
         Ky7brAePSMSY8pQUlf0c78v1kidWyQsyA3DsjhDMceoeSD7P46zmHDABRIWV1SwV0lRq
         apkzr0tyWLgBZqaIxgoCD6COkaxvGTJ1fLQjQnW5lQgs2AqbXkP550M5PYyiwwujxKaR
         qL/E3SOAH8mm9O0Rp8FZxcglDRT/ZSbsuMpqeCtertGRhj+fuMqbcfeJnotaI7R2Edf0
         RYEowHcAP+DXIDNtTQXUmJcguU2MNOXT176Muzh5R6xnLr/zXdy7vWoAfIaUi+Ci+44U
         TW2A==
X-Gm-Message-State: AOAM530jLjV5JtydVb8Glkaim6r1nStDU6osO10D1XiTE9LW3pj6rVQ3
        dIp7ae34GN/UICVwFKklhBp1nhqpo++K0Rs+x6A=
X-Google-Smtp-Source: ABdhPJyhOEPH/Ngx1s2tWI/WxCj0DHFBFu/zKL/1c4zYy+IHdHAx8nh2WMWocTcmxVwCj9Ud0jIOaNz0AbwX1NkdIaw=
X-Received: by 2002:a02:c65a:: with SMTP id k26mr2076899jan.29.1634953603774;
 Fri, 22 Oct 2021 18:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211022112708.962338-1-wanghaojun@loongson.cn> <20211022154544.GA11114@alpha.franken.de>
In-Reply-To: <20211022154544.GA11114@alpha.franken.de>
From:   =?UTF-8?B?5rGf5rWB5YS/?= <jiangliuer01@gmail.com>
Date:   Sat, 23 Oct 2021 09:46:32 +0800
Message-ID: <CAPhSAwtrkz9K_PvRm3viJ4HzZscwM1ZLWTLgY9MPtWYJhyNNKw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Fix build error for brcmstb_gisb
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This was true before, But after 707a4cdf86e5d ("bus: brcmstb_gisb:
Allow building as module") BRCMSTB_GISB_ARB can be a module  in
linux-next.

Thomas Bogendoerfer <tsbogend@alpha.franken.de> =E4=BA=8E2021=E5=B9=B410=E6=
=9C=8822=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8811:46=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Fri, Oct 22, 2021 at 07:27:08PM +0800, Wang Haojun wrote:
> > The GISB bus error handler need board_be_handler, but this
> > code cannot used it when BRCMSTB_GISB_ARB is a module.
> >
> > ERROR: modpost: "board_be_handler" [drivers/bus/brcmstb_gisb.ko] undefi=
ned!
>
> maybe I'm missing a patch but in mips-next tree
>
> config BRCMSTB_GISB_ARB
>         bool "Broadcom STB GISB bus arbiter"
>
> this can't be a module...
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]
