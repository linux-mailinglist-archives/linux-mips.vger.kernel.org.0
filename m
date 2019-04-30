Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5794D1012D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 22:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfD3UxD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 16:53:03 -0400
Received: from mleia.com ([178.79.152.223]:57188 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbfD3UxC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 16:53:02 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 6A35D4668DD;
        Tue, 30 Apr 2019 21:53:00 +0100 (BST)
Subject: Re: [PATCH 41/41] drivers: tty: serial: lpc32xx_hs: fill mapsize and
 use it
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, andrew@aj.id.au,
        andriy.shevchenko@linux.intel.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        davem@davemloft.net, jacmet@sunsite.dk, linux@prisktech.co.nz,
        matthias.bgg@gmail.com, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-42-git-send-email-info@metux.net>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <3cfc4396-b152-e9a6-bf29-a4c901ac90e6@mleia.com>
Date:   Tue, 30 Apr 2019 23:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-42-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190430_215300_466850_76BEA83B 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message. 
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Enrico,

On 04/27/2019 03:52 PM, Enrico Weigelt, metux IT consult wrote:
> Fill the struct uart_port->mapsize field and use it, insteaf of

typo, s/insteaf/instead/

> hardcoded values in many places. This makes the code layout a bit
> more consistent and easily allows using generic helpers for the
> io memory handling.
> 
> Candidates for such helpers could be eg. the request+ioremap and
> iounmap+release combinations.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
