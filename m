Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E334A982F
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 12:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbiBDLGC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 4 Feb 2022 06:06:02 -0500
Received: from aposti.net ([89.234.176.197]:55262 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232139AbiBDLGB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Feb 2022 06:06:01 -0500
Date:   Fri, 04 Feb 2022 11:05:50 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/1] clk: jz4725b: fix mmc0 clock gating
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Message-Id: <QH1S6R.BMH4KZNDZAOO3@crapouillou.net>
In-Reply-To: <20220204072141.542909-1-lis8215@gmail.com>
References: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
        <20220204072141.542909-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le ven., févr. 4 2022 at 10:21:40 +0300, Siarhei Volkau 
<lis8215@gmail.com> a écrit :
> The mmc0 clock gate bit was mistakenly assigned to "i2s" clock.
> You can find that the same bit is assigned to "mmc0" too.
> It leads to mmc0 hang for a long time after any sound activity
> also it  prevented PM_SLEEP to work properly.
> I guess it was introduced by copy-paste from jz4740 driver
> where it is really controls I2S clock gate.

Ok, I was wondering why it didn't happen on other JZ4725B devices, it 
turns out they all use NAND + mmc1, and mmc0 is unused.

Can you confirm that the MMC0 controller will work even with the bit 6 
off?

Do you know if the MMC0 bit has been moved elsewhere, or the MMC0 
controller is permanently enabled?

Cheers,
-Paul


