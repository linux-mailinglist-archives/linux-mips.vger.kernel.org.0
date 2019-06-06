Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8FEA36C24
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2019 08:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFGUt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Jun 2019 02:20:49 -0400
Received: from verein.lst.de ([213.95.11.211]:47282 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfFFGUt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 6 Jun 2019 02:20:49 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 55AF468B05; Thu,  6 Jun 2019 08:20:19 +0200 (CEST)
Date:   Thu, 6 Jun 2019 08:20:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/16] mm: consolidate the get_user_pages*
 implementations
Message-ID: <20190606062018.GA26745@lst.de>
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-13-hch@lst.de> <b0b73eae-6d79-b621-ce4e-997ccfbf4446@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0b73eae-6d79-b621-ce4e-997ccfbf4446@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 05, 2019 at 11:01:17PM -0700, John Hubbard wrote:
> I started reviewing this one patch, and it's kind of messy figuring out 
> if the code motion preserves everything because of
> all the consolidation from other places, plus having to move things in
> and out of the ifdef blocks.  So I figured I'd check and see if this is
> going to make it past RFC status soon, and if it's going before or after
> Ira's recent RFC ("RDMA/FS DAX truncate proposal").

I don't like the huge moves either, but I can't really think of any
better way to do it.  Proposals welcome, though.
