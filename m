Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C683F33E0FC
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 22:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhCPV7P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 17:59:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:35172 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhCPV7D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Mar 2021 17:59:03 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lMHiN-00059F-00; Tue, 16 Mar 2021 22:58:59 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EA85BC08CC; Tue, 16 Mar 2021 22:58:20 +0100 (CET)
Date:   Tue, 16 Mar 2021 22:58:20 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
Message-ID: <20210316215820.GA18064@alpha.franken.de>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 16, 2021 at 06:57:25PM +0100, Krzysztof Kozlowski wrote:
> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

hmm, why not make it use common clock framework ? And shouldn't 
include/linux/clk.h provide what you need, if CONFIG_HAVE_CLK is not set ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
