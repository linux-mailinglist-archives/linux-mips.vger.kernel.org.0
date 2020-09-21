Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5E9273482
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 23:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbgIUVAF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 17:00:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:49828 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727513AbgIUU7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-01; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E43E1C0FE4; Mon, 21 Sep 2020 22:23:51 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:23:51 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pujin Shi <shipujin.t@gmail.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hankinsea@gmail.com, Pujin Shi <shipj@lemote.com>
Subject: Re: [PATCH v2] MIPS: kernel: include probes-common.h header in
 branch.c
Message-ID: <20200921202351.GA29322@alpha.franken.de>
References: <20200921161821.2350-1-shipujin.t@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921161821.2350-1-shipujin.t@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 22, 2020 at 12:18:21AM +0800, Pujin Shi wrote:
> arch/mips/kernel/branch.c:876:5: error: no previous prototype for '__insn_is_compact_branch' [-Werror=missing-prototypes]
> 
> Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
> Signed-off-by: Pujin Shi <shipj@lemote.com>
> ---
>  arch/mips/kernel/branch.c | 2 ++
>  1 file changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
