Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2181833FAC2
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 23:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhCQWHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 18:07:38 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:45777 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCQWHe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 18:07:34 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F318060005;
        Wed, 17 Mar 2021 22:07:28 +0000 (UTC)
Date:   Wed, 17 Mar 2021 23:07:28 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     UNGLinuxDriver@microchip.com, paulburton@kernel.org,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: generic: use true and false for bool variable
Message-ID: <YFJ9oCfL8gWWPh7b@piout.net>
References: <1615792543-73864-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615792543-73864-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 15/03/2021 15:15:43+0800, Yang Li wrote:
> fixed the following coccicheck:
> ./arch/mips/generic/board-ocelot.c:29:9-10: WARNING: return of 0/1 in
> function 'ocelot_detect' with return type bool
> 

Can you elaborate why this is an issue and what exactly is fixed?
Even the original coccinelle script submission doesn't give any good
reason.

bool in Linux is _Bool and, as per C99, it holds either 0 or 1, not true
or false.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
