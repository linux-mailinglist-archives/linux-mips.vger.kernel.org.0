Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C0D444620
	for <lists+linux-mips@lfdr.de>; Wed,  3 Nov 2021 17:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhKCQqa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 12:46:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:58774 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232933AbhKCQq1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Nov 2021 12:46:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1miJMb-000872-00; Wed, 03 Nov 2021 17:43:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D507CC2929; Wed,  3 Nov 2021 17:36:17 +0100 (CET)
Date:   Wed, 3 Nov 2021 17:36:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] MIPS: Cobalt: Explain GT64111 early PCI fixup
Message-ID: <20211103163617.GA9984@alpha.franken.de>
References: <20211101150405.14618-1-pali@kernel.org>
 <20211102171259.9590-1-pali@kernel.org>
 <20211102171259.9590-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102171259.9590-2-pali@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 02, 2021 at 06:12:59PM +0100, Pali Rohár wrote:
> Properly document why changing PCI Class Code for GT64111 device to Host
> Bridge is required as important details were after 20 years forgotten.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> 
> ---
> Changes in v2:
> * Split from ARM changes
> * Removal of Kconfig changes
> * Explanation is completely rewritten as as this MIPS Cobalt device
>   predates ARM Orion devices and reason is slightly different.
> ---
>  arch/mips/pci/fixup-cobalt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
