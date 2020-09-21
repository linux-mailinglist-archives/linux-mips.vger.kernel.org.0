Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72AA7273478
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 22:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgIUU7w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 16:59:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:49842 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728087AbgIUU7o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-03; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 67CF5C0FE4; Mon, 21 Sep 2020 22:25:01 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:25:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH 1/1] MIPS: Ingenic: Add CPU nodes for Ingenic SoCs.
Message-ID: <20200921202501.GC29322@alpha.franken.de>
References: <20200919113859.88566-1-zhouyanjie@wanyeetech.com>
 <20200919113859.88566-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200919113859.88566-2-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 19, 2020 at 07:38:59PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add 'cpus' node to the jz4725b.dtsi, jz4740.dtsi, jz4770.dtsi,
> jz4780.dtsi, x1000.dtsi, and x1830.dtsi files.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4725b.dtsi | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4740.dtsi  | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/jz4770.dtsi  | 15 ++++++++++++++-
>  arch/mips/boot/dts/ingenic/jz4780.dtsi  | 23 +++++++++++++++++++++++
>  arch/mips/boot/dts/ingenic/x1000.dtsi   | 14 ++++++++++++++
>  arch/mips/boot/dts/ingenic/x1830.dtsi   | 14 ++++++++++++++
>  6 files changed, 93 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
