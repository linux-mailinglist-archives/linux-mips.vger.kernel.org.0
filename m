Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0353C32DD65
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 23:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhCDWxI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 17:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCDWxH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 17:53:07 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F5F9C061574;
        Thu,  4 Mar 2021 14:53:07 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id B91D092009C; Thu,  4 Mar 2021 23:53:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id B608E92009B;
        Thu,  4 Mar 2021 23:53:03 +0100 (CET)
Date:   Thu, 4 Mar 2021 23:53:03 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Rob Herring <robh@kernel.org>
cc:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
In-Reply-To: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2103042349390.51127@angie.orcam.me.uk>
References: <20210303193305.924384-1-paul@crapouillou.net> <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 3 Mar 2021, Rob Herring wrote:

> > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> 
> I had checked the other built-in cases as microblaze broke too, but
> missed some of the many ways MIPS can have a dtb. Appended and
> built-in DTBs were supposed to be temporary. :(

 How is it supposed to work otherwise when all that a piece of firmware 
loads is an SREC image (over TFTP)?

  Maciej
