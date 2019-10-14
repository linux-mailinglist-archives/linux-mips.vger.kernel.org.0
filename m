Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2BEBD6163
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 13:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbfJNLeK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 14 Oct 2019 07:34:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:48360 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726573AbfJNLeK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Oct 2019 07:34:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CA2A0AF41;
        Mon, 14 Oct 2019 11:34:08 +0000 (UTC)
Date:   Mon, 14 Oct 2019 13:34:08 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
Message-Id: <20191014133408.24fb17711d942effc92e27ee@suse.de>
In-Reply-To: <5c6ab720-218a-14aa-9112-a12b88b63bc2@gentoo.org>
References: <20191009155928.3047-1-tbogendoerfer@suse.de>
        <20191009184311.GA20261@infradead.org>
        <5c6ab720-218a-14aa-9112-a12b88b63bc2@gentoo.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 11 Oct 2019 20:33:43 -0400
Joshua Kinard <kumba@gentoo.org> wrote:
> http://bxr.su/OpenBSD/sys/arch/sgi/sgi/ip30_machdep.c
> 
> 144    /*
> 145     * Register DMA-reachable memory constraints.
> 146     * The xbridge(4) is limited to a 31-bit region (its IOMMU features
> 147     * are too restricted to be of use).
> 148     */
> 149    dma_constraint.ucr_low = 0;
> 150    dma_constraint.ucr_high = (1UL << 31) - 1;
> 
> I never figured out how in Linux one does something equivalent.  I knew it
> needed to be done in the older dma-coherence.h file, and now in the newer
> __phys_to_dma() function here.  This is, if memory recalls correctly,
> because >2GB RAM in Octane causes issues w/ BRIDGE DMA access.

32bit DMA is always limited to 2GB address range by bridge. Right now we 
our code doesn't support 32bit DMA access at all, because it was not really
usefull for IP27. With IP30 it's probably more usefull, but my current focus
is getting basic IP30 support merged and improve it from there. And as this
is a bridge limititation everything can still be placed in pci-xtalk-bridge.c

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
