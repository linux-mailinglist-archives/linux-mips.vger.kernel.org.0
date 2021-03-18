Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A338633FF7D
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 07:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhCRGZL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 02:25:11 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:32804 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRGZA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 02:25:00 -0400
X-Greylist: delayed 1192 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 02:24:59 EDT
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lMlcV-0073HK-IW; Thu, 18 Mar 2021 05:54:55 +0000
Date:   Thu, 18 Mar 2021 05:54:55 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Message-ID: <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318045706.200458-2-hch@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
> Switch the alpha defconfig from the legacy ide driver to libata.

Umm...  I don't have an IDE alpha box in a usable shape (fans on
CPU module shat themselves), and it would take a while to resurrect
it, but I remember the joy it used to cause in some versions.

Do you have reports of libata variants of drivers actually tested on
those?
