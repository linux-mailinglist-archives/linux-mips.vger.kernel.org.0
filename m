Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472B91BE991
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 23:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgD2VG5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 17:06:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:60848 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgD2VG4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 17:06:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTtuv-0005Q3-02; Wed, 29 Apr 2020 23:06:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 903C9C0355; Wed, 29 Apr 2020 23:04:39 +0200 (CEST)
Date:   Wed, 29 Apr 2020 23:04:39 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] MIPS: ingenic: DTS: Add nodes for the
 watchdog/PWM/OST
Message-ID: <20200429210439.GC24583@alpha.franken.de>
References: <20200413152633.198301-1-paul@crapouillou.net>
 <20200413152633.198301-8-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413152633.198301-8-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 13, 2020 at 05:26:28PM +0200, Paul Cercueil wrote:
> Add the TCU nodes to the JZ4780, JZ4770 and JZ4740 devicetree files.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 14 +++++++++++
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 34 ++++++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 24 ++++++++++++++++++
>  3 files changed, 72 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
