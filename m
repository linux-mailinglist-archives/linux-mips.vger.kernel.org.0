Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72FFB8770D
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2019 12:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406209AbfHIKRI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Aug 2019 06:17:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52306 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfHIKRH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Aug 2019 06:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qtavp7CPHfZNeNkYBrPvAtPsbANfqFLQtCdliW3pDao=; b=pag4yExuYAml6RAwW8ClSI/8O
        4SvhyG05DRb/VW/V9CDsF+zHeZ5UXFBZuSEmH6L2R/TkkFTUdvg0G5X+mChPhSDo0bv/G81bqVcOE
        H0+ebgEssg+HPPdNYRmJesf50lZppQPNOWSyxdr7otHpaF8cn8K9ckBUuEcdXQR2moiTTpd1jGx/f
        vjh5YbK7fMXAxAHvYpu7bjS0cCBSZ//FEHycRa1QcZu/mYorpr133FpqiXnyp7o6RFhVYguPt/B8f
        P2fGNwRrQbpxYk76nYUeyruj+MAsigriKyn6idQDkNDTkIb9YC0oHITHhwpJDVUNGhDUhHSp0NaMd
        UOTH8wydQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hw1wn-0006xR-4P; Fri, 09 Aug 2019 10:16:33 +0000
Date:   Fri, 9 Aug 2019 03:16:33 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
Message-ID: <20190809101632.GM5482@bombadil.infradead.org>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
> Should alloc_gigantic_page() be made available as an interface for general
> use in the kernel. The test module here uses very similar implementation from
> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
> needs to be exported through a header.

Why are you allocating memory at all instead of just using some
known-to-exist PFNs like I suggested?
