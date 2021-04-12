Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B25835C988
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 17:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242686AbhDLPRI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 11:17:08 -0400
Received: from elvis.franken.de ([193.175.24.41]:45479 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238015AbhDLPRH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 11:17:07 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lVyIy-0006wH-02; Mon, 12 Apr 2021 17:16:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A97A7C02C4; Mon, 12 Apr 2021 17:06:16 +0200 (CEST)
Date:   Mon, 12 Apr 2021 17:06:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: Re: [PATCH] MIPS: uaccess: Reduce number of nested macros
Message-ID: <20210412150616.GC23632@alpha.franken.de>
References: <20210408181437.19570-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408181437.19570-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 08, 2021 at 08:14:37PM +0200, Thomas Bogendoerfer wrote:
> Clean up macros even further after removal get_fs/set_fs.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/uaccess.h | 157 +++++++++++++++-----------------
>  1 file changed, 71 insertions(+), 86 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
