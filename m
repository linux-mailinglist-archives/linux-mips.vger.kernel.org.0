Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF8735E31F
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 17:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239357AbhDMPrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 11:47:10 -0400
Received: from verein.lst.de ([213.95.11.211]:55281 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237575AbhDMPrJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 11:47:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C892567373; Tue, 13 Apr 2021 17:46:46 +0200 (CEST)
Date:   Tue, 13 Apr 2021 17:46:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
Message-ID: <20210413154646.GC27287@lst.de>
References: <20210412085545.2595431-1-hch@lst.de> <20210412085545.2595431-5-hch@lst.de> <da779585-60c6-2f4b-feaf-db45e1eef262@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da779585-60c6-2f4b-feaf-db45e1eef262@gmx.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 13, 2021 at 05:43:18PM +0200, Helge Deller wrote:
> On 4/12/21 10:55 AM, Christoph Hellwig wrote:
>> The F_GETLK64/F_SETLK64/F_SETLKW64 commands are only implemented for
>> 32-bit syscall APIs, but we also need them for compat handling on 64-bit
>> kernels.
>
> Ok.
>
>> Given that redefining them is rather error prone, as shown by parisc
>> getting the opcodes wrong currently, just use the existing definitions
>> for the compat handling.
>
> Can you please show me where parisc gets it currently wrong?
> I'm somehow blind to see it and of course I'd like to fix it in
> stable kernel series if that's true...

Looking again I think my comment was wrong, I thought parisc would
fall back to the asm-generic version with different code points for
the compat case, but parisc actually already defines the constants
unconditionally like this patch does for everyone else.  So I'll
retract that part of the comment.
