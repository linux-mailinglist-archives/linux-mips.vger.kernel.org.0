Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBA3222022
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgGPKB7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:01:59 -0400
Received: from elvis.franken.de ([193.175.24.41]:38162 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgGPKB6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-01; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5BBACC080E; Thu, 16 Jul 2020 11:55:01 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:55:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     paulburton@kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Replace HTTP links with HTTPS ones
Message-ID: <20200716095501.GE8455@alpha.franken.de>
References: <59938583-2ce4-c7bf-c454-89a1559be846@flygoat.com>
 <20200714191226.48652-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714191226.48652-1-grandmaster@al2klimov.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 09:12:26PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  arch/mips/Kconfig           | 2 +-
>  arch/mips/include/asm/war.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
