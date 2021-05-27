Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B85392CFC
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 13:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbhE0LqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 07:46:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:51722 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234095AbhE0LqS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:46:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmERG-0007z5-01; Thu, 27 May 2021 13:44:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A5FDFC1149; Thu, 27 May 2021 13:42:03 +0200 (CEST)
Date:   Thu, 27 May 2021 13:42:03 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     zhaoxiao <zhaoxiao@uniontech.com>
Cc:     robh+dt@kernel.org, maoxiaochuan@loongson.cn,
        jiaxun.yang@flygoat.com, zhangqing@loongson.cn,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] mips: dts: loongson: fix DTC unit name warnings
Message-ID: <20210527114203.GB9210@alpha.franken.de>
References: <cover.1621586643.git.zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621586643.git.zhaoxiao@uniontech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 21, 2021 at 05:40:23PM +0800, zhaoxiao wrote:
> *** BLURB HERE ***
> 
> zhaoxiao (5):
>   mips: dts: loongson: fix DTC unit name warnings
>   mips: dts: loongson: fix DTC unit name warnings
>   mips: dts: loongson: fix DTC unit name warnings
>   mips: dts: loongson: fix DTC unit name warnings
>   mips: dts: loongson: fix DTC unit name warnings
> 
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi       | 2 +-
>  arch/mips/boot/dts/loongson/loongson64g-package.dtsi     | 4 ++--
>  arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts | 2 +-
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi                | 2 +-
>  arch/mips/boot/dts/loongson/rs780e-pch.dtsi              | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
