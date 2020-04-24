Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DA91B81B3
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 23:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDXVqR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 17:46:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:53504 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgDXVqR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 17:46:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jS69H-0007ly-00; Fri, 24 Apr 2020 23:46:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 557ACC02EB; Fri, 24 Apr 2020 23:36:23 +0200 (CEST)
Date:   Fri, 24 Apr 2020 23:36:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Clear XContext at boot time
Message-ID: <20200424213623.GA23556@alpha.franken.de>
References: <20200422144535.1253459-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422144535.1253459-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 22, 2020 at 10:45:34PM +0800, Jiaxun Yang wrote:
> XContext might be dirty at boot time. We need to clear it
> to ensure early stackframe is safe.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/head.S | 3 +++
>  1 file changed, 3 insertions(+)
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
