Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59406C1079
	for <lists+linux-mips@lfdr.de>; Mon, 20 Mar 2023 12:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCTLOQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Mar 2023 07:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjCTLNr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Mar 2023 07:13:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B589756;
        Mon, 20 Mar 2023 04:11:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 659FFB80E44;
        Mon, 20 Mar 2023 11:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3B3C433EF;
        Mon, 20 Mar 2023 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679310679;
        bh=6AY7P5Fx7A+yFHSErX2MDPUYaVasPAcdDOGMev+gmjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GViCCd5boJ4qQpbAS8kXK/2PJJbqX9jON3FCAckuEkFU9lqTmc5xW1ib8HhZtt95o
         WsgEJaFz0zi2hrWzHZjlvxH0OCxohNxGDlb8hnmDRICCRIs2xdrhZjDRXB6vZ8EiBv
         m0Su2i+97dJWYQo26JBWQifLVdNE+G4PraqEvj0TY1i49nydtVYC1TMn7l1lILzTCK
         xktIR+q30KLbG0QZYtt1bHS9HPwp1tRSN8Gz6PkTsGKS4gD8jtq8kv0d7LyNERWZ+L
         w8kTVeaRvdkoASjoEgKpXp5ToyD5bhn+85sl1ofjEz4N62HDv1VA4d/K2VTiuAu8iR
         lIrwG1KURaVVQ==
Date:   Mon, 20 Mar 2023 13:11:04 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 02/15] mm/cma: move init_cma_reserved_pages() to cma.c
 and make it static
Message-ID: <ZBg/SCbVBAqNCU+F@kernel.org>
References: <20230319220008.2138576-1-rppt@kernel.org>
 <20230319220008.2138576-3-rppt@kernel.org>
 <8a461e44-7d24-5b5d-db04-e7fa85beeaa7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a461e44-7d24-5b5d-db04-e7fa85beeaa7@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 20, 2023 at 11:30:20AM +0100, David Hildenbrand wrote:
> On 19.03.23 22:59, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > init_cma_reserved_pages() only used in cma.c, no point of having it in
> > page_alloc.c.
> > 
> > Move init_cma_reserved_pages() to cma.c and make it static.
> 
> I guess the motivation is to avoid letting too many subsystems mess with
> pageblock migratetypes, managed pages, PG_reserved ...

Judging by the git log it just ended up in page_alloc.c because
set_pageblock_migratetype() was static back then ;)
 
> So it kind of makes sense to have these low-level details out of common CMA
> code, no?

I don't mind keeping it out of cma and folding this into "grand move"
patch.
 
> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
