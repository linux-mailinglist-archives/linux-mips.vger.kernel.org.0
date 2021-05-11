Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5644337B03E
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 22:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhEKUtW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 16:49:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:50417 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229924AbhEKUtW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 16:49:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZIb-0003nj-01; Tue, 11 May 2021 22:48:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 31031C0E42; Tue, 11 May 2021 22:41:47 +0200 (CEST)
Date:   Tue, 11 May 2021 22:41:47 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Xiaochuan Mao <maoxiaochuan@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS:DTS:Correct device id of pcie for Loongnon-2K
Message-ID: <20210511204147.GB18185@alpha.franken.de>
References: <20210428120628.21041-1-maoxiaochuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428120628.21041-1-maoxiaochuan@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 28, 2021 at 08:06:28PM +0800, Xiaochuan Mao wrote:
> from Loongson-2K user manual know that Loongson-2K have two
> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
> in each pcie controller and others are 7a09.
> 
> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
> ---
> v1:
> revert class code
> ---
>  .../boot/dts/loongson/loongson64-2k1000.dtsi     | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
