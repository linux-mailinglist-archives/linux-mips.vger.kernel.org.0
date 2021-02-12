Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C73319B74
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 09:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBLIrD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 03:47:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhBLIq7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Feb 2021 03:46:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B757764D73;
        Fri, 12 Feb 2021 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613119579;
        bh=63mjsAMMpQu6KoWo7n3wRfwrwyLH6TRv4ATBrN7lEGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZmbPlAdn6VKR6AKQRAfW8o+aC3o6WMu6iqqUzzrnfJkhkLk60sd8onZcoOQGC7Kx3
         DHSZL+vt+NY6/feTsXl01rL6H1uZQsSIuk3pRDq6TIyqK/lbTwF7NOsamCU02MQYGj
         7XzWOcuHriPTJFr6fkVZyLtTU8a+ZfwAEtvpeD2k=
Date:   Fri, 12 Feb 2021 09:46:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     sboyd@kernel.org, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, john@phrozen.org,
        linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v5 4/6] staging: mt7621-dts: make use of new
 'mt7621-clk'
Message-ID: <YCZAWM+wjuXzrHW/@kroah.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
 <20210212074330.4650-5-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212074330.4650-5-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 12, 2021 at 08:43:28AM +0100, Sergio Paracuellos wrote:
> Clocks for SoC mt7621 have been properly integrated so there is
> no need to declare fixed clocks at all in the device tree. Remove
> all of them, add new device tree nodes for mt7621-clk and update
> the rest of the nodes to use them.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
