Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FF930FEFC
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 22:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhBDVBO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 16:01:14 -0500
Received: from elvis.franken.de ([193.175.24.41]:52893 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhBDVBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 16:01:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7ljq-0002rO-01; Thu, 04 Feb 2021 22:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4D99BC0D71; Thu,  4 Feb 2021 21:59:13 +0100 (CET)
Date:   Thu, 4 Feb 2021 21:59:13 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>,
        Birger Koblitz <mail@birger-koblitz.de>
Subject: Re: [PATCH v4 5/5] mips: dts: Add support for Cisco SG220-26 switch
Message-ID: <20210204205913.GB19460@alpha.franken.de>
References: <20210119092109.185282-1-bert@biot.com>
 <20210119092109.185282-6-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119092109.185282-6-bert@biot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 19, 2021 at 10:21:09AM +0100, Bert Vermeulen wrote:
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  arch/mips/Kconfig                             | 10 ++++++++
>  arch/mips/boot/dts/realtek/Makefile           |  2 ++
>  arch/mips/boot/dts/realtek/cisco_sg220-26.dts | 25 +++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 arch/mips/boot/dts/realtek/Makefile
>  create mode 100644 arch/mips/boot/dts/realtek/cisco_sg220-26.dts
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0986d0c4405f..a398416842ca 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1055,6 +1055,16 @@ config NLM_XLP_BOARD
>  
>  endchoice
>  
> +if MACH_REALTEK_RTL
> +choice
> +	prompt "Realtek RTL838x/RTL839x-based switch"
> +	optional
> +
> +	config DT_CISCO_SG220_26
> +		bool "Cisco SG220-26"
> +endchoice
> +endif
> +

I've dropped that while applying, because it's just one DT so far and if
there are more of them, please move to arch/mips/realtek/Kconfig

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
