Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2369083B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Feb 2023 13:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjBIMLU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Feb 2023 07:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjBIMLA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Feb 2023 07:11:00 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 597888A58
        for <linux-mips@vger.kernel.org>; Thu,  9 Feb 2023 04:08:48 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pQ5jK-0008Pq-00; Thu, 09 Feb 2023 13:08:46 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 056EBC26B8; Thu,  9 Feb 2023 13:07:30 +0100 (CET)
Date:   Thu, 9 Feb 2023 13:07:30 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] MIPS: BCM47XX: Add support for Linksys E2500 V3
Message-ID: <20230209120730.GA11168@alpha.franken.de>
References: <20230208070301.5338-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208070301.5338-1-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 08, 2023 at 08:03:01AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a BCM5358 based home WiFi router. 16 MiB flash, 64 MiB RAM, BCM5325
> switch, on-SoC 802.11n radio.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/mips/bcm47xx/board.c                          | 1 +
>  arch/mips/bcm47xx/buttons.c                        | 9 +++++++++
>  arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h | 1 +
>  3 files changed, 11 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
