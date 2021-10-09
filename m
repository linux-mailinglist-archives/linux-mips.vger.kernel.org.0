Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4F642786E
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 11:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhJIJbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Oct 2021 05:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhJIJbC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Oct 2021 05:31:02 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7A9C061570;
        Sat,  9 Oct 2021 02:29:05 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id q13so8456272uaq.2;
        Sat, 09 Oct 2021 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oLC/VnDaYUY8fgV3Hp40JKJYdSjqq7NCr8LBM7EfoA4=;
        b=STFzCygS9G3fHBUe+dATTfUZp1n67q09x80weyuah1L170rvvoVGCeO+ugxxrKAN/I
         3vFEltznl0ysWFVX6kXnvoO0xJL6tcMDAWRzHC3CWGiQ4MIqezMzJLbOGeNF09XysgPv
         32D0rLpSyA1wKxjm75pWNBNyt2l3ReGF3dQSNMyjauGLWKyeSLUCHuIevnCagNEWJZp3
         XzgiX46uoFt73AWBR1rNF2Tx7i3Y+aQQ7+rvi5S/IW0mReiKIu74VfDVsJYJp4pT0gXr
         r1aM7Hgxe8XZy4pjMOqfIUB3mUzdxHhKtosOhwGmRxuuil2TG2K88MPId4NxSwJP/8r0
         UI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oLC/VnDaYUY8fgV3Hp40JKJYdSjqq7NCr8LBM7EfoA4=;
        b=xKwqmTYZDt1hycVG4Pg+kUKcsOMdVDkdtU+hOR6LH/cWjRAsZGYE6uYLTEXlp62pgA
         L8L0bbtevniji9s6nhVQxYJnrTgyQ0tpbEgSe2GBb2ga3cZ4O+ByhmjxDV2JvibtQnN6
         bezc4b9n2J9gd7oilVh3PD5KlSiHkp1jZAwZA+MpTM1H6KH2OfTKcV/WhLrqZMvuluMT
         wXlkWJvzy1bIlwJiV6gLo034vLq/6g5YHLaRLzzVXz7byFXqlEhY828Ox5L9oVjxGMTa
         4wNHVFsUTWuCv+a/Rcp2BCghU25zJcRCkSFp/8t8WLZx/sR1qxUsXKf7Irk+DKC3Q8xz
         UUeQ==
X-Gm-Message-State: AOAM530KCKSn8PKnuYKbCoyPvFPo1gy50ZPtrMNNZHhYUDSqb7LIxZGX
        7pB3zyJnoxUJFzxRfjeVOSLfvO5HeQyL8flWK+PPx05M
X-Google-Smtp-Source: ABdhPJwvAGyKpGj/2mqKUhbiygn98rJmJJrL0hsfHFhBvDHJxiTchHJtwgWuvoFOrJ10VvnYZV57L/bu7tJCmf1PpqA=
X-Received: by 2002:ab0:538b:: with SMTP id k11mr7618027uaa.131.1633771744631;
 Sat, 09 Oct 2021 02:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211008095311.26475-1-sergio.paracuellos@gmail.com> <YWFUyhO5uRoks6sd@kroah.com>
In-Reply-To: <YWFUyhO5uRoks6sd@kroah.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 9 Oct 2021 11:28:52 +0200
Message-ID: <CAMhs-H-sfgfLwq8wNAjozYfehxp7EF9X++98S5poHooFqMZU7Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: asm: pci: define arch-specific 'pci_remap_iospace()'
 dependent on 'CONFIG_PCI_DRIVERS_GENERIC'
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 9, 2021 at 10:37 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 08, 2021 at 11:53:11AM +0200, Sergio Paracuellos wrote:
> > Some MIPS defconfigs that don't define 'CONFIG_PCI_DRIVERS_GENERIC' but
> > define 'CONFIG_PCI_DRIVERS_LEGACY' or none of them, can fail when they are
> > built since definition for 'pci_remap_iospace' is being done in include
> > file 'arch/mips/include/asm/pci.h' and the specific function implemented
> > in 'arch/mips/pci/pci-generic.c'. MIPS PCI drivers that don't use generic
> > PCI core APIs don't really need 'pci_remap_iospace' to be defined at all.
> > Hence, change definition for 'pci_remap_iospace' to be dependent on the
> > preprocessor 'CONFIG_PCI_DRIVERS_GENERIC' definition to avoid possible
> > build problems.
> >
> > CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Fixes: 9f76779f2418 ("MIPS: implement architecture-specific 'pci_remap_iospace()'")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Hi Greg, Thomas, Stephen,
> >
> > I guess this should also go through the staging-tree.
>
> Now queued up, thanks!

Thanks, Greg!

Best regards,
    Sergio Paracuellos
>
> greg k-h
