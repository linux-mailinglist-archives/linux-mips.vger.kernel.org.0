Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63AA27347B
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 22:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgIUU7w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 16:59:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:49843 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728113AbgIUU7o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Sep 2020 16:59:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kKSuS-0001Rx-00; Mon, 21 Sep 2020 22:59:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 404A1C0FE2; Mon, 21 Sep 2020 22:13:29 +0200 (CEST)
Date:   Mon, 21 Sep 2020 22:13:29 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     paul@crapouillou.net, paulburton@kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        jiaxun.yang@flygoat.com, Sergey.Semin@baikalelectronics.ru,
        akpm@linux-foundation.org, rppt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH v2 1/2] MIPS: Ingenic: Add system type for new Ingenic
 SoCs.
Message-ID: <20200921201329.GA29269@alpha.franken.de>
References: <20200921174522.33866-1-zhouyanjie@wanyeetech.com>
 <20200921174522.33866-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200921174522.33866-2-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 22, 2020 at 01:45:21AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> @@ -56,9 +64,13 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
>  	{ .compatible = "ingenic,jz4740", .data = (void *)MACH_INGENIC_JZ4740 },
>  	{ .compatible = "ingenic,jz4725b", .data = (void *)MACH_INGENIC_JZ4725B },
>  	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
> +	{ .compatible = "ingenic,jz4775", .data = (void *)MACH_INGENIC_JZ4775 },
>  	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
>  	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
> +	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
>  	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
> +	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
> +	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },

I get a warning from checkpatch:

WARNING: DT compatible string "ingenic,x2000e" appears un-documented -- check ./Documentation/devicetree/bindings/

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
