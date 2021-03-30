Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4E834E897
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 15:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhC3NLk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 09:11:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:37687 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231894AbhC3NLb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 09:11:31 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRE9V-000488-00; Tue, 30 Mar 2021 15:11:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 28385C1E48; Tue, 30 Mar 2021 15:09:44 +0200 (CEST)
Date:   Tue, 30 Mar 2021 15:09:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mips: bmips: fix and improve reboot nodes
Message-ID: <20210330130944.GB11217@alpha.franken.de>
References: <20210314164351.24665-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210314164351.24665-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 14, 2021 at 05:43:45PM +0100, Álvaro Fernández Rojas wrote:
> These patches improve bmips bcm63xx device tree nodes.
> 
> v2: add missing BCM63268 patch.
> 
> Álvaro Fernández Rojas (6):
>   mips: bmips: fix syscon-reboot nodes
>   mips: bmips: bcm6328: populate device tree nodes
>   mips: bmips: bcm6358: populate device tree nodes
>   mips: bmips: bcm6362: populate device tree nodes
>   mips: bmips: bcm6368: populate device tree nodes
>   mips: bmips: bcm63268: populate device tree nodes
> 
>  arch/mips/boot/dts/brcm/bcm3368.dtsi  |   2 +-
>  arch/mips/boot/dts/brcm/bcm63268.dtsi | 132 +++++++++++++++++++++++---
>  arch/mips/boot/dts/brcm/bcm6328.dtsi  | 119 ++++++++++++++++++++---
>  arch/mips/boot/dts/brcm/bcm6358.dtsi  |  85 ++++++++++++++---
>  arch/mips/boot/dts/brcm/bcm6362.dtsi  | 129 ++++++++++++++++++++++---
>  arch/mips/boot/dts/brcm/bcm6368.dtsi  | 129 ++++++++++++++++++++++---
>  6 files changed, 530 insertions(+), 66 deletions(-)

Florian, are you ok with this changes ? If yes, I'm going to apply them
to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
