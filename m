Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD759427829
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 10:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhJIIj3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Oct 2021 04:39:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhJIIj3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Oct 2021 04:39:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3743D60C51;
        Sat,  9 Oct 2021 08:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633768652;
        bh=PEkYwYgugusJNveTHtPM/momyKTuWgG/jV48rZhk2/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YSrmYNGWsD1p57wGlIBnu2OB41VUpftiPTsua7raYW7D+WeCvnKn5dVa/ShVwi0Mf
         orFVlc8YGUMTQDETXMU4CACUA5dMyhZKS5rx1orHOw+AQapdSeTl3PMuEWKqWoUFwM
         3JEG67nTy0fgTZD/jAPzwuZYc2jOfU94nZ8epaZU=
Date:   Sat, 9 Oct 2021 10:37:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] MIPS: asm: pci: define arch-specific
 'pci_remap_iospace()' dependent on 'CONFIG_PCI_DRIVERS_GENERIC'
Message-ID: <YWFUyhO5uRoks6sd@kroah.com>
References: <20211008095311.26475-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008095311.26475-1-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 08, 2021 at 11:53:11AM +0200, Sergio Paracuellos wrote:
> Some MIPS defconfigs that don't define 'CONFIG_PCI_DRIVERS_GENERIC' but
> define 'CONFIG_PCI_DRIVERS_LEGACY' or none of them, can fail when they are
> built since definition for 'pci_remap_iospace' is being done in include
> file 'arch/mips/include/asm/pci.h' and the specific function implemented
> in 'arch/mips/pci/pci-generic.c'. MIPS PCI drivers that don't use generic
> PCI core APIs don't really need 'pci_remap_iospace' to be defined at all.
> Hence, change definition for 'pci_remap_iospace' to be dependent on the
> preprocessor 'CONFIG_PCI_DRIVERS_GENERIC' definition to avoid possible
> build problems.
> 
> CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Fixes: 9f76779f2418 ("MIPS: implement architecture-specific 'pci_remap_iospace()'")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Hi Greg, Thomas, Stephen,
> 
> I guess this should also go through the staging-tree.

Now queued up, thanks!

greg k-h
