Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9390C1E5E1F
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 13:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbgE1LUo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 07:20:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42856 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388304AbgE1LUn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 07:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590664841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0pDdsaPJ9DSWTCG29xVVgPA72+92+ZpKaGKhvHYc8/o=;
        b=cnGYK2JC5bYnTT2Pd08ImODjvO31mfBzx6DCuwCatJUslkIA68z3sN8V+SAI0uwCmF7riy
        oZ98Ejx2vo6hC9D5lt4lZqF3Ah6wX+67qWpQUied2otSd9O0NlcXwKUJNXT0AMsTpkVBtM
        qZOOCOQ7RFgWFcEOIQTt0/klvhEp9jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-rz4JWXClNKyU_Z2vtGkSbw-1; Thu, 28 May 2020 07:20:37 -0400
X-MC-Unique: rz4JWXClNKyU_Z2vtGkSbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F14805730;
        Thu, 28 May 2020 11:20:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.rdu2.redhat.com [10.10.113.1])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E409A7A8B6;
        Thu, 28 May 2020 11:20:26 +0000 (UTC)
Date:   Thu, 28 May 2020 07:20:25 -0400
From:   Jerome Glisse <jglisse@redhat.com>
To:     Hugh Dickins <hughd@google.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Huang Ying <ying.huang@intel.com>,
        linux-kernel@vger.kernel.org,
        Steven Capper <steve.capper@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rabin Vincent <rabinv@axis.com>,
        linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk,
        Guo Ren <guoren@kernel.org>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        nios2-dev@lists.rocketboards.org, linux-parisc@vger.kernel.org,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
        linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
        Chris Zankel <chris@zankel.net>
Subject: Re: Cache flush issue with page_mapping_file() and swap back shmem
 page ?
Message-ID: <20200528112025.GA10175@redhat.com>
References: <20200528002033.GB1992500@redhat.com>
 <alpine.LSU.2.11.2005272021220.3857@eggly.anvils>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LSU.2.11.2005272021220.3857@eggly.anvils>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 27, 2020 at 08:46:22PM -0700, Hugh Dickins wrote:
> Hi Jerome,
> 
> On Wed, 27 May 2020, Jerome Glisse wrote:
> > So any arch code which uses page_mapping_file() might get the wrong
> > answer, this function will return NULL for a swap backed page which
> > can be a shmem pages. But shmem pages can still be shared among
> > multiple process (and possibly at different virtual addresses if
> > mremap was use).
> > 
> > Attached is a patch that changes page_mapping_file() to return the
> > shmem mapping for swap backed shmem page. I have not tested it (no
> > way for me to test all those architecture) and i spotted this while
> > working on something else. So i hope someone can take a closer look.
> 
> I'm certainly no expert on flush_dcache_page() and friends, but I'd
> be very surprised if such a problem exists, yet has gone unnoticed
> for so long.  page_mapping_file() itself is fairly new, added when
> a risk of crashing on a race with swapoff came in: but the previous
> use of page_mapping() would have suffered equally if there were such
> a cache flushinhg problem here.
> 
> And I'm afraid your patch won't do anything to help if there is a
> problem: very soon after shmem calls add_to_swap_cache(), it calls
> shmem_delete_from_page_cache(), which sets page->mapping to NULL.
> 
> But I can assure you that a shmem page (unlike an anon page) is never
> put into swap cache while it is mapped into userspace, and never
> mapped into userspace while it is still in swap cache: does that help?
> 

You are right i missed/forgot the part where shmem is never swapcache
and mapped at the same time, thus page_mapping_file() can return NULL
for those as they can no longer have alias mapping.

Thank you Hugh
Jérôme

