Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E7B2348CD
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 18:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387620AbgGaP6T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 11:58:19 -0400
Received: from elvis.franken.de ([193.175.24.41]:56726 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387491AbgGaP6T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jul 2020 11:58:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k1XQH-0000Ng-03; Fri, 31 Jul 2020 17:58:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 672E1C0B3C; Fri, 31 Jul 2020 17:57:56 +0200 (CEST)
Date:   Fri, 31 Jul 2020 17:57:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] MIPS: head.S: Init fw_passed_dtb to builtin DTB
Message-ID: <20200731155756.GD16683@alpha.franken.de>
References: <20200730161233.61876-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730161233.61876-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 30, 2020 at 06:12:30PM +0200, Paul Cercueil wrote:
> Init the 'fw_passed_dtb' pointer to the buit-in Device Tree blob when it
> has been compiled in with CONFIG_BUILTIN_DTB.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/kernel/head.S | 6 ++++++
>  1 file changed, 6 insertions(+)

patches 1-4 applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
