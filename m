Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7C437B03D
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 22:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhEKUtW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 16:49:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:50412 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEKUtV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 16:49:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZIb-0003nj-03; Tue, 11 May 2021 22:48:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 245B2C0E42; Tue, 11 May 2021 22:47:58 +0200 (CEST)
Date:   Tue, 11 May 2021 22:47:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Subject: Re: Some doubts about mt7621-pci mainline place
Message-ID: <20210511204758.GD18185@alpha.franken.de>
References: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 10, 2021 at 08:43:51AM +0200, Sergio Paracuellos wrote:
> in staging and is properly using the pci generic APIs instead of the
> PCI_LEGACY which seems that all other drivers in 'arch/mips/pci' are
> using. The driver is generic enough but it needs mips iocu region
> configuration that is done in the driver itself. So here it is where
> my questions come. Is 'arch/mips/pci' the place to move this driver?

moving to arch/mips/pci would work for me. Could you look at converting
the driver to PCI_DRIVERS_GENERIC instead of LEGACY ? I want to
get rid of PCI_LEGACY...

> Is the driver the correct place to configure the iocu related with
> pci?

I see no problem with this at the moment.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
