Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03405219AC6
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 10:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgGII16 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 04:27:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:55541 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbgGII15 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jul 2020 04:27:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jtRuN-0000pk-00; Thu, 09 Jul 2020 10:27:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6CF68C07D4; Thu,  9 Jul 2020 10:09:23 +0200 (CEST)
Date:   Thu, 9 Jul 2020 10:09:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Loongson64: Make acpi_registers_setup()
 static
Message-ID: <20200709080923.GA6983@alpha.franken.de>
References: <20200703035736.6803-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703035736.6803-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 03, 2020 at 11:57:36AM +0800, Wei Yongjun wrote:
> sparse report build warning as follows:
> 
> drivers/platform/mips/rs780e-acpi.c:72:6: warning:
>  symbol 'acpi_registers_setup' was not declared. Should it be static?
> 
> And function acpi_registers_setup() is not used outside of this file,
> so marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/mips/rs780e-acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
