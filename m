Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41AF316FC2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 20:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhBJTMV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 14:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbhBJTMQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 14:12:16 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA41C061574;
        Wed, 10 Feb 2021 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=L26cKmNz7SU9IiofXSteKkMeDMi3R4GFZHqSL3D7Whk=; b=Xoc+AHWjr55gRc9WH3MyfZzZxY
        YkWSnErkC4EB1imGAxlxwhhf0Vn+s8z6vMiK64wQG7Dg99j+hMdi4oj4/K6+xX3ECive9W6RkQH/Y
        Oh58fzEdb7idK7mDRM8thjCjpuzrKtpTdq7fFTI2t+94C/VJoz1tjHQcHEgTyMnPIIsOyCN8P6JR6
        1qn7wcBd4QANn+CoLS9rAm8+maJl4gz1hcyKToYsNRkKA7fGB3jmMKqeyOdBgs3LxMbuln3aMoy8S
        vB5aBu8OFWE69ihrnRUUpO+2GnrNwwL3Tav88+kLpuYopYRWEdwGvyPWrWL6PP/noRezyF9TTR4Rg
        MMwdF7Bw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l9utA-009Gyn-Qg; Wed, 10 Feb 2021 19:11:01 +0000
Date:   Wed, 10 Feb 2021 19:11:00 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "MIPS: kernel: {ftrace,kgdb}: Set correct
 address limit for cache flushes"
Message-ID: <20210210191100.GB2208287@infradead.org>
References: <20210210161615.21228-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210161615.21228-1-tsbogend@alpha.franken.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 05:16:13PM +0100, Thomas Bogendoerfer wrote:
> This reverts commit 6ebda44f366478d1eea180d93154e7d97b591f50.
> 
> All icache flushes in this code paths are done via flush_icache_range(),
> which only uses normal cache instruction. And this is the correct thing
> for EVA mode, too. So no need to do set_fs(KERNEL_DS) here.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

... it might be time to kill off the remaining set_fs() users in mips
code as well ...
