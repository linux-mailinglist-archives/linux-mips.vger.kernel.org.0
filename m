Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B90C2D9D18
	for <lists+linux-mips@lfdr.de>; Mon, 14 Dec 2020 18:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgLNQ7j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 11:59:39 -0500
Received: from elvis.franken.de ([193.175.24.41]:40392 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440300AbgLNQ73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 11:59:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1korBJ-0006zU-01; Mon, 14 Dec 2020 17:58:41 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 82679C0386; Mon, 14 Dec 2020 16:35:58 +0100 (CET)
Date:   Mon, 14 Dec 2020 16:35:58 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     chenhuacai@kernel.org
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
Message-ID: <20201214153558.GB9983@alpha.franken.de>
References: <1607158507-11888-1-git-send-email-chenhuacai@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607158507-11888-1-git-send-email-chenhuacai@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 05, 2020 at 04:55:07PM +0800, chenhuacai@kernel.org wrote:
> From: Huacai Chen <chenhuacai@kernel.org>
> 
> Use @kernel.org address as the main communications end point. Update the
> corresponding M-entries and .mailmap (for git shortlog translation).
> 
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
