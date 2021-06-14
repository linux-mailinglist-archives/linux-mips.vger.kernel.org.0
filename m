Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00403A5F91
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 11:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhFNJ7o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 05:59:44 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:43526 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhFNJ7m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 05:59:42 -0400
Received: by mail-oo1-f54.google.com with SMTP id z14-20020a4a984e0000b029024a8c622149so1995553ooi.10
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17xdYDaXcr1GgYwnSmChvSTc/UXYmZQtZNjoRDgyHAw=;
        b=cZEhqQwUMi3qA2skVWLwd278vC0Of6ba8gN/ywOqCCPGS2nVuE5tlQ3Ec/BCfmY21k
         R9Ay7mTCx4f494TfLoQwYgM5qMWjZz4ZeOJ3ThrxH54CT2h1CMfpU+jz69bsTOgXJkJ0
         zrm0RAdmF0RWeqH8203uXoRnvqCC21rwONaz07Oeh3aKDJEnWNCUa3E/yUDJCFrBUzzZ
         lZRtRpgFOAPlGiBe+9NYqJNScFMRNAxGh7yoClYylxwtVqcFa0x9TtP64+gHhr+6yMsS
         Or8sJAeAZRQI2iEcXsiGCBr2ywyq87AqlR/hEdzHE86ox4DqD2aqHvW4/R9HGK0fRN5K
         h2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17xdYDaXcr1GgYwnSmChvSTc/UXYmZQtZNjoRDgyHAw=;
        b=SdSaSkT5UnsRC16D7KaM4uQCP5xFT7iWUjXmoyn+AYsfwrs5ra1NJCiOX0HvKauheH
         Fgpm2wgZ7xRfGn1fuh0FiLf2dN+r23/fkZlmEyf0Aw5KtV3qqHn0QkSlHWYXszQi3zKE
         2LfiKrYD5jMPsrM+blMA1ERngTf9dqGZRFR3tnHc+L1AZSH5Ns5vDtS4mP6vFkTNlpf6
         f0vyO58hA43ZpWdpG5LJPz2OcPLCOl3BzMwTw69/T2x++CI6hto2fEt4yVIFqnmwFUOf
         1cGhEVmI98EkeC7fdXELrqe1o2EO+IDhKHWmGPD/KpM/d6YEe5nz8rTNVVMkisDcm8cv
         8VKg==
X-Gm-Message-State: AOAM533tZe4rbJQ4mm/lia8ZqbmXdF6PjZwSCb3I9e77VFz+3I1dGWjl
        oMO+SgPk12j8bEBg2kodJcuHULJ4sZz8v2QcvoY=
X-Google-Smtp-Source: ABdhPJxK+IiZ7hAc2SVBDlCb8Xoaf0kIEdwUnJ0Ua2eG3Zz2A1TApntQ8+Di6xjSdvMmjoD8JVgG2AOZjxp78QuDPs8=
X-Received: by 2002:a05:6820:386:: with SMTP id r6mr12312802ooj.25.1623664599826;
 Mon, 14 Jun 2021 02:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
 <20210613155623.17233-2-sergio.paracuellos@gmail.com> <12f81f6e-41be-7e0f-5590-67591c722a38@gmail.com>
In-Reply-To: <12f81f6e-41be-7e0f-5590-67591c722a38@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 14 Jun 2021 11:56:28 +0200
Message-ID: <CAMhs-H_tb8B52+-i1mLMWfEbgcuvngfdm=UzpxZmiaBKA=ywxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: ralink: Define PCI_IOBASE
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-staging@lists.linux.dev,
        Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergei,

On Mon, Jun 14, 2021 at 11:13 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> Hello!
>
> On 13.06.2021 18:56, Sergio Paracuellos wrote:
>
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
> >   arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >   create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> >
> > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > new file mode 100644
> > index 000000000000..ec58d4a9ed05
> > --- /dev/null
> > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > +#define __ASM_MACH_RALINK_SPACES_H_
> > +
> > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > +#define PCI_IOSIZE   SZ_16M
> > +#define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)
>
>     Why this sudden switch to spaces for indentation? Previous lines were
> (correctly) indented with tabs...

I don't really know what could have happened, honestly. I will fix
spaces into tabs and send v2.

>
> > +
> > +#include <asm/mach-generic/spaces.h>
> > +#endif
>
> MBR, Sergei

Best regards,
    Sergio Paracuellos
