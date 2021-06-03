Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B35399EFD
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jun 2021 12:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhFCKeF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Jun 2021 06:34:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFCKeE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Jun 2021 06:34:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D65BC613B4;
        Thu,  3 Jun 2021 10:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622716340;
        bh=X5aLnubKAmnjv11r/M1yhgLc/kSlye6ydJVcueRcSJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZFiJY4nZsZfw97zIHkBEr3VpNpMUKzlrhETGTbuErOKNsf/bLe+LuyXJXk5EACpKK
         MZUE7KzGUgKgwe1GiaI40o1kN29hxhkKEknugf+NAqPxGx0S8+0A0QtDAfqTSXBhzZ
         NVDQIJ2oxYkEBkpO4ZhWhSCNg8wsqUOTT3HRj9PLSbeS5jWRqRKQlVtSISMVZEPsZB
         CRaspjduFgAQG0PguB9XyA+3cHreOeMFv9tpLn/bnY4YmfgWn/LS6ExOdkYlu4qguU
         BxSMpkXsv1XZVLcRvR02mvIlfd8BTTGdNmP1ZPmeSV7m5fVMo3pe/F5W157wYxYtti
         L6n25V+hCu22A==
Date:   Thu, 3 Jun 2021 13:32:11 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: Re: [RFC/RFT PATCH 2/5] memblock: introduce generic
 memblock_setup_resources()
Message-ID: <YLivq1QRcStvpsLr@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-3-rppt@kernel.org>
 <20210601135415.GZ30436@shell.armlinux.org.uk>
 <YLdCRoldZFYMZ0BG@linux.ibm.com>
 <20210602101521.GD30436@shell.armlinux.org.uk>
 <YLeNiUkIw+aFpMcz@linux.ibm.com>
 <20210602155141.GM30436@shell.armlinux.org.uk>
 <YLfRVGC+tq5L0TZ6@kernel.org>
 <20210602201502.GP30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602201502.GP30436@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 02, 2021 at 09:15:02PM +0100, Russell King (Oracle) wrote:
> On Wed, Jun 02, 2021 at 09:43:32PM +0300, Mike Rapoport wrote:
> > Back then when __ex_table was moved from .data section, _sdata and _edata
> > were part of the .data section. Today they are not. So something like the
> > patch below will ensure for instance that __ex_table would be a part of
> > "Kernel data" in /proc/iomem without moving it to the .data section:
> > 
> This example has undesirable security implications. It moves the
> exception table out of the read-only mappings into the read-write
> mappings, thereby providing a way for an attacker to bypass the
> read-only protection on the kernel and manipulate code pointers at
> potentially known addresses for distro built kernels.

My point was that __ex_table can be in "Kernel data" or "Kernel rodata"
without loosing the ability to sort it.
 
> You seem to be missing the point I've tried to make. The areas in
> memblock that are marked "reserved" are the areas of reserved memory
> from the firmware _plus_ the areas that the kernel has made during
> boot which are of no consequence to userspace.

I know what areas are marked "reserved" in memblock. 
I never suggested to report "ficticious" reserved areas in /proc/iomem
unless an architecture already reports them there, like arm64 for example.

You are right I should have described better the overall objective, but
sill I feel that we keep missing each other points.

I'll update the descriptions for the next repost, hopefully it'll help.

-- 
Sincerely yours,
Mike.
