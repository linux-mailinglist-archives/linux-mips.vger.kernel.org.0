Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2F03975B1
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 16:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhFAOox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 10:44:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234071AbhFAOox (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 10:44:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B9A613BD;
        Tue,  1 Jun 2021 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622558591;
        bh=aK0RlRyWoSYtVILdmkViJLsbSuso5p8tNph0zN6qNcE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gEyjDGbYn/8h7clT8wIC6DjDBzdMBMLjzK+z/VacsBeBydVeYRi36P+clnMWhuruz
         qIky0S/qhaRSoGDfU0VQo3lpyeTuzAKFlJOfCsZnTWtYVCo8xTzixH5HicNxfrWzIs
         jC347rqKRUNpa8dYS/W1fVMw3N6C07tQRg4zjtJp+j7Kig4gXUGfXlPb96JCL3Yx0M
         uHp/W61BBTBmbzFX1JVqy+NLL2ho2UjzCLcYw0yaAmyoY46C5ZnND+b/e7Q/9odfc/
         5qFnONxwzaZ84i2aM+D/EbRZ9Spx94ErWzX9AvV3EHC20/sDiiRQavSgJvJcNJng+i
         L10lAcn9S94GQ==
Received: by mail-ot1-f42.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so14372569otl.3;
        Tue, 01 Jun 2021 07:43:11 -0700 (PDT)
X-Gm-Message-State: AOAM533BRW+rBlfhLxfhnU0TskNQqmVmzgohkdNaL2jKiT1zdnQJkTH3
        unK9RaAZkEMnxkYCYphg+EvIsONMNVXFUM5KPAY=
X-Google-Smtp-Source: ABdhPJwpUYd6BbXI0oH+kxGNkUDu8zNpRJZxy0SyxpnWuYsejCDXbDiHZbV3O5NKUqTafh992A8muKy21rhHAzu1FKw=
X-Received: by 2002:a9d:6186:: with SMTP id g6mr7275975otk.246.1622558591129;
 Tue, 01 Jun 2021 07:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210531184749.2475868-2-arnd@kernel.org>
 <20210601132327.GX30436@shell.armlinux.org.uk>
In-Reply-To: <20210601132327.GX30436@shell.armlinux.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 1 Jun 2021 16:41:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3tEJOBH6AfZuFCcpA6HcLWLWb89L7MxuO2qepOwCrF-A@mail.gmail.com>
Message-ID: <CAK8P3a3tEJOBH6AfZuFCcpA6HcLWLWb89L7MxuO2qepOwCrF-A@mail.gmail.com>
Subject: Re: [PATCH 1/7] mips: ar7: convert to clkdev_lookup
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 1, 2021 at 3:23 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> >   */
> >
> > +#include <linux/clkdev.h>
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> >  #include <linux/types.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/io.h>
> >  #include <linux/err.h>
> >  #include <linux/clk.h>
> > +#include <linux/clkdev.h>
>
> Did you mean to include this twice?
>

I thought I had fixed that earlier, but apparently edited the wrong patch.
Thanks for finding it, fixed now.

        Arnd
