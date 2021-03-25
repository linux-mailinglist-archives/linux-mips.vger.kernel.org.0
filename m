Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65338348D9D
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 11:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCYKBc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 06:01:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:58864 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhCYKBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Mar 2021 06:01:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lPMnd-00074f-04; Thu, 25 Mar 2021 11:01:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3205DC1C81; Thu, 25 Mar 2021 11:00:57 +0100 (CET)
Date:   Thu, 25 Mar 2021 11:00:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, sergei.shtylyov@gmail.com,
        thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
Message-ID: <20210325100057.GE5775@alpha.franken.de>
References: <20210317112644.24502-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317112644.24502-1-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 17, 2021 at 12:26:44PM +0100, Krzysztof Kozlowski wrote:
> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: John Crispin <john@phrozen.org>
> 
> ---
> 
> Changes since v1:
> 1. Use EXPORT_SYMBOL_GPL like two other stubs in the file.
> 2. Add Ack
> ---
>  arch/mips/ralink/clk.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
