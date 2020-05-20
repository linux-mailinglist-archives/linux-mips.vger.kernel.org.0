Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026301DC28D
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 00:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgETW7p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 18:59:45 -0400
Received: from mailrelay4.webfaction.com ([185.20.51.6]:38208 "EHLO
        mailrelay4.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgETW7p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 18:59:45 -0400
Received: from mailrelay3.webfaction.com (mailrelay3.webfaction.com [207.38.93.110])
        by mailrelay4.webfaction.com (Postfix) with ESMTPS id 24267A296F
        for <linux-mips@vger.kernel.org>; Wed, 20 May 2020 22:59:43 +0000 (UTC)
Received: from mailrelay1.webfaction.com (mailrelay1.webfaction.com [207.38.86.46])
        by mailrelay3.webfaction.com (Postfix) with ESMTPS id 777C32A1900
        for <linux-mips@vger.kernel.org>; Wed, 20 May 2020 22:59:41 +0000 (UTC)
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
        by mailrelay1.webfaction.com (Postfix) with ESMTPS id 905E11A0DA2
        for <linux-mips@vger.kernel.org>; Wed, 20 May 2020 22:59:40 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id 307E8600407E2;
        Wed, 20 May 2020 22:59:51 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.
Date:   Thu, 21 May 2020 00:14:22 +0200
Message-ID: <3077290.R152QTsmsV@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <20200519201110.286501-1-paul@crapouillou.net>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <20200519201110.286501-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tuesday 19. May 2020 22.11.10 Paul Cercueil wrote:
> 
> I took the liberty to clean your patch so that it doesn't create a
> struct ingenic_tcu per CPU timer.
> 
> Tested, and fully working on the JZ4770 with CONFIG_SMP disabled, and
> also with CONFIG_SMP enabled (even though JZ4770 has only one CPU) with
> a fixed smp.c and USB disabled (otherwise it crashes at boot).

Thanks for looking at this and also your continuing work with the DRM driver. 
I'll try and look a bit more at the DRM driver for the JZ4780 and see what I 
am doing wrong with regard to JZ4780-specific configuration. In principle, 
there should not be any, but I don't really have the full picture (literally 
and also in terms of documentation or understanding).

One thing that seems to be done with the Imagination/Ingenic drivers is dual 
DMA channel initialisation. Usually, this seems to be necessary only for dual-
panel configurations, and I wonder whether there is some kind of requirement 
for the same arrangement when using the HDMI output.

Another thing that is done involves setting a foreground, which might be 
relevant to your more recent contributions adding IPU support. Again, I don't 
really understand why this seems necessary, but the documentation hardly 
provides any details that might explain it.

Paul
