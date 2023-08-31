Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1177278E71D
	for <lists+linux-mips@lfdr.de>; Thu, 31 Aug 2023 09:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjHaHVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Aug 2023 03:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjHaHVe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Aug 2023 03:21:34 -0400
Received: from out-245.mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1964F1A3
        for <linux-mips@vger.kernel.org>; Thu, 31 Aug 2023 00:21:32 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1693466094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LgfDUD9JxgKk0bOKrlX8A97Lfcy1zdSTIsO3Ef+Irq8=;
        b=uFnC/+7+D8DFe3uA+HDNBKNtTPnc4K9PHKGYfmxgN/OnXNuCUJUKklisT2ssOequlntqf7
        kE5OIt+EhR7R3JGMyIoBAnAyT5ClJPL2kRmfHQqcLXZecAKLmTrTczRBTS3xOUsenQHSyX
        0JHcJG6pZlRupddQsGT8QMOn6PmX2uk=
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] mm: use nth_page() in place of direct struct page
 manipulation.
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230830182753.55367-2-zi.yan@sent.com>
Date:   Thu, 31 Aug 2023 15:14:15 +0800
Cc:     Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <A40C2788-050A-4A1D-8804-5B718B72E879@linux.dev>
References: <20230830182753.55367-1-zi.yan@sent.com>
 <20230830182753.55367-2-zi.yan@sent.com>
To:     Zi Yan <ziy@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Aug 31, 2023, at 02:27, Zi Yan <zi.yan@sent.com> wrote:
> 
> From: Zi Yan <ziy@nvidia.com>
> 
> When dealing with hugetlb pages, manipulating struct page pointers
> directly can get to wrong struct page, since struct page is not guaranteed
> to be contiguous on SPARSEMEM without VMEMMAP. Use nth_page() to handle
> it properly.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Maybe 3 separate patches would be better for backporting purpose.

