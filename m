Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E863A7E48
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 14:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhFOMkU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 08:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhFOMkT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Jun 2021 08:40:19 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A87C061574
        for <linux-mips@vger.kernel.org>; Tue, 15 Jun 2021 05:38:14 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so14121168otk.5
        for <linux-mips@vger.kernel.org>; Tue, 15 Jun 2021 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ficQ6Tww5rQWbuZhPE3EU+jqogC/DlraVO6vAn62sH8=;
        b=Lp+48USM5gnu+eeiY9Ryndm4K5fG/VsCibPh6LcsrDucCKozYimMQbl3c5s+M9nTd2
         kWSmLb1v/6huguWcIj5VMtNX8v8JJ3iEFARDXK3PZcl0yhm4u8om8kGk9jl2uHnjvCqc
         T1ZVitgGHX3+mzf1uc5QBYfeBS1gEfgQdebwp6YZos97rmVDouzW2Eo4Df+Teos8bytb
         h3l3fzGY0JAm+muk3HTuDiEmkPUiX/s/1c9WE/HreoqIlVEFbftB4UEICL+CGx5P5/mt
         EmWgnENkf3qQ03D6T0tBhGTEZcJLbm94Z9GBugQeNIn86VAeehW9NMChjaNfoR5cOp3y
         fNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ficQ6Tww5rQWbuZhPE3EU+jqogC/DlraVO6vAn62sH8=;
        b=SNS01YokfEQlM83HMFXtCvA43XXpIhogtA6AAGnk/6Eg+XBC1Nt8cOYYnoeJOgahR/
         eOxe5htBZBDrlIUktIfRNywznYQf4Pwpj7pxESqIgbXAUx0EqGhx3zvQOrc6kloUsqQB
         ZeUgXc5poULfRwj2fGqNVNwIzIJmCGGCFEXeszSWav5iAkQtGqh6bxGBcD4D+a14Fsb/
         QM70LQ0REaQ6yik5fr9Jrmo9c985BHpb0c0HRSmquX9SQzotzQy8pUcYA//3vzcpTqSp
         oSmedo2ZyDkLrJdcgmm4BB3Td3CN2OD7YLtc+iLWWW3OYxzFnJIPFuQ3JxXdUx7PudGP
         6Vow==
X-Gm-Message-State: AOAM5311Ggi+P4ANhxo8qjvr5s9wTPnUXHWX6xwwBbhAimX85Bj53Akw
        nkdROa+JNLxVe728f/a1ghAcaWvF6EumLwDlVS/DyDQbmhvEjw==
X-Google-Smtp-Source: ABdhPJw0GeGfibEnccUzSpoNh5NwbGf8dGBP93VtfjUh74h4iIR91O5ulOPCrMrUMeeckCmb0NxMwdAgQVTm490yoMU=
X-Received: by 2002:a05:6830:99:: with SMTP id a25mr17941206oto.72.1623760693573;
 Tue, 15 Jun 2021 05:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <YMiUKkYL7B7qTU/X@kroah.com>
In-Reply-To: <YMiUKkYL7B7qTU/X@kroah.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 15 Jun 2021 14:38:02 +0200
Message-ID: <CAMhs-H8SJttFRUtE-sbqNbOAAiht1SaYMzVZGU0Zqzuat1pCPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 15, 2021 at 1:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > required by generic PCI drivers to make memory mapped I/O range
> > work. Hence define it for ralink architectures to be able to
> > avoid parsing manually IO ranges in PCI generic driver code.
> > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > call using '0xa0000000' as address, so use the same address in
> > the definition to align things.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> >
> > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > new file mode 100644
> > index 000000000000..87d085c9ad61
> > --- /dev/null
> > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > +#define __ASM_MACH_RALINK_SPACES_H_
> > +
> > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > +#define PCI_IOSIZE   SZ_16M
> > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > +
> > +#include <asm/mach-generic/spaces.h>
> > +#endif
> > --
> > 2.25.1
> >
> >
>
> I really can't take a change outside of drivers/staging/ for a staging
> driver.
>
> So unless you can get a MIPS maintainer to ACK this, I can't accept
> this change, sorry.

I know, I was expecting Thomas to ACK this, if it is ok. Thomas, what
do you think about this?

Best regards,
    Sergio Paracuellos

>
> greg k-h
