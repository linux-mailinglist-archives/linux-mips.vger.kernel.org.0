Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDFF22AB7D
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 11:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGWJMp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 05:12:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:46184 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgGWJMp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Jul 2020 05:12:45 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jyXHN-0001Ij-00; Thu, 23 Jul 2020 11:12:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2BD9DC092F; Thu, 23 Jul 2020 11:10:44 +0200 (CEST)
Date:   Thu, 23 Jul 2020 11:10:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     hauke@hauke-m.de, zajec5@gmail.com, robh+dt@kernel.org,
        f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 9/9] mips: bmips: dts: add BCM63268 power domain
 support
Message-ID: <20200723091044.GC2749@alpha.franken.de>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-10-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200613082140.2009461-10-noltari@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 13, 2020 at 10:21:40AM +0200, Álvaro Fernández Rojas wrote:
> BCM63268 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v4: no changes.
>  v3: Separate dt-bindings definitions from power domain .dtsi support.
>  v2: Add dt-bindings header files.
> 
>  arch/mips/boot/dts/brcm/bcm63268.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
