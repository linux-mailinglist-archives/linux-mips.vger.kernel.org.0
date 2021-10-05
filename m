Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50994222CE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Oct 2021 11:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhJEJ5P convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 5 Oct 2021 05:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJ5P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Oct 2021 05:57:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B6AC06161C
        for <linux-mips@vger.kernel.org>; Tue,  5 Oct 2021 02:55:24 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mXhAM-00075F-Lv; Tue, 05 Oct 2021 11:55:18 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mXhAL-0004jx-Dg; Tue, 05 Oct 2021 11:55:17 +0200
Message-ID: <f8919a94816f6c26ac8e4fac08a206f8a24e9885.camel@pengutronix.de>
Subject: Re: [PATCH] reset: pistachio: Re-enable driver selection
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 05 Oct 2021 11:55:17 +0200
In-Reply-To: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
References: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2021-09-14 at 11:15 +0200, Geert Uytterhoeven wrote:
> After the retirement of MACH_PISTACHIO, the Pistachio Reset Driver is no
> longer auto-enabled when building a kernel for Pistachio systems.
> Worse, the driver cannot be enabled by the user at all (unless
> compile-testing), as the config symbol is invisible.
> 
> Fix this partially by making the symbol visible again when compiling for
> MIPS, and dropping the useless default.  The user still has to enable
> the driver manually when building a kernel for Pistachio systems,
> though.
> 
> Fixes: 104f942b2832ab13 ("MIPS: Retire MACH_PISTACHIO")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you, applied to reset/fixes.

regards
Philipp
