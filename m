Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0D741A6B5
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 06:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238888AbhI1Eoy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 00:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhI1Eox (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 00:44:53 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889ACC061575;
        Mon, 27 Sep 2021 21:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=QhqndkOgZUxmdSOkmVYTLDB3+1GBg21QeCq/Vol6ZYQ=; b=kSH464FMdMBHdCq0PrEWepJMkm
        uRUp8GDw1x1dx7m1B52yQP25ZvFjt7hcTm/PXRy+130Da97dEruCddLTkXvvEBtPsT/ndukl52ylU
        Ai3oIbjnTOpKtMNyyPkY+YK6r7Do3DsK8bab2k+M7dimqlMMUfhaw431/XV+2sxqy+7xWZmrlLsiU
        0EhRqOW7moURELpaeJ8YnTK5iruqbwjHKKf2V6pL65dC6gGRheU9l3fl620aGIhoaAkln2LrhGDR7
        xjWmDbTqwKa831LX6HJVawyfExGMqk9TLT8mZ9VEeff05SBMWOAqucMJvXtWk3G+eIeezcCEuWCP5
        ODeh0VCw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mV4wR-00AUi0-1z; Tue, 28 Sep 2021 04:42:14 +0000
Date:   Tue, 28 Sep 2021 05:42:07 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mmap: Define index macros for protection_map[]
Message-ID: <YVKdH4G5Alfwjkix@infradead.org>
References: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
 <YVHcCZXmQ1yjINaf@infradead.org>
 <f224c661-f8f0-3c4a-bad8-095209412dd4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f224c661-f8f0-3c4a-bad8-095209412dd4@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 28, 2021 at 08:24:43AM +0530, Anshuman Khandual wrote:
> > simple switch statement provided by each architecture.  See the below
> > WIP which just works for x86 and without pagetable debugging for where I
> > think we should be going.
> 
> Sure, this will work as well but all platforms need to be changed at once.
> Is there any platform that would not subscribe ARCH_HAS_GET_PAGE_PROT and
> export its own vm_get_page_prot() ? AFAICS all platforms are required to
> export __PXXX and __SXXX elements currently.
> 
> This seems to be a better idea than the current proposal. Probably all the
> vm_flags combinations, which will be used in those switch statements can be
> converted into macros just to improve readability. Are you planning to send
> this as a proper patch soon ?

This was just a quіck WIP patch.  If you have some spare time to tackle
it for real I'd sugget the following approach:

 1) Remove the direct references to protection_map in debug_vm_pgtable.c
 2) add the ARCH_HAS_GET_PAGE_PROT symbol that lets architectures
    provide vm_get_page_prot itself and not define protection_map at all
    in this case
 3) convert all architectures that touch protection_map to provide
    vm_get_page_prot themselves
 4) mark protection_map static
 5) convert all architectures that provide arch_filter_pgprot and/or
    arch_vm_get_page_prot to provide vm_get_page_prot directly and
    remove those hooks
 6) remove the __S???/__P??? macros and the generic vm_get_page_prot
    after providing an arch implementation for every architecture.
    This can maybe simplified with a new generic version that directly
    looks at PAGE_* macros, but that will need further investigation
    first.
