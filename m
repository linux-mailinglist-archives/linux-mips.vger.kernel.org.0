Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E363F059B
	for <lists+linux-mips@lfdr.de>; Wed, 18 Aug 2021 16:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbhHROE7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Aug 2021 10:04:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53041 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235822AbhHROE7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Aug 2021 10:04:59 -0400
Received: (qmail 194239 invoked by uid 1000); 18 Aug 2021 10:04:23 -0400
Date:   Wed, 18 Aug 2021 10:04:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: host: remove dead EHCI support for on-chip PMC
 MSP71xx USB controller
Message-ID: <20210818140423.GA193695@rowland.harvard.edu>
References: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
 <20210818071137.22711-2-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818071137.22711-2-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 18, 2021 at 09:11:35AM +0200, Lukas Bulwahn wrote:
> Commit 1b00767fd8e1 ("MIPS: Remove PMC MSP71xx platform") deletes
> ./arch/mips/pmcs-msp71xx/Kconfig, including its config  MSP_HAS_USB.
> 
> Hence, since then, the corresponding EHCI support for on-chip PMC MSP71xx
> USB controller is dead code. Remove this dead driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
