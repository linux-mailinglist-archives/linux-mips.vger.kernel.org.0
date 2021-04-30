Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857F836F7FA
	for <lists+linux-mips@lfdr.de>; Fri, 30 Apr 2021 11:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhD3Jg1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Apr 2021 05:36:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:43846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhD3Jg0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Apr 2021 05:36:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2680261464;
        Fri, 30 Apr 2021 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619775338;
        bh=+RkSJ5LLQhxLisl3A+EeTPE3JqRhbU73w8Cb0zSAw8Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jFncnDymkF6YiYdbofrbDUzo6zAbs2Ts8dlW49WlnpCSUPD5Y/KTN9d90SqtEutd3
         j0SU3XltK4QVeYjB/7ghQI1cpriO8TlTOkeyzFcSD2GbUSJrz7BBcq5G9Uucpwbzq1
         uBDfO7MGZXSvpM8JQBgSSDHPOFHW8HN/MQylCj5kYlmBRHQ/zOp4lXWF4UpjlNVSwF
         GAcGZnKVKcr8Q6Vo3ngyIWJWBEAkWGHrng85r/mjjILvf4naLnyQHSiqwdF6sqNt/M
         AZmA4uXyCSvDD6BYxkb8+HyHwTXjmNPlAhRRUjf6IhKe7o2nPBXQAC7QMi8r6R802K
         FMFC4/h7TtSQQ==
Date:   Fri, 30 Apr 2021 12:35:32 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Message-ID: <YIvPZNM23Gpt8MAN@kernel.org>
References: <20210418093512.668-1-rppt@kernel.org>
 <20210429210632.GA11767@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429210632.GA11767@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Thu, Apr 29, 2021 at 11:06:32PM +0200, Thomas Bogendoerfer wrote:
> On Sun, Apr 18, 2021 at 12:35:12PM +0300, Mike Rapoport wrote:
> > I'd really appreciate if somebody with access to an Octeon system could
> > test this patch.
> 
> Tested on an Ubiquiti edgerouter 12. Works with problem and I haven't
> even seen a change in memory output.

Is "works with problem" a misprint or something went wrong?
 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

-- 
Sincerely yours,
Mike.
