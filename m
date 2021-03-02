Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E3D32AF6E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237102AbhCCAVJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:21:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:49268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1576079AbhCBEXq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 23:23:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49F8961606;
        Tue,  2 Mar 2021 04:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614658986;
        bh=lQk2rTXCk0WoSO85QnZVV+AZivhTIPVK5TKCRy8JuT4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N3sjDOEAZWFF5uENes1moJyRCf305IUwklhn7alihIjl5RZdaBrzcFz/obK2RHcB1
         egWTtCbU+2/5/ynj/D9UouOA77MEEf57FXLOyp7FxyoSatBD9ShHSZ6hCn8EeIpjx3
         nMgxwON3a9opJ4CHVee1EPW8LbXurKs9q/a0mE0zXG1/ZagJQLpzMDjfJVvBmbR5ob
         EsbGOQ18q4U78lvz3NxUkmv62RmGQdi5/HnfnfbJUOHMdIW8uqnLufnlIFGa6Q0rdu
         ihrwkAepqKjzh1mu/4gV8oFo3BWIb4T3ALUhArR7blWuMHMALf0ErLtg6hbbeXVNwK
         mQFyRdPV1ZxBg==
Received: by mail-io1-f44.google.com with SMTP id n14so20350623iog.3;
        Mon, 01 Mar 2021 20:23:06 -0800 (PST)
X-Gm-Message-State: AOAM530fDiEwV9k9SWK+7iRsP0Njx+jz65KVXWByX+FHPlYAHUAwQp3f
        JFtCfmjHHr1kh+RtDx1ckgSGy0T8JDaKjMl5KL8=
X-Google-Smtp-Source: ABdhPJwCuxTDWMNec7LxiBGqzBgbI4uXzRfU9Oqbf5M3iq1aslJwzVH6Bma13jrgfm6LkNLgMLVTYlhUGGGa2l6FIg4=
X-Received: by 2002:a5e:a508:: with SMTP id 8mr7170210iog.135.1614658985755;
 Mon, 01 Mar 2021 20:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20210301152958.3480-1-tsbogend@alpha.franken.de> <6a746cc8-0a72-c73b-c6bf-780c6ed68d0c@flygoat.com>
In-Reply-To: <6a746cc8-0a72-c73b-c6bf-780c6ed68d0c@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 2 Mar 2021 12:22:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6fke1AnCSLC39qTgKbKGLheHO=qQZ=MUCVMvegBvop9g@mail.gmail.com>
Message-ID: <CAAhV-H6fke1AnCSLC39qTgKbKGLheHO=qQZ=MUCVMvegBvop9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Remove KVM_GUEST support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Mar 2, 2021 at 10:27 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
>
>
> =E5=9C=A8 2021/3/1 =E4=B8=8B=E5=8D=8811:29, Thomas Bogendoerfer =E5=86=99=
=E9=81=93:
> > KVM_GUEST is broken and unmaintained, so let's remove it.
> >
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> I'll prepare a patch for KVM side removal.
>
> Thanks.
>
> - Jiaxun
