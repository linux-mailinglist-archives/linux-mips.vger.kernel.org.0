Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D5D3B8286
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 14:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhF3M46 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Jun 2021 08:56:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:59651 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234719AbhF3M46 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 08:56:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lyZjT-0007Hs-00; Wed, 30 Jun 2021 14:54:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A29A3C073D; Wed, 30 Jun 2021 14:37:56 +0200 (CEST)
Date:   Wed, 30 Jun 2021 14:37:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, paul@crapouillou.net,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v4 0/5] Misc Ingenic patches.
Message-ID: <20210630123756.GA7139@alpha.franken.de>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 26, 2021 at 02:18:36PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Some misc patches that don't really have any relation
> between themselves.
> 
> 周琰杰 (Zhou Yanjie) (5):
>   MIPS: X1830: Respect cell count of common properties.
>   dt-bindings: clock: Add documentation for MAC PHY control bindings.
>   MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
>   MIPS: CI20: Reduce clocksource to 750 kHz.
>   MIPS: CI20: Add second percpu timer for SMP.
> 
>  .../devicetree/bindings/clock/ingenic,cgu.yaml     |  2 ++
>  arch/mips/boot/dts/ingenic/ci20.dts                | 24 +++++++++++++---------
>  arch/mips/boot/dts/ingenic/x1000.dtsi              |  7 +++++++
>  arch/mips/boot/dts/ingenic/x1830.dtsi              | 16 ++++++++++-----
>  4 files changed, 34 insertions(+), 15 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
