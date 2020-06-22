Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2628B203B8A
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2020 17:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729673AbgFVPvS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jun 2020 11:51:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:33902 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729577AbgFVPvS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jun 2020 11:51:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jnOj4-0002AG-00; Mon, 22 Jun 2020 17:51:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BA609C06E9; Mon, 22 Jun 2020 17:44:53 +0200 (CEST)
Date:   Mon, 22 Jun 2020 17:44:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: Unify naming style of vendor CP0.Config6 bits
Message-ID: <20200622154453.GA17294@alpha.franken.de>
References: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 17, 2020 at 08:34:42PM +0800, Huacai Chen wrote:
> Other vendor-defined registers use the vendor name as a prefix, not an
> infix, so unify the naming style of CP0.Config6 bits.
> 
> Suggested-by: Maciej W. Rozycki" <macro@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Maciej,

before applying I'd like to get a comment from you, if things are now
in a good shape.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
