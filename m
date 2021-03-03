Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64C632C894
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239874AbhCDAuu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:48192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1388048AbhCCUit (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 15:38:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FECA64F02;
        Wed,  3 Mar 2021 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614803889;
        bh=Yx0ufyFxY9FEVTOvRklHzuQiZwftomZEk2i7KboNUjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ilTahbzufAnF5wfy/PgI1ddWsd7Yf90mAJ/nLrg2RSpQiLoe2ArW5xIlQlwCKNcyS
         HJh4NX38StO3Ro89EqnLc+xybyoVUedyVSRf1t2au0zNzcFEs3lRi896xRI/DTp1zl
         wJdhWF7hlVUtYtgNsRjw3p7WWU5Kk4fAk9tYd5gx5s5yKuT8+/zzBhYxkJjgqCzh9e
         3oMnv5ifzYCjHxDxr0BckBELUnEcpE3KiUZqwRWHvGcoqiFpFMAcZJVriCGVK3NG8I
         4RPxqKuR+OH7yrfuWASADO55aMgYu6/CubG9+x+Yyg+FG/y7v89WfIwuSwg/nQ6Vt9
         6m8t/n7w9N0jw==
Received: by mail-ed1-f50.google.com with SMTP id d13so26827921edp.4;
        Wed, 03 Mar 2021 12:38:09 -0800 (PST)
X-Gm-Message-State: AOAM533hwoBr0h6Q+rBl3dU4aD9hZZvBZeY9p4Lrks1+/LOL+DKfiOz8
        juu8ELNXdahk8SwcdbRqf5RWtXYGofP3WmED4w==
X-Google-Smtp-Source: ABdhPJyt8H5oaA7Fb+xnaivE+CON3fkXfFE8XTR08BqQdAHbVRd+J5a1jbJ76U9wAaGYN0pXBLFCMlBw7AuHdjSNbZk=
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr1029734edr.165.1614803887618;
 Wed, 03 Mar 2021 12:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20210303193305.924384-1-paul@crapouillou.net>
In-Reply-To: <20210303193305.924384-1-paul@crapouillou.net>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 3 Mar 2021 14:37:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
Message-ID: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Since 5.12-rc1, the Device Tree blob must now be properly aligned.

I had checked the other built-in cases as microblaze broke too, but
missed some of the many ways MIPS can have a dtb. Appended and
built-in DTBs were supposed to be temporary. :(

> Therefore, the decompress routine must be careful to copy the blob at
> the next aligned address after the kernel image.
>
> This commit fixes the kernel sometimes not booting with a Device Tree
> blob appended to it.
>
> Fixes: c4d5e638d6e9 ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/compressed/decompress.c | 8 ++++++++
>  arch/mips/kernel/vmlinux.lds.S         | 2 ++
>  2 files changed, 10 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
