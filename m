Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458671DEFD5
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 21:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730795AbgEVTQb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 15:16:31 -0400
Received: from mail6.webfaction.com ([31.170.123.134]:38080 "EHLO
        smtp.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730689AbgEVTQb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 May 2020 15:16:31 -0400
X-Greylist: delayed 159412 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 May 2020 15:16:31 EDT
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id 26962600A884E;
        Fri, 22 May 2020 19:16:44 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.
Date:   Fri, 22 May 2020 21:16:10 +0200
Message-ID: <1902082.ZKqtjM8ATQ@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <RVFQAQ.7WL51YCH3VE1@crapouillou.net>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <3077290.R152QTsmsV@jeremy> <RVFQAQ.7WL51YCH3VE1@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Friday 22. May 2020 14.26.15 Paul Cercueil wrote:
> Hi Paul,
> 
> I think the ingenic-drm driver is fine, even though the old 3.8 kernel
> worked differently, the IP is backwards-compatible so it should work no
> problem. I think the problem is somewhere in the Synopsis HDMI code or
> the glue code. Because the LCDC does seem to send data, which is not
> encoded properly by the HDMI chip.

There was one interesting insight related to vertical blank interrupts, where 
it would appear that the end-of-frame condition does not occur, with this 
failure then obstructing driver initialisation. I aim to look into that 
further.

Indeed, to approach this from another angle, I started to experiment with the 
HDMI peripheral in the L4 Runtime Environment, which has been helpful when 
investigating things like the RTC chip on the CI20 and its interaction with 
the power management system. I have previously demonstrated the LCD controller 
initialisation in this environment for other Ingenic devices, so I should have 
a chance of building on that success without too many added complications.

So far, I have managed to reproduce EDID retrieval using the HDMI peripheral's 
own I2C support, and I plan to reproduce the HDMI peripheral initialisation 
itself. However, it is perhaps more interesting to get the LCD controller 
working first and potentially delivering end-of-frame interrupts: this might 
help me understand whether this problem is a serious obstacle or not.

Paul
