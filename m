Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10686DBACA
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 14:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDHMRn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 08:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjDHMRm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 08:17:42 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9D3EBEF9C
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 05:17:40 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pl7Vg-000095-00; Sat, 08 Apr 2023 14:17:36 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC732C2433; Sat,  8 Apr 2023 14:17:28 +0200 (CEST)
Date:   Sat, 8 Apr 2023 14:17:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
Message-ID: <20230408121728.GA5953@alpha.franken.de>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
 <984bbd06-0fbf-3c97-32a1-a6b60af4b3d3@roeck-us.net>
 <CD810353-41E9-46ED-AEFB-902B6A4FFD6F@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CD810353-41E9-46ED-AEFB-902B6A4FFD6F@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 08, 2023 at 11:10:32AM +0100, Jiaxun Yang wrote:
> 
> 
> > 2023年4月8日 01:30，Guenter Roeck <linux@roeck-us.net> 写道：
> > 
> > On 4/7/23 15:35, Jiaxun Yang wrote:
> >> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
> >> Add ISA level dependency to Kconfig to fix build.
> >> Reported-by: Guenter Roeck <linux@roeck-us.net>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > 
> > With this patch in place, I still get the second build failure.
> 
> + Thomas
> 
> Seems like PTE bits are overflowing again.

I'm going to revert de34007751aaba992373f2d659001a846aeb8811, which just
solves all new build problems in one go. Then we can try to come up with
a usable solution.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
