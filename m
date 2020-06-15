Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF601F946D
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 12:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgFOKQM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 06:16:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:34158 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728505AbgFOKQL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jun 2020 06:16:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jkm9s-0005U9-00; Mon, 15 Jun 2020 12:16:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C39B8C0688; Mon, 15 Jun 2020 12:14:43 +0200 (CEST)
Date:   Mon, 15 Jun 2020 12:14:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Do not flush tlb when setting pmd entry
Message-ID: <20200615101443.GA10075@alpha.franken.de>
References: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591177333-17833-1-git-send-email-maobibo@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 03, 2020 at 05:42:13PM +0800, Bibo Mao wrote:
> Function set_pmd_at is to set pmd entry, if tlb entry need to
> be flushed, there exists pmdp_huge_clear_flush alike function
> before set_pmd_at is called. So it is not necessary to call
> flush_tlb_all in this function.

have you checked all set_pmd_at() calls ? I found a few case where
it's not clear to me, if tlb flushing is done... If you think this
is still the right thing to do, please change arch/mips/mm/pgtable-32.c
as well.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
