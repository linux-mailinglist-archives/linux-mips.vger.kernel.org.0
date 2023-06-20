Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814A6736C57
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jun 2023 14:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjFTMxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jun 2023 08:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjFTMw6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 08:52:58 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0187C10FF
        for <linux-mips@vger.kernel.org>; Tue, 20 Jun 2023 05:52:57 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qBaqt-000880-00; Tue, 20 Jun 2023 14:52:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B074AC0375; Tue, 20 Jun 2023 14:51:02 +0200 (CEST)
Date:   Tue, 20 Jun 2023 14:51:02 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-mips@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] MIPS: PCI: Convert to platform remove callback returning
 void
Message-ID: <20230620125102.GD10520@alpha.franken.de>
References: <20230616165127.1055386-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616165127.1055386-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 16, 2023 at 06:51:27PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> While destroying alignment of the assignments in bridge_driver, do it
> consistently and use a single space before =.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/mips/pci/pci-xtalk-bridge.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
