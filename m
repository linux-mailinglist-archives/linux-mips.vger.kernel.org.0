Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2108D492A86
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jan 2022 17:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346731AbiARQK6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jan 2022 11:10:58 -0500
Received: from angie.orcam.me.uk ([78.133.224.34]:38964 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347071AbiARQJf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jan 2022 11:09:35 -0500
X-Greylist: delayed 507 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jan 2022 11:09:35 EST
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 53D4392009C; Tue, 18 Jan 2022 17:01:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 4589B92009B;
        Tue, 18 Jan 2022 16:01:05 +0000 (GMT)
Date:   Tue, 18 Jan 2022 16:01:05 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] MIPS: signal: Remove unnecessary DEBUG_SIG related
 code
In-Reply-To: <20220102133231.GH3468@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2201180646170.19178@angie.orcam.me.uk>
References: <1639974460-3278-1-git-send-email-yangtiezhu@loongson.cn> <1639974460-3278-4-git-send-email-yangtiezhu@loongson.cn> <20220102133231.GH3468@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2 Jan 2022, Thomas Bogendoerfer wrote:

> > DEBUG_SIG is not defined on MIPS, so DEBUGP() is an empty function.
> > Additionally, it is unacceptable to printk messages in the normal
> > path of signal handling, the system can not work well if DEBUG_SIG
> > is defined, so just remove the related code.
> 
> I like to keep this debug aid for now.

 And it is perhaps worth noting that we have similar developer aids in 
many places across our code base.

  Maciej
